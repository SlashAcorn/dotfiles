#! /bin/sh

while getopts "t:s" arg; do
  case $arg in
    s) theme=$(ls /usr/share/backgrounds | fzf);;
    t) theme=$OPTARG;;
  esac
done

echo "using "$theme" wallpaper folder"

wallpaperdir=/usr/share/backgrounds/$theme/
wallpaper=$(ls $wallpaperdir | shuf -n 1)
hyprpaperconfig=$XDG_CONFIG_HOME"/hypr/hyprpaper.conf"

echo "ipc = off" > $hyprpaperconfig

echo "preload = "$wallpaperdir$wallpaper >> $hyprpaperconfig
echo "wallpaper = DP-1,"$wallpaperdir$wallpaper >> $hyprpaperconfig
killall hyprpaper
hyprpaper -c $hyprpaperconfig &
