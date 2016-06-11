#from __future__ import print_function
from __future__ import unicode_literals

import os
import re
import sys

import youtube_dl

from bs4 import BeautifulSoup
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


output_directory="./mp3files"

# youtube downloader options
ydl_opts = {
        'format': 'bestaudio/best',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
#        'logger': MyLogger(),
        'progress_hooks': [my_hook],
        'ignoreerrors': True,    
        "outtmpl": output_directory+"/%(title)s.%(ext)s",

    }



# Input text file of youtube likes, copied from http://pandorasongs.oliverzheng.com into a text file. Note: site requires public profile
inputfile='PandoraTrackList_brian.txt'


# Open song list and read
with open(inputfile, 'r') as infile:
    data = infile.read()

    idlist = []
    for line in data.splitlines():

        line = line.strip()
        url = "https://www.youtube.com/results?search_query={}".format(line.replace(' ', '+'))

        print line

        pagedata = urllib2.urlopen(url, timeout=100)
        results = pagedata.read()
        found = re.search('"/watch\?v=(.*?)"', results)

        if(found):
            idlist.append(found.group(1))

            videoid=idlist[-1]

            songvidurl="https://www.youtube.com/watch?v={}".format(videoid)

            print"\n\n"+songvidurl+"\n\n"

            with youtube_dl.YoutubeDL(ydl_opts) as ydl:
                ydl.download([songvidurl])





####################################################################################################



## Bits and defs that are currently unused or broken
# class MyLogger(object):
#     def debug(self, msg):
#         pass

#     def warning(self, msg):
#         pass

#     def error(self, msg):
#         print(msg)

        


# def extract_videos(html):
#     soup = BeautifulSoup(html, 'html5lib')
#     pattern = re.compile(r'/watch\?v=')
#     found = soup.find_all('a', 'yt-uix-tile-link', href=pattern)
#     return [(x.text.encode('utf-8'), x.get('href')) for x in found]


# def search_videos(query):
#     response = urlopen('https://www.youtube.com/results?search_query=' + query)
#     return extract_videos(response.read())
