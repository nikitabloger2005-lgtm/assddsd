FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8

# Установка XFCE, VNC и зависимостей для noVNC
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    dbus-x11 x11-xserver-utils \
    tigervnc-standalone-server \
    novnc websockify \
    python3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Создаем ссылку для noVNC (в некоторых дистрибутивах пути отличаются)
RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

WORKDIR /root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6080

ENTRYPOINT ["/entrypoint.sh"]
