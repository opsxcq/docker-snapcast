# SnapCast

![Snapcast](logo.png)

[**S**y**n**chronous **a**udio **p**layer](https://github.com/badaix/snapcast)
  
Snapcast is a multi-room client-server audio player, where all clients are time synchronized with the server to play perfectly synced audio. It's not a standalone player, but an extension that turns your existing audio player into a Sonos-like multi-room solution.
The server's audio input is a named pipe `/tmp/snapfifo`. All data that is fed into this file will be send to the connected clients. One of the most generic ways to use Snapcast is in conjunction with the music player daemon ([MPD](http://www.musicpd.org/)) or [Mopidy](https://www.mopidy.com/), which can be configured to use a named pipe as audio output.

This repository is a container configured to run snapcast in your local network.

# Usage

Just run this image as any other container, there are two important things to know

* This container uses the `/output/snapfifo` as a FIFO (First In First Out) to stream the sound, anything written to this FIFO will be streamed to all clients.
* This image uses the `1704` port to accept client connections. 

Here is an example running it with `mopidy`:

```yml
opsxcq@hellgates:~$ cd test/music/
opsxcq@hellgates:~/test/music$ ls
docker-compose.yml
opsxcq@hellgates:~/test/music$ cat docker-compose.yml 
version: '3'

services:
  mopidy:
    image: strm/mopidy
    ports:
      - 6600:6600
      - 6680:6680
    volumes:
      - "/data/media/music/:/music"
      - "/tmp/audio-output:/output"
  snapcast:
    image: strm/snapcast
    ports:
      - 1704:1704
    volumes:
      - "/tmp/audio-output:/output"

``` 

# Volumes

# Client

If you don't want to download and compile the client for your platformn, you can simply copy from this image to your computer. The client is `snapclient`.
