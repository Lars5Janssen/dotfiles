#! /bin/bash
cd ~/.config/waybar/
killall waybar
sleep 0.2

final_config="/tmp/assembled_waybar_config.jsonc"
# final_config="/home/l/.config/waybar/test.jsonc"

lines_config="$(cat ~/.config/waybar/config.jsonc | wc -l)"
config="$(cat config.jsonc | head --lines=$(($lines_config-1)) | tail --lines=$(($lines_config-3)))"

if [[ "$HOST" == "archlaptop" ]]; then
    chosen_layout="/home/l/.config/waybar/configLaptop.jsonc"
elif [[ "$HOST" == "archPC" ]]; then
    chosen_layout="/home/l/.config/waybar/configPC.jsonc"
else
    chosen_layout="/home/l/.config/waybar/configLaptop.jsonc"
fi

lines_layout="$(cat $chosen_layout | wc -l)"
layout="$(cat $chosen_layout | head --lines=$(($lines_layout-1)) | tail --lines=$(($lines_layout-3)))"

rm $final_config
touch $final_config
echo "// -*- mode: json -*-" > $final_config
echo "{" >> $final_config
echo "$layout," >> $final_config
echo "" >> $final_config
echo "$config" >> $final_config
echo "}" >> $final_config

cd -
waybar --config $final_config &
