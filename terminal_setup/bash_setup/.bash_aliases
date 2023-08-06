
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first -X'
    alias dir='dir --color=aut --group-directories-first -X'
    alias vdir='vdir --color=auto --group-directories-first -X'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.

#----------------------Navigation-----------------------
alias ..='cd ../'
alias ...='cd ../../'

alias open='xdg-open'

alias o='source /home/raymond/Documents/scripts/open_applications/open.sh'

alias c='source /home/raymond/Documents/scripts/open_applications/openvs.sh'

alias t='typora'

alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias vim='nvim'

alias key='screenkey -p fixed -g 25%x5%-5%-5%'

alias cron_config='crontab -e'
#----------------------Scripts------------------------

#find file dir
alias f='source /home/raymond/Documents/scripts/fuzzy_find_term/find_dir.sh'

#find files
alias fo='source /home/raymond/Documents/scripts/fuzzy_find_term/find_file_xdg.sh'
alias fv='source /home/raymond/Documents/scripts/fuzzy_find_term/find_file_vim.sh'
alias fmd='source /home/raymond/Documents/scripts/fuzzy_find_term/find_file_xdg_md.sh'

#find folders
alias ff='source /home/raymond/Documents/scripts/fuzzy_find_term/find_folder.sh'
alias ffo='source /home/raymond/Documents/scripts/fuzzy_find_term/find_folder_xdg.sh'

#----------------------Music--------------------------

alias activate1='conda activate env_1'
alias deactivate='conda deactivate'

alias m='wmctrl -r :ACTIVE: -e 0,80,110,1750,920 && /home/raymond/Documents/scripts/music/start_music.sh' 

alias music='cmus'

#---------------------Calendar---------------------

alias cal='wmctrl -r :ACTIVE: -e 0,80,110,1750,920 && calcurse'

alias big='wmctrl -r :ACTIVE: -e 0,80,110,1750,920'

alias yesterday='calcurse -d yesterday --format-apt "\n* %S ~~> %E\n\t%m\n\n"'
alias today='calcurse -d today --format-apt "\n* %S ~~> %E\n\t%m\n\n"'
alias tomorrow='calcurse -d tomorrow --format-apt "\n* %S ~~> %E\n\t%m\n\n"'

#-------------Older clock scripts--------------

alias at='nohup /home/raymond/Documents/scripts/clocks/announce_clock.sh > /dev/null 2>&1 &'
alias kat='pkill -f "/home/raymond/Documents/scripts/clocks/announce_clock.sh"'

alias clock='tty-clock -ct -C 5'
#alias +='home && ./Documents/scripts/clocks/cli_clock.sh'
#alias ++='wmctrl -r :ACTIVE: -e 0,100,100,500,300 && tty-clock -c'
alias +='tty-clock -ct -C 5'

#----------------------Nerdy-----------------------
# btop
# gtop
# nvtop

# σ  Δ  ε  α  φ  δ  Φ  Γ  λ  θ  μ  π  Ω  τ  ψ  β

# Ω - ohm because I always wanted to become an electrical engineer before I wanted to study computer science - selfstudy
# Γ - gamma because mathematical statistics is hard and it gives me anxiety - university study
# ψ - Psi because it looks like a trident and some part of me likes something unique and different - fitness
# λ - lambda because it's simple and trivial, but part of me none the less - work && self evaluation

# Δ - I have always liked delta, I remember it like yesterday, learning about it and seeing it resurface in nearly every field, it is a very general and unique letter. I have a love for it like I have had a love for books and other little nerdy things. - I can use this to represent responsibly spent free time. (This for one is an example of what I can do in these sessions.) They are very diverse. As are my interests. As is Δ.

alias we='clear && curl wttr.in/?Ttqp0 && echo You too can wear a nose mitten. | lolcat'
alias weather='clear && curl wttr.in/?tqp1'
alias weather1='clear && curl wttr.in'
alias weather2='clear && curl v2d.wttr.in'
alias weather3='clear && curl v3.wttr.in'

alias amsterdam='clear && curl wttr.in/Amsterdam'

alias s='unimatrix -c green -s 92 -l ockCgG'
alias b='cbonsai --life 60 --multiplier 5 --time 0.02 --screensaver'
alias fire='cacafire'
#nyancat
#xeyes

alias wall='variety --selector'

alias onekocat='oneko -bg "Tan" -fg "Dim Grey" -tofocus -position 0x0+30+28 -speed 12 -idle 30'
alias onekodog='oneko -bg "Tan" -fg "Dim Grey" -tofocus -dog -position 0x0+-30+28 -speed 8 -idle 20'
alias onekotiger='oneko -bg "Tan" -fg "Dim Grey" -tofocus -tora -position 0x0+60+-28 -speed 8 -idle 40'

alias fortune='fortune | lolcat' 
#sl (train)

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


#---------------------Pomodoro script----------------------

alias wo="source /home/raymond/Documents/scripts/pomodoro/pomodoro.sh work"
alias br="source /home/raymond/Documents/scripts/pomodoro/pomodoro.sh break"

alias wl="source /home/raymond/Documents/scripts/pomodoro/pomodoro_loud.sh work"

# Add calcurse appointment
alias add="/home/raymond/Documents/scripts/pomodoro/add_appointment.sh"

alias remove="cd /home/raymond/.calcurse/ && c apts"

#----------------------------------------------------------
