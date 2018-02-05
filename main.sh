#!/bin/bash

sleep 5

snapserver -s 'pipe:///output/snapfifo?name=Mopidy&sampleformat=48000:16:2' -b 200

