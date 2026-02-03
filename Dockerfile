FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && apt-get install -y \
    python3 python3-venv python3-pip \
    chromium chromium-driver \
    ca-certificates curl unzip \
    fonts-liberation \
    libnss3 libxss1 libasound2 libatk1.0-0 libatk-bridge2.0-0 \
    libcups2 libdrm2 libgbm1 libgtk-3-0 libx11-xcb1 libxcomposite1 \
    libxdamage1 libxrandr2 libxrandr2 libu2f-udev libvulkan1 xdg-utils \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/robot && \
    /opt/robot/bin/pip install --upgrade pip && \
    /opt/robot/bin/pip install robotframework robotframework-seleniumlibrary

ENV PATH="/opt/robot/bin:${PATH}"

USER jenkins
