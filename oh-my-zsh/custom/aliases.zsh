# ALL COMPUTERS
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
alias zbc='source ~/.oh-my-zsh/custom/aliases.zsh && source ~/.oh-my-zsh/custom/functions.zsh && source ~/.zshrc '
alias ebc='emacs -nw ~/.bashrc '
alias ezbc='emacs -nw ~/.zshrc '
alias eec='emacs -nw ~/.emacs '
alias eal='emacs -nw ~/.oh-my-zsh/custom/aliases.zsh '
alias efun='emacs -nw ~/.oh-my-zsh/custom/functions.zsh '
alias v='vim '
alias up='update && upgrade '
alias rs='rsync -rvzau --progress '
alias acs='apt-cache search '
alias ut='tar -zxvf '
alias rename2lowercase='find . -depth -exec rename "s/(.*)\/([^\/]*)/$1\/\L$2/" {} \ ; ' #be carefull, this recursively names all subdirctories and files to lower case.
alias ls='ls --hide="*~" --color=auto'
alias count='ls -F |grep -v / | wc -l '
alias showbigfiles='du -sh -t 1000000000 * '
alias rsyncmv='rsync --progress --remove-source-files '
alias ccat='pygmentize -g '
alias showempty='find . -empty -type d '
alias removeempty='find . -empty -type d -delete '


## Specifically for lagrange
#  My terminal aliases for specifically for lagrange
alias down='cd /hdd/Users/awesome/Downloads '
alias tmp='cd /home/awesome/tmp '
alias research='cd /hdd/Users/awesome/Dropbox/Research '
alias lit='cd /hdd/Users/awesome/Dropbox/Research/literature '
alias ram='cd /hdd/Users/awesome/Dropbox/Research/Acoustic_Uncertainty/ram '
alias drop='cd /hdd/Users/awesome/Dropbox '
alias out='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/out '
alias cap='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/out/CapillaryIn '
alias uso='cd /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/out/US-CapillaryIn '
alias awesome='cd /hdd/Users/awesome '
alias cdsphinx='cd /mnt/sphinx/data/ '
alias cfd='cd /hdd/Users/awesome/Dropbox/Research/CFD/ '
alias prep='cd /hdd/Users/awesome/Dropbox/Research/CFD/Preparation '
alias lung='cd /hdd/Users/awesome/Dropbox/Research/CFD/OldCode/Lung/Lung_2D_linux '
alias lungs='cd /hdd/Users/awesome/Dropbox/Research/CFD/OldCode/Lung/Lung_2D_linux_s '
alias business="cd /hdd/Users/awesome/Dropbox/business "
alias data="cd /mnt/hdd/data "
alias datae="cd /media/awesome/external_large/data "
alias group='cd /hdd/Users/awesome/Dropbox/Research/papers,etc/group_meetings '
alias dg='cd /home/awesome/code/marcs_code/dg/ '
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
alias jlab='sshfs awesome@johnsenlab.engin.umich.edu:/ /mnt/johnsenlab'
alias cdjlab='cd /mnt/johnsenlab/labdata/awesome/data '
alias jdata='sshfs awesome@johnsenlab.engin.umich.edu:/labdata/awesome ~/backup'
alias gg='nohup gitg /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/& clc '
alias notes='cd /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes '
alias cnotes='evince /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes/Research_Notes.pdf > /dev/null 2>&1 &disown; echo '
alias enotes='emacs -nw /hdd/Users/awesome/Dropbox/MyBooks/Research_Notes/Research_Notes.tex '
alias prelim='cd /hdd/Users/awesome/Dropbox/Research/papers,etc/prelim/ '
alias diss='cd /hdd/Users/awesome/Dropbox/Research/papers,etc/dissertation/ '
alias cprelim='evince /hdd/Users/awesome/Dropbox/Research/papers,etc/prelim/prelim.pdf > /dev/null 2>&1 &disown; echo '
alias eprelim='emacs -nw /hdd/Users/awesome/Dropbox/Research/papers,etc/prelim/prelim.tex '
alias gprelim='gummi /hdd/Users/awesome/Dropbox/Research/papers,etc/prelim/prelim.tex > /dev/null 2>&1 &disown; echo '
alias slides='cd /hdd/Users/awesome/Dropbox/papers,etc/ASA_2014/Slides/ '
alias eslides='nohup gummi /hdd/Users/awesome/Dropbox/papers,etc/ASA_2014/Slides/ASA_2014_Slides.tex& '
alias mathematica='nohup /usr/local/bin/mathematica/Mathematica& '
# alias test='clear; make cleantest; g++ test.cpp test_sub.cpp -I. -o test.out;  ./test.out '
alias rb='sh runbatch.sh '
alias bern='ssh awesome@bernoulli.engin.umich.edu '
alias wbern='nohup rdesktop -g 1680x995 -a 32 -r clipboard:CLIPBOARD -u UMROOT\\awesome -r disk:Dropbox=/hdd/Users/awesome/Dropbox me-bernoulli.adsroot.itcs.umich.edu& '
alias wbern2='nohup rdesktop -g 3360x995 -a 32 -r clipboard:CLIPBOARD -u UMROOT\\awesome -r disk:Dropbox=/hdd/Users/awesome/Dropbox me-bernoulli.adsroot.itcs.umich.edu& '
alias rr='./ram15.exe& '
#alias backup='rsync -rvza --progress --update /hdd/Users/awesome/Dropbox/Research /johnsenlab2/ && rsync -rvzau --progress --exclude *.git* /home/awesome/code /johnsenlab2/ '
alias backup='sudo rsync -rvzua --progress /home/awesome/code/marcs_code/dg /mnt/johnsenlab/ && sudo rsync -rvzua --progress /mnt/hdd/data /mnt/johnsenlab/	'			   
alias m580='sudo mount -t davfs https://ctools.umich.edu/dav/f6e912ed-5309-461b-8f41-3ed52769d247 /mnt/ctools/engr580/ '
alias indy='cd /hdd/Users/awesome/Dropbox/Research/papers,etc/conference_presentations/2014_Indianapolis '
alias pitts='cd /hdd/Users/awesome/Dropbox/Research/papers,etc/conference_presentations/2015_pittsburgh '
alias courses='cd /hdd/Users/awesome/Dropbox/Courses '
alias mcfpl='sudo mount -t davfs https://ctools.umich.edu/dav/b4112ada-8342-4478-9bfc-d73ebd116e99 /mnt/ctools/cfpl/ '
alias cfpl='cd /mnt/ctools/cfpl/ '
# alias mrelate='sudo mount -t davfs https://ctools.umich.edu/dav/666d7c20-e778-46b2-a0b3-c96cba03f1c0 /mnt/ctools/relate/ '
# alias mrelate2016='sudo mount -t davfs https://ctools.umich.edu/dav/e23274c3-9390-4149-8cfe-c68c1e1f7b54 /mnt/ctools/relate2016/ '
# alias mrelate2016_dropbox='sudo mount -t davfs https://ctools.umich.edu/dav/group-user/e23274c3-9390-4149-8cfe-c68c1e1f7b54  /mnt/ctools/relate2016_dropbox/ '
# alias mrelate2015_dropbox='sudo mount -t davfs https://ctools.umich.edu/dav/group-user/d7635772-bdec-46e4-bbbe-1b17c20a441d  /mnt/ctools/relate2015_dropbox/ '
# alias mrelate2014_dropbox='sudo mount -t davfs https://ctools.umich.edu/dav/group-user/666d7c20-e778-46b2-a0b3-c96cba03f1c0  /mnt/ctools/relate2014_dropbox/ '
alias relate='cd /mnt/ctools/relate/ '
alias class='cd /hdd/Users/awesome/Dropbox/Courses/ '
alias eic='emacs -nw /home/awesome/code/marcs_code/dg/code/src/ic/init_cond.cc '
alias mmesr="sudo mount -t cifs -o user=$USER //me-dist.engin.umich.edu/Software /mnt/mesr/ "
alias mesr="cd /mnt/mesr/ "
alias xsede="ssh bspatter@login.xsede.org"
alias stampede="ssh bspatter@login1.stampede.tacc.utexas.edu"
alias kampede="ssh bspatter@knl-login1.stampede.tacc.utexas.edu"
alias globus="/home/awesome/tmp/globusconnectpersonal-2.3.3/globusconnect > /dev/null 2>&1 &disown; echo"
#alias gmsh="/home/awesome/programs/gmsh-2.10/bin/gmsh"
alias gmsh="/home/awesome/programs/gmsh-2.12.0/bin/gmsh"
alias navier="ssh awesome@navier.engin.umich.edu"
alias blt="bls -ltr "
alias cic="emacs -nw /home/awesome/code/marcs_code/dg/code/src/ic/init_cond.cc "
alias gdrive="~/gears/gdrive "