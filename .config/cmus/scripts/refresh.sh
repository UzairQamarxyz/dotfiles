#!/bin/bash
cmus-remote -C clear
cmus-remote -C "add $HOME/Music"
cmus-remote -C "update-cache -f"
