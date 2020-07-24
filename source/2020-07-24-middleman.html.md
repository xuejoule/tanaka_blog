---
title: 環境変数について
---


## シェル変数

$ NAME=tanaka

## 環境変数

$ NAME=tanaka

$ export NAME

$ export NAME=manbu

$ echo $NAME #=>manabu

## 設定した環境変数を表示

$ echo

$ printenv

```
GJS_DEBUG_TOPICS=JS ERROR;JS LOG
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
SESSION_MANAGER=local/jacquard:@/tmp/.ICE-unix/2057,unix/jacquard:/tmp/.ICE-unix/2057
GNOME_TERMINAL_SCREEN=/org/gnome/Terminal/screen/fd7648bd_5e45_44d3_be2b_03a3163a371c
SSH_AGENT_PID=2144
XDG_CURRENT_DESKTOP=X-Cinnamon
LANG=ja_JP.UTF-8
PWD=/home/manabu/Desktop/development/tanaka_blog
QT_IM_MODULE=ibus
GPG_AGENT_INFO=/run/user/1000/gnupg/S.gpg-agent:0:1
USER=manabu
DESKTOP_SESSION=cinnamon
GJS_DEBUG_OUTPUT=stderr
HOME=/home/manabu
QT4_IM_MODULE=ibus
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
XDG_VTNR=2
XDG_SEAT=seat0
GTK_MODULES=gail:atk-bridge
XDG_CONFIG_DIRS=/etc/xdg/xdg-cinnamon:/etc/xdg
WINDOWPATH=2
XDG_SESSION_DESKTOP=cinnamon
GTK_IM_MODULE=ibus
XDG_DATA_DIRS=/usr/share/gnome:/usr/share/cinnamon:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
GTK_OVERLAY_SCROLLING=0
CLUTTER_IM_MODULE=ibus
LOGNAME=manabu
GNOME_TERMINAL_SERVICE=:1.939
VTE_VERSION=5802
PATH=/home/manabu/.rbenv/shims:/home/manabu/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin
XDG_RUNTIME_DIR=/run/user/1000
XMODIFIERS=@im=ibus
SHELL=/bin/zsh
XDG_SESSION_TYPE=x11
XDG_SESSION_ID=2
USERNAME=manabu
SHLVL=1
XAUTHORITY=/run/user/1000/gdm/Xauthority
CINNAMON_VERSION=4.0.10
COLORTERM=truecolor
XDG_SESSION_CLASS=user
TERM=xterm-256color
GDMSESSION=cinnamon
DISPLAY=:0
OLDPWD=/home/manabu/Desktop/development/note
WORDCHARS=*?_-.[]~=&;!#$%^(){}<>
LS_COLORS=di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30
RBENV_SHELL=zsh
NAME=manabu
_=/usr/bin/printenv
```

## 変数の削除

$ unset NAME
