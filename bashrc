# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    test -r ~/.mydircolors && eval "$(dircolors -b ~/.mydircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -l1t'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi



# Add some keyboard mappings
xmodmap ~/.xmodmap

#########################################################################################################################
#########################################################################################################################
############################# VARIABLES, ALIASES, & FUNCTIONS FOR ANY UBUNTU COMPUTER  ##################################
#########################################################################################################################
#########################################################################################################################


# variables to export for any ubuntu computer 
export EDITOR="emacs -nw"
OMP_NUM_THREADS=1
export OMP_NUM_THREADS=$OMP_NUM_THREADS

#  My general terminal aliases for any ubuntu computer
alias n.='nautilus . '
alias ..='cd .. '
alias ..2='cd ../.. '
alias ..3='cd ../../.. '
alias cdr='cd "$(\ls -1dt */ | head -n 1)"'
alias e='emacs -nw '
alias se='sudo emacs -nw '
alias clc='clear '
alias sn='screen -S '
alias sl='screen -list'
alias sr='screen -r '
alias sd='screen -d '
alias ins='sudo apt -y install '
alias update='sudo apt -y update '
alias upgrade='sudo apt -y full-upgrade '
alias sbc='source ~/.bashrc '
alias ebc='emacs -nw ~/.bashrc '
alias eec='emacs -nw ~/.emacs '
alias v='vim '
alias up='update && upgrade '
alias rs='rsync -rvzau --progress '
alias acs='apt-cache search '
alias ut='tar -zxvf '


#################  Put functions for any ubuntu computer below this line  ##########################

#function jpg2pdf { while [ -n "$1" ]; do convert "$1" "$1".pdf; rename 's/\.jpg(\.pdf)$/$1/' "$1".pdf; shift; done;}
function jpg2pdf { while [ -n "$1" ]; do convert "$1" "$1".pdf; rename 's/\.jpg(\.pdf)$/$1/' "$1".pdf; shift; done; rm *.jpg.pdf;}
export -f jpg2pdf

function convh264 { ffmpeg -y -i $1 -an -vcodec libx264 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -crf 18 $2;}
export -f convh264


#Get or set the number of threads to use in the terminal
function spn {
if  [  $# -gt 0 ]; then
export OMP_NUM_THREADS=$1;
fi
echo "OMP_NUM_THREADS=$OMP_NUM_THREADS"
}
export -f spn

function wordsearch {
grep -rnwi $1 -e "$2"
}
export -f wordsearch


function email {
echo $3 | mutt -s "$2" $1 &
}
export -f email
#Example: Send email with subject "woo", attachment "attachment", and message "booya" to recipient@gmail.com
#email "-a /path/to/attachment -- recipient@gmail.com" "woo" "booya"

function sf { $1 $2 $3 $4 $5 $6 $7 $8 $9 >/dev/null 2>&1 & }
export -f sf


#calc(){ awk "BEGIN{ print $* }" ;}
=() {
    calc="${@//p/+}"
    calc="${calc//x/*}"
    echo "$(($calc))"
}

#pics2avi
#System "mencoder mf://pics/*.jpg -mf fps=10:type=jpg -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o $2";
#System "avconv -i output.avi -vcodec mpeg4 -b:v 1200k -flags +aic+mv4 output.mp4"; // from http://andrebluehs.net/blog/2012/05/converting-avi-to-mp4-with-ffmpeg/



#########################################################################################################################
#########################################################################################################################
############################# VARIABLES, ALIASES, & FUNCTIONS SPECIFICALLY FOR LAGRANGE #################################
#########################################################################################################################
#########################################################################################################################

# Variables to export specifically for lagrange
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH # Export path for MB-system (for plotting bathymetry data)
export PATH=/usr/lib/gmt/bin:$PATH
export PATH=/home/awesome/tmp/marcs_code/dg/code/scripts:$PATH
export PYTHONPATH=/home/awesome/tmp/marcs_code/dg/code/scripts:$PYTHONPATH
export CUDA_HOME=/usr/local/cuda-7.0
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
PATH=${CUDA_HOME}/bin:${PATH} 
export PATH


#  My terminal aliases for specifically for lagrange
alias down='cd /hdd/Users/awesome/Downloads '
alias tmp='cd /home/awesome/tmp '
alias code='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode '
alias setup='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode; emacs -nw src/Setup.cpp '
alias setbat='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode; vim runbatch.sh '
alias ecode='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode; nohup geany ./src/Setup.cpp& clear; wmctrl -a guake; clear; '
alias research='cd /hdd/Users/awesome/Dropbox/Research '
alias lit='cd /hdd/Users/awesome/Dropbox/Research/literature '
alias ram='cd /hdd/Users/awesome/Dropbox/Research/Acoustic_Uncertainty/ram '
alias drop='cd /hdd/Users/awesome/Dropbox '
alias out='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/out '
alias cap='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/out/CapillaryIn '
alias uso='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/out/US-CapillaryIn '
alias awesome='cd /hdd/Users/awesome '
alias cfd='cd /hdd/Users/awesome/Dropbox/Research/CFD/ '
alias prep='cd /hdd/Users/awesome/Dropbox/Research/CFD/Preparation '
alias lung='cd /hdd/Users/awesome/Dropbox/Research/CFD/OldCode/Lung/Lung_2D_linux '
alias lungs='cd /hdd/Users/awesome/Dropbox/Research/CFD/OldCode/Lung/Lung_2D_linux_s '
alias business="cd /hdd/Users/awesome/Dropbox/business "
alias mk='clear; make '
alias mp='clear; make DEFS=OMP_FLAG '
alias mkr='clear; make; clear; ./bin/exec '
alias mpr='clear; make DEFS=OMP_FLAG; ./bin/exec '
alias g+='clear; g++ -O3 '
alias cln='make clean; clear '
alias run='clear; ./bin/exec '
alias cmr='clear; make clean; make; clear; ./bin/exec '
alias matnd='matlab -nosplash -nodisplay '
alias wonder='sh /hdd/Users/awesome/Dropbox/scripts/2Wonderland '
alias wonderx='sh /hdd/Users/awesome/Dropbox/scripts/2WonderlandX '
alias vonk='ssh awesome@vonkarman.engin.umich.edu '
#alias upvonk="rsync -rvza /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/src awesome@vonkarman.engin.umich.edu:/home/awesome/MyCode/src &&
#rsync -rvza /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/include awesome@vonkarman.engin.umich.edu:/home/awesome/MyCode/include; "
alias upvonk="rsync -rvza /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/src /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/include awesome@vonkarman.engin.umich.edu:/home/awesome/MyCode/ "
alias jlab='sshfs awesome@johnsenlab.engin.umich.edu:/ ~/johnsenlab'
alias jdata='sshfs awesome@johnsenlab.engin.umich.edu:/labdata/awesome ~/backup'
alias gg='nohup gitg /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/& clc '
alias notes='cd /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes '
alias cnotes='evince /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes/Research_Notes.pdf > /dev/null 2>&1 &disown; echo '
alias enotes='emacs -nw /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes/Research_Notes.tex '
alias prelim='cd /hdd/Users/awesome/Dropbox/Research/Papers,etc/prelim/ '
alias cprelim='evince /hdd/Users/awesome/Dropbox/Research/Papers,etc/prelim/prelim.pdf > /dev/null 2>&1 &disown; echo '
alias eprelim='emacs -nw /hdd/Users/awesome/Dropbox/Research/Papers,etc/prelim/prelim.tex '
alias gprelim='gummi /hdd/Users/awesome/Dropbox/Research/Papers,etc/prelim/prelim.tex > /dev/null 2>&1 &disown; echo '
alias slides='cd /hdd/Users/awesome/Dropbox/Papers,etc/ASA_2014/Slides/ '
alias eslides='nohup gummi /hdd/Users/awesome/Dropbox/Papers,etc/ASA_2014/Slides/ASA_2014_Slides.tex& '
alias mathematica='nohup /usr/local/bin/mathematica/Mathematica& '
# alias test='clear; make cleantest; g++ test.cpp test_sub.cpp -I. -o test.out;  ./test.out '
alias rb='sh runbatch.sh '
alias bern='ssh awesome@bernoulli.engin.umich.edu '
alias wbern='nohup rdesktop -g 1680x995 -a 32 -r clipboard:CLIPBOARD -u UMROOT\\awesome -r disk:Dropbox=/hdd/Users/awesome/Dropbox me-bernoulli.adsroot.itcs.umich.edu& '
alias wbern2='nohup rdesktop -g 3360x995 -a 32 -r clipboard:CLIPBOARD -u UMROOT\\awesome -r disk:Dropbox=/hdd/Users/awesome/Dropbox me-bernoulli.adsroot.itcs.umich.edu& '
alias rr='./ram15.exe& '
alias backup='rsync -rvza --progress --update /hdd/Users/awesome/Dropbox/Research /johnsenlab2/ && rsync -rvzau --progress --exclude *.git* /home/awesome/code /johnsenlab2/ '
alias m580='sudo mount -t davfs https://ctools.umich.edu/dav/f6e912ed-5309-461b-8f41-3ed52769d247 /mnt/ctools/engr580/ '
alias indy='cd /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2014_Indianapolis '
alias pitts='cd /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2015_pittsburgh '
alias courses='cd /hdd/Users/awesome/Dropbox/Courses '
alias mcfpl='sudo mount -t davfs https://ctools.umich.edu/dav/b4112ada-8342-4478-9bfc-d73ebd116e99 /mnt/ctools/cfpl/ '
alias cfpl='cd /mnt/ctools/cfpl/ '
alias mrelate='sudo mount -t davfs https://ctools.umich.edu/dav/666d7c20-e778-46b2-a0b3-c96cba03f1c0 /mnt/ctools/relate/ '
alias relate='cd /mnt/ctools/relate/ '
alias class='cd /hdd/Users/awesome/Dropbox/Courses/ '
alias mmesr="sudo mount -t cifs -o user=$USER //me-dist.engin.umich.edu/Software /mnt/mesr/ "
alias mesr="cd /mnt/mesr/ "
alias xsede="ssh bspatter@login.xsede.org"
alias stampede="ssh bspatter@login1.stampede.tacc.utexas.edu"
alias globus="/home/awesome/tmp/globusconnectpersonal-2.2.0/globusconnect > /dev/null 2>&1 &disown; echo"
alias gmsh="/home/awesome/programs/gmsh-2.10/bin/gmsh"



#################  Put functions specifically for Lagrange below this line  ##########################

#copy figure to my notes
function cpnotes { cp $1 /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes/figs/$2; }
export -f cpnotes

# copy to ctools subgroup folder
function cpsg { cp $1 "/mnt/ctools/cfpl/Group meeting research/Cavitation Subgroup/$2"; }
export -f cpsg

# copy to my home computer (wonderland)
function w2l { Wip=`awk 'NR==1' /hdd/Users/awesome/Dropbox/scripts/Wonderland_ip.txt`; rsync -rvza -e 'ssh -p 626' --progress brandon@$Wip:$1 $2;}
export -f w2l

# Temporary function to copy figures to conference figures
function cpindy { cp $1 /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2014_Indianapolis/figs/$2; }
export -f cpindy

function cppitts { cp $1 /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2015_pittsburgh/figs/$2; }
export -f cppitts

function cpjacks { cp $1 /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2015_jacksonville/figs/$2; }
export -f cppitts


#rsync to stampede
function 2stamp { rsync -rvzau --progress "$1" bspatter@login1.stampede.tacc.utexas.edu:/home1/03773/bspatter/$2; }
export -f 2stamp

function cpln () { 
    for f in `ls $1`
    do
        mv $1 $2 && ln -sf $2/$f $1
    done
}
