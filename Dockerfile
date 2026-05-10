FROM ubuntu:22.04

# Исключаем интерактивные вопросы при установке
ENV DEBIAN_FRONTEND=noninteractive

# Установка необходимых пакетов
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    novnc websockify \
    python3 \
    git \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Настройка рабочих директорий
WORKDIR /root

# Создаем скрипт запуска
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Экспортируем порт для noVNC
EXPOSE 6080

ENTRYPOINT ["/entrypoint.sh"]
