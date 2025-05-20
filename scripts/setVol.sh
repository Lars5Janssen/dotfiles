#! /bin/bash

def_sink_vol="60%"
def_source_vol="100%"

if [[ $1 == "source" ]]; then
    current_source="$(pactl get-default-source)"

    if [[ $2 == "mute_toggle" ]]; then
        pactl set-source-mute $current_source toggle
    elif [[ $2 == "mute" ]]; then
        pactl set-source-mute $current_source true
    elif [[ $2 == "unmute" ]]; then
        pactl set-source-mute $current_source false
    else
        if [[ $3 == "unmute" ]]; then
        pactl set-source-mute $current_source false
        fi
        if [[ $2 == "default" ]]; then
            pactl set-source-volume $current_source $def_source_vol
        else
            pactl set-source-volume $current_source $2
        fi
    fi

elif [[ $1 == "sink" ]]; then
    current_sink="$(pactl get-default-sink)"

    if [[ $2 == "mute_toggle" ]]; then
        pactl set-sink-mute $current_sink toggle
    elif [[ $2 == "mute" ]]; then
        pactl set-sink-mute $current_sink true
    elif [[ $2 == "unmute" ]]; then
        pactl set-sink-mute $current_sink false
    else
        if [[ $3 == "unmute" ]]; then
        pactl set-sink-mute $current_sink false
        fi
        if [[ $2 == "default" ]]; then
            pactl set-sink-volume $current_sink $def_sink_vol
        else
            pactl set-sink-volume $current_sink $2
        fi
    fi
fi
