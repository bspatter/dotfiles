#################  Put functions for any ubuntu computer below this line  ##########################

#function jpg2pdf { while [ -n "$1" ]; do convert "$1" "$1".pdf; rename 's/\.jpg(\.pdf)$/$1/' "$1".pdf; shift; done;}
function jpg2pdf() { while [ -n "$1" ]; do convert "$1" "$1".pdf; rename 's/\.jpg(\.pdf)$/$1/' "$1".pdf; shift; done; rm *.jpg.pdf;}

function convh264() { ffmpeg -y -i $1 -an -vcodec libx264 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -crf 18 $2;}


#Get or set the number of threads to use in the terminal
function spn() {
if  [  $# -gt 0 ]; then
export OMP_NUM_THREADS=$1;
fi
echo "OMP_NUM_THREADS=$OMP_NUM_THREADS"
}


function wordsearch() {
grep -rnwi $1 -e "$2"
}



function email() {
echo $3 | mutt -s "$2" $1 &
}
#Example: Send email with subject "woo", attachment "attachment", and message "booya" to recipient@gmail.com
#email "-a /path/to/attachment -- recipient@gmail.com" "woo" "booya"

function sf() { $1 $2 $3 $4 $5 $6 $7 $8 $9 >/dev/null 2>&1 & }


#Specifically for lagrange
#################  Put functions specifically for Lagrange below this line  ##########################

#copy figure to my notes
function cpnotes() { cp $1 /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes/figs/$2; }

# copy to ctools subgroup folder
function cpcsg() { cp $1 "/mnt/ctools/cfpl/Group meeting research/Cavitation Subgroup/$2"; }
function cpssg() { cp $1 "/mnt/ctools/cfpl/Group meeting research/Shocks, turbulence and plasmas subgroup/$2"; }
function cpmsg() { cp $1 "/mnt/ctools/cfpl/Group meeting research/Subgroup: Multiphase Simulations/$2"; }



# copy to my home computer (wonderland)
function w2l() { Wip=`awk 'NR==1' /hdd/Users/awesome/Dropbox/scripts/Wonderland_ip.txt`; rsync -rvza -e 'ssh -p 626' --progress brandon@$Wip:$1 $2;}

# Temporary function to copy figures to conference figures
function cpindy() { cp $1 /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2014_Indianapolis/figs/$2; }

function cppitts() { cp $1 /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2015_pittsburgh/figs/$2; }

function cpjacks() { cp $1 /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2015_jacksonville/figs/$2; }


#rsync to stampede
function 2stamp() { rsync -rvzau --progress "$1" bspatter@login1.stampede.tacc.utexas.edu:/home1/03773/bspatter/$2; }

