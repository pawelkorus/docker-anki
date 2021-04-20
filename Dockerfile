FROM pkorus/base-gui-app:debian-9

ARG ANKI_VERSION=2.1.43

RUN apt-get update \
    && apt-get install -yq \
        wget \
        ca-certificates \
        build-essential \
        locales \
        libjs-jquery\
        libjs-jquery-flot \
        libjs-jquery-ui \
        libjs-mathjax \
        libqt5core5a  \
        python3 \
        python3-bs4 \
        python3-decorator \
        python3-markdown \
        python3-pyaudio \
        python3-pyqt5 \
        python3-pyqt5.qtwebchannel \
        python3-pyqt5.qtwebengine \
        python3-requests \
        python3-matplotlib \
        dvipng \
        lame \
        mpv \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /tmp/anki \
    && cd /tmp/anki \
    && wget https://github.com/ankitects/anki/releases/download/$ANKI_VERSION/anki-$ANKI_VERSION-linux.tar.bz2

RUN cd /tmp/anki && tar xjf anki-$ANKI_VERSION-linux.tar.bz2 && cd anki-$ANKI_VERSION-linux && ./install.sh

RUN rm -rf /tmp/*

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

COPY rootfs /