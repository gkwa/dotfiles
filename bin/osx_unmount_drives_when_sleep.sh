#!/bin/sh

mount | grep 10.0.2.10 | awk '{print $1}' | xargs -n 1 umount

