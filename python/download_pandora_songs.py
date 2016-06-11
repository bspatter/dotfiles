#! /usr/bin/env/python

# Almost all of this script is borrowed from other places:
#
# I learned to get the pandora likes from here
# https://github.com/rupert/pandora-to-google-music/blob/master/pandora_to_google_music.py
#
# All information about using the youtube downloader was from here:
# https://github.com/rg3/youtube-dl


# Import necessary libraries
from __future__ import unicode_literals
import re
import sys
import youtube_dl
from getpass import getpass
from collections import defaultdict
import requests
from termcolor import colored
from lxml import html
import unidecode
import urllib2
if (sys.version_info > (3, 0)):
    from urllib.request import urlopen
    from urllib.parse import quote_plus as qp
    raw_input = input
else:
    from urllib2 import urlopen
    from urllib import quote_plus as qp


def my_hook(d):
    if d['status'] == 'finished':
        print('Done downloading, now converting ...')


class LoginException(Exception):
    pass

# Define the PandoraClient Class that is used to get liked tracks
class PandoraClient(object):
    LOGIN_URL = "https://www.pandora.com/login.vm"
    LIKES_URL = "http://www.pandora.com/content/tracklikes"
    STATIONS_URL = "http://www.pandora.com/content/stations"

    def __init__(self, email, password):
        self.session = requests.session()

        response = self.session.post(PandoraClient.LOGIN_URL, data={
            "login_username": email,
            "login_password": password,
        })

        if "0;url=http://www.pandora.com/people/" not in response.text:
            raise LoginException("Pandora login failed, check email and password")

    def liked_tracks(self):
        """ Scrape likes from the Pandora web interface """

        like_start_index = 0
        thumb_start_index = 0

        tracks = defaultdict(list)
        more_pages = True
        page = 1

        while more_pages:
            response = self.session.get(PandoraClient.LIKES_URL, params={
                "likeStartIndex": like_start_index,
                "thumbStartIndex": thumb_start_index,
            })

#            print_section_heading('Fetching Pandora Likes (page %d)' % page)

            tree = html.fromstring(response.text)

            for element in tree.find_class("infobox-body"):
                title = unicode(element.find("h3").text_content())
                title = title.strip()

                artist = unicode(element.find("p").text_content())
                artist = artist.strip()
                artist = re.sub(r"^by\s+", "", artist)

                station_elements = element.find_class("like_context_stationname")

                if station_elements:
                    station_name = unicode(station_elements[0].text_content())
                    station_name = station_name.strip()
                else:
                    # Bookmarked track
                    station_name = None

                tracks[station_name].append((artist, title))

#                print_song(artist, title)

            more_elements = tree.find_class("show_more")

            # There are more pages
            if more_elements:
                like_start_index = more_elements[0].get("data-nextlikestartindex")
                thumb_start_index = more_elements[0].get("data-nextthumbstartindex")
            else:
                more_pages = False


            page += 1

        return tracks

    def stations(self):
        """ Scrape station names from the Pandora web interface """

        response = self.session.get(PandoraClient.STATIONS_URL)
        tree = html.fromstring(response.text)

        stations = []

        for element in tree.findall(".//h3"):
            station_name = unicode(element.text_content().strip())
            stations.append(station_name)

        return stations

##
##
def print_section_heading(heading):
    """ Print an underlined heading """

    print
    print u"%s\n%s" % (heading, "=" * len(heading))


##
##
def print_song(artist, title, indicator="", colour=None):
    """ Print a song """

    if indicator:
        indicator = "[%s] " % indicator

    print colored(
        u"{indicator}{artist} - {title}".format(
            indicator=indicator,
            artist=artist,
            title=title
        ),
        colour
    )




################## Input options #########################
#
# 
output_directory="."
#
#
# youtube downloader options
ydl_opts = {
        'format': 'bestaudio/best',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
#        'logger': MyLogger(),
#        'progress_hooks': [my_hook],
        'ignoreerrors': True,    
        "outtmpl": output_directory+"/%(title)s.%(ext)s",
    }
#
#
#
# Main Code
#
#
# Get pandora likes list
pandora_email = raw_input("Pandora email: ")
pandora_password = getpass("Pandora password: ")

pandora_client = PandoraClient(pandora_email, pandora_password)

# Get liked Pandora tracks
print "\nGetting list of liked songs from pandora ...\n\n"
pandora_likes = pandora_client.liked_tracks()
pandora_like_count = sum(len(x) for x in pandora_likes.values())

# Get Pandora stations
pandora_stations = set(pandora_client.stations())
pandora_playlists = defaultdict(list)



# Loop over liked songs, download youtube vid, and convert to .mp3
idlist = []
for playlist_name, songs in pandora_likes.items():
    songstr = unidecode.unidecode(songs[0][0]+" - "+songs[0][-1])

    line = songstr.strip()
    url = "https://www.youtube.com/results?search_query={}".format(line.replace(' ', '+'))


    pagedata = urllib2.urlopen(url, timeout=100)
    results = pagedata.read()
    found = re.search('"/watch\?v=(.*?)"', results)

    if(found):
        print "\n"+songstr

        idlist.append(found.group(1))
        
        videoid=idlist[-1]
        
        songvidurl="https://www.youtube.com/watch?v={}".format(videoid)

        with youtube_dl.YoutubeDL(ydl_opts) as ydl:
            ydl.download([songvidurl])

