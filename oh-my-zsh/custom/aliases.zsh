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
alias eec='emacs -nw ~/.emacs.d/init.el '
alias eal='emacs -nw ~/.oh-my-zsh/custom/aliases.zsh '
alias efun='emacs -nw ~/.oh-my-zsh/custom/functions.zsh '
alias v='vim '
alias up='update && upgrade '
alias rs='rsync -rvzau --progress '
alias acs='apt-cache search '
alias ut='tar -zxvf '
alias rename2lowercase='find . -depth -exec rename "s/(.*)\/([^\/]*)/$1\/\L$2/" {} \ ; ' #be carefull, this recursively names all subdirctories and files to lower case.
alias ls='ls --hide="*~" --color=auto'
alias down='cd ~/Downloads '

alias count='ls -F |grep -v / | wc -l '
alias showbigfiles='du -sh -t 1000000000 * '
alias rsyncmv='rsync --progress --remove-source-files '
alias ccat='pygmentize -g '
alias showempty='find . -empty -type d '
alias removeempty='find . -empty -type d -delete '



## Specifically for lagrange
#  My terminal aliases for specifically for lagrange
if [[ ${(%):-%M} = *Lagrange* ]]; then
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
   alias data="cd /mnt/hdd/data "
   alias group='cd /hdd/Users/awesome/Dropbox/Research/Papers,etc/group_meetings '
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
   alias upvonk="rsync -rvza /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/src /hdd/Users/awesome/Dropbox/Research/CFD/MyCode/include awesome@vonkarman.engin.umich.edu:/home/awesome/MyCode/ "
   alias jlab='sshfs awesome@johnsenlab.engin.umich.edu:/ /mnt/johnsenlab'
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
   alias bern='ssh awesome@bernoulli.engin.umich.edu '
   alias wbern='nohup rdesktop -g 1680x995 -a 32 -r clipboard:CLIPBOARD -u UMROOT\\awesome -r disk:Dropbox=/hdd/Users/awesome/Dropbox me-bernoulli.adsroot.itcs.umich.edu& '
   alias wbern2='nohup rdesktop -g 3360x995 -a 32 -r clipboard:CLIPBOARD -u UMROOT\\awesome -r disk:Dropbox=/hdd/Users/awesome/Dropbox me-bernoulli.adsroot.itcs.umich.edu& '
   alias backup='sudo rsync -rvzua --progress /home/awesome/code/marcs_code/dg /mnt/johnsenlab/ && sudo rsync -rvzua --progress /mnt/hdd/data /mnt/johnsenlab/	'			   
   alias indy='cd /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2014_Indianapolis '
   alias pitts='cd /hdd/Users/awesome/Dropbox/Research/Papers,etc/conference_presentations/2015_pittsburgh '
   alias courses='cd /hdd/Users/awesome/Dropbox/Courses '
   alias mcfpl='sudo mount -t davfs https://ctools.umich.edu/dav/b4112ada-8342-4478-9bfc-d73ebd116e99 /mnt/ctools/cfpl/ '
   alias cfpl='cd /mnt/ctools/cfpl/ '
   alias relate='cd /mnt/ctools/relate/ '
   alias mrelate='sudo mount -t davfs https://ctools.umich.edu/dav/666d7c20-e778-46b2-a0b3-c96cba03f1c0 /mnt/ctools/relate/ '
   alias class='cd /hdd/Users/awesome/Dropbox/Courses/ '
   alias mmesr="sudo mount -t cifs -o user=$USER //me-dist.engin.umich.edu/Software /mnt/mesr/ "
   alias mesr="cd /mnt/mesr/ "
   alias xsede="ssh bspatter@login.xsede.org"
   alias stampede="ssh bspatter@login1.stampede.tacc.utexas.edu"
   alias globus="/home/awesome/tmp/globusconnectpersonal-2.2.0/globusconnect > /dev/null 2>&1 &disown; echo"
   alias xsede="ssh bspatter@login.xsede.org"
   alias stampede="ssh bspatter@login1.stampede.tacc.utexas.edu"
   alias kampede="ssh bspatter@knl-login1.stampede.tacc.utexas.edu"
   alias gmsh="/home/awesome/programs/gmsh-2.12.0/bin/gmsh"
   alias navier="ssh awesome@navier.engin.umich.edu"
   alias blt="bls -ltr "
   alias cic="emacs -nw /home/awesome/code/marcs_code/dg/code/src/ic/init_cond.cc "
   alias eic='emacs -nw /home/awesome/code/marcs_code/dg/code/src/ic/init_cond.cc '
   alias gdrive="~/gears/gdrive "

   # alias mrelate='sudo mount -t davfs https://ctools.umich.edu/dav/666d7c20-e778-46b2-a0b3-c96cba03f1c0 /mnt/ctools/relate/ '
   # alias mrelate2016='sudo mount -t davfs https://ctools.umich.edu/dav/e23274c3-9390-4149-8cfe-c68c1e1f7b54 /mnt/ctools/relate2016/ '
   # alias mrelate2016_dropbox='sudo mount -t davfs https://ctools.umich.edu/dav/group-user/e23274c3-9390-4149-8cfe-c68c1e1f7b54  /mnt/ctools/relate2016_dropbox/ '
   # alias mrelate2015_dropbox='sudo mount -t davfs https://ctools.umich.edu/dav/group-user/d7635772-bdec-46e4-bbbe-1b17c20a441d  /mnt/ctools/relate2015_dropbox/ '
   # alias mrelate2014_dropbox='sudo mount -t davfs https://ctools.umich.edu/dav/group-user/666d7c20-e778-46b2-a0b3-c96cba03f1c0  /mnt/ctools/relate2014_dropbox/ '
fi

## Terminal aliases specifically for My laptop
if [[ $HOSTNAME = *TheWhiteRabbit* ]]; then
    alias sn='screen -S '
  alias sl='screen -list'
  alias sr='screen -r '
  alias code='cd /d/Dropbox/Research/CFD/MyCode '
  alias ecode='cd /d/Dropbox/Research/CFD/MyCode; nohup geany makefile ./src/main.cpp ./src/Setup.cpp ./include/Setup.h&'
  alias research='cd /d/Dropbox/Research '
  alias slides='cd /d/Dropbox/Papers,etc/ASA_2014/Slides '
  alias drop='cd /d/Dropbox '
  alias down='cd /c/Users/Brandon/Downloads '
  alias downd='cd /d/Downloads '
  alias brandon='cd /c/Users/Brandon '
  alias paper='cd/d/Dropbox/Research/Papers,etc/papers/2014.jasa '
  alias mk='clear; make '
  alias mkr='clear; make; clear; ./bin/exec '
  alias g+='clear; g++ -O3 '
  alias cln='make clean; clear '
  alias run='clear; ./bin/exec '
  alias cmr='clear; make clean; make; clear; ./bin/exec '
  alias space='printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" '
  alias clc='clear ; space ; clear '
  alias business='cd /d/Dropbox/business/ '
  alias cfd='cd /d/Dropbox/Research/CFD/ '
  alias prep='cd /d/Dropbox/Research/CFD/Preparation '
  alias lung='cd /d/Dropbox/Research/CFD/OldCode/Lung/Lung_2D_linux '
  alias lungs='cd /d/Dropbox/Research/CFD/OldCode/Lung/Lung_2D_linux_s '
  alias ram='cd /d/Dropbox/Research/Acoustic_Uncertainty/ram '
  alias wonder='sh /home/Brandon/scripts/2Wonderland '
  alias wonderx='sh /home/Brandon/scripts/2WonderlandX '
  alias wonderh='ssh -p 626 brandon@192.168.1.150 '
  alias wonderhx='ssh -XY -p 626 brandon@192.168.0.20 '
  alias lagrange='ssh awesome@Lagrange.engin.umich.edu '
  alias lagrangex='ssh -XY awesome@Lagrange.engin.umich.edu '
  alias stampede='ssh bspatter@login1.stampede.tacc.utexas.edu '
  alias ins='apt-cyg install '
  alias update='apt-cyg update '
  alias sbc='source ~/.bashrc '
  alias ebc='emacs -nw ~/.bashrc '
  alias gg='nohup gitg /d/Dropbox/Research/CFD/Lung/Structured/Lung_2D_linux_s/& '
  alias gnotes='nohup gummi /d/Dropbox/MyBooks/Research_Notes/Research_Notes.tex& '
  alias enotes='emacs -nw /d/Dropbox/MyBooks/Research_Notes/Research_Notes.tex'
  alias setup='vim src/Setup.cpp '
  alias wip='cat /d/Dropbox/Wonderland_ip.txt '
  alias class='cd /d/Dropbox/Courses '
  alias m3='cd /d/Dropbox/Research/papers,etc/posters/2014.mcubed '
  alias lit='cd /d/Dropbox/Research/literature '
  alias indy='cd /d/Dropbox/Research/papers,etc/conference_presentations/2014_Indianapolis/ '
  alias pitts='cd /d/Dropbox/Research/papers,etc/conference_presentations/2015_pittsburgh/ '
  alias prelim='cd /d/Dropbox/Research/papers,etc/prelim/ '
  alias diss='cd /d/Dropbox/Research/papers,etc/dissertation/ '
  alias cprelim='cygstart /d/Dropbox/Research/papers,etc/prelim/prelim.pdf '
  alias eprelim='emacs -nw /d/Dropbox/Research/papers,etc/prelim/prelim.tex '
  alias notes='cd /d/Dropbox/MyBooks/Research_Notes '
  alias cnotes='cygstart /d/Dropbox/MyBooks/Research_Notes/Research_Notes.pdf '
  alias enotes='emacs -nw /d/Dropbox/MyBooks/Research_Notes/Research_Notes.tex '
  alias cyg='/c/cygwin64/cygwin.setup-x86_64 &disown '
  alias n.='explorer .'
  alias e='emacs -nw '
  alias o='cygstart '
  alias ..='cd .. '
  alias hotspot='netsh wlan set hostednetwork mode=allow ssid=chupacabra key=tacosauce; netsh wlan start hostednetwork '
  alias wondertmp='ssh -p 626 brandon@68.32.73.26 '
  alias upjax='rsync -rvzau -e "ssh -p 626" brandon@68.32.73.26:/mnt/hdd/data/jax /d/Dropbox/Research/papers,etc/conference_presentations/2015_jacksonville/'
  alias woof='python ~/scripts/woof.py '
  alias cdjax='cd /d/Dropbox/Research/papers,etc/conference_presentations/2015_jacksonville '
  alias count='ls -F |grep -v / | wc -l '
  alias upcyg='wget --output-document=setup-x86_64.exe http://cygwin.com/setup-x86_64.exe && mv setup-x86_64.exe ~/cygwin_setup.exe && chmod +x ~/cygwin_setup.exe ; ~/cygwin_setup.exe ' #Update cygwin setup file and run
  alias mrelate2016='mount -t davfs https://ctools.umich.edu/dav/e23274c3-9390-4149-8cfe-c68c1e1f7b54 /mnt/ctools/relate2016/ '
fi


if [[ ${(%):-%M} = *Leviathan* ]]; then
   alias navier="ssh awesome@navier.engin.umich.edu"
   alias stampede="ssh bspatter@login1.stampede.tacc.utexas.edu"
   alias lagrange="ssh awesome@lagrange.engin.umich.edu "
   alias lagrangeX="ssh -Y awesome@lagrange.engin.umich.edu "
   alias cdram='cd ~/Acoustic_Uncertainty/ram/ '
   alias diss='cd ~/Dropbox/Research/Papers,etc/dissertation/ '
   alias setgdem='export OAML_GDEMV_INDEX=/home/awesome/Acoustic_Uncertainty/ram/in/oaml/oamlgdem.ndx && export LANDMASK=/home/awesome/Acoustic_Uncertainty/ram/in/oaml/landmask.dat && export OAML_GDEMV_DATA=/home/awesome/Acoustic_Uncertainty/ram/in/oaml/oamlgdem.dat '
   alias bls='/bin/bls '
   alias blt='/bin/ls -ltr '
   alias gdrive='~/gears/gdrive '
fi



