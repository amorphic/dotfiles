# .bashrc

# User specific aliases and functions

## Pick the most capable terminal variant we can find.
# http://zork.net/~st/jottings/Automatic_$TERM_Selection.html
case "$TERM" in
    xterm*)
	TERMLIST="
	    xterm-256color
	    xterm-16color
	    xterm-color
	    xterm
	    " ;;
    screen*)
	TERMLIST="
	    screen-256color
	    screen-16color
	    screen
	    " ;;
    *)
	TERMLIST="$TERM" ;;
esac
for term in $TERMLIST; do
    infocmp "$term" >/dev/null 2>&1 && export TERM=$term && break
done

## Enable color support of ls
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias ll='ls -la'
## Per-host prompt colouring
# http://zork.net/~st/jottings/Per-Host_Prompt_Colouring.html

# We get the first 7 digits of the md5sum; if we got 8 digits, the
# hosthash might be negative on 32-bit machines, and that would mess
# things up.
HOSTHASH=$(hostname | md5sum)
HOSTHASH=${HOSTHASH:0:7}

# Map into the range of available colours
if [ $(tput colors) -ge 256 ]; then
    # All the colours with brightness > 25% in the default xterm
    # palette
    BRIGHT_COLORS=(2 3 4 5 6 7 8 9 10 11 12 13 14 15 22 23 24 25 26 27
    28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49
    50 51 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77
    78 79 80 81 82 83 84 85 86 87 94 95 96 97 98 99 100 101 102 103 104
    105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121
    122 123 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144
    145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 165 166
    167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183
    184 185 186 187 188 189 190 191 192 193 194 195 198 199 200 201 202
    203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219
    220 221 222 223 224 225 226 227 228 229 230 231 238 239 240 241 242
    243 244 245 246 247 248 249 250 251 252 253 254 255)
elif [ $(tput colors) -ge 16 ]; then
    BRIGHT_COLORS=(2 3 4 5 6 7 8 9 10 11 12 13 14 15)
else
    BRIGHT_COLORS=(2 3 4 5 6 7)
fi

COLOR=${BRIGHT_COLORS[$(( 0x$HOSTHASH % ${#BRIGHT_COLORS[@]} ))]}

C="\[$(tput setaf $COLOR)\]" # color
B="\[$(tput bold)\]" # bold
N="\[$(tput sgr0)\]" # normal
PS1="$C$B[$N$C\\u@\\h$B\$TMP_DELIM$N$C\$TMP_PWD_VALUE$B]\\\$$N "
unset HOSTHASH BRIGHT_COLORS COLOR C B N	  # cleanup

## Alias vim to vi, if we don't have vim available.
if [ "$(which vim 2>/dev/null)" == "" ] && [ "$(which vi 2>/dev/null)" != "" ]; then
	alias vim=$(which vi)
fi

## Load tab-completion settings, if any.
if [ -e /etc/bash_completion ]; then
	. /etc/bash_completion
fi

## Share history across all open terminals.
if [ -n "$HISTORY_SETUP" ]; then
	shopt -s histappend
	export HISTCONTROL=ignoredups:erasedups
	export HISTSIZE=100000
	export HISTFILESIZE=$HISTSIZE
	export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
	export HISTORY_SETUP=1
fi

## Use vim as default editor.
export EDITOR=vim
