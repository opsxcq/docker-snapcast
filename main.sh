#!/bin/bash

sleep 5

snapserver -s 'pipe:///output/snapfifo?name=Radio&sampleformat=48000:16:2'

