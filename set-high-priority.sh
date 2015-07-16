sudo pidof $1 | xargs sudo renice -20 -p
