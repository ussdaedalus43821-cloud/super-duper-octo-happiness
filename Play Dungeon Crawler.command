#!/bin/bash
cd "$(dirname "$0")"
python3 novalang.py dungeon_crawler.nova
echo
read -p "Press Enter to close this window..."
