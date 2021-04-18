# docker-anki

Docker image that runs Anki application.

As this image is based on (docker-baseimage-gui)[https://github.com/jlesage/docker-baseimage-gui] it expose the UI via vnc.

## run

```
docker run --rm -it --device /dev/snd -v/home/pawel/Volumes/anki:/config -e USER_ID=`id --user` -e GROUP_ID=`id --group` -e AUDIO_GROUP_ID=`cut -d: -f3 < <(getent group audio)` -p 5800:5800 -p 5900:5900 pawelkorus/anki
```