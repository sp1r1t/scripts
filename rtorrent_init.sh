#!/bin/bash

echo -n "setting up folder structure..."

cd ~
if [ ! -e torrent ]; then
    mkdir torrent
fi
if [ ! -e torrent/active ]; then
    mkdir torrent/active
fi
if [ ! -e torrent/session ]; then
    mkdir torrent/session
fi
if [ ! -e torrent/watch ]; then
    mkdir torrent/watch
fi

cd - > /dev/null

echo "done"

echo "now make rtorrent-magnet available in your path."
echo "in firefox about:config add: "
echo "  network.protocol-handler.expose.magnet"
echo "with value:false"
echo ""
echo "open a magnet link and choose the script to open it."
echo "you're done (:"