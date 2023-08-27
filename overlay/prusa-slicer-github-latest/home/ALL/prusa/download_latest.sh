#!/bin/bash

curl -s https://api.github.com/repos/prusa3d/PrusaSlicer/releases/latest \
| grep "x64-GTK3-*.*AppImage" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -