#!/bin/bash

# Настройка пароля VNC (по умолчанию: secret)
mkdir -p ~/.vnc
echo "secret" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Запуск VNC сервера на дисплее :1
vncserver :1 -geometry 1280x720 -depth 24

# Запуск noVNC
# --vnc localhost:5901 — куда подключаться (VNC порт)
# --listen 6080 — какой порт слушать для браузера
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080
