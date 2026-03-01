#!/bin/bash

wget -qO- https://pixi.sh/install.sh | sh
source ~/.bashrc
pixi g install just
