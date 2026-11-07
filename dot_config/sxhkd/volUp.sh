pactl set-sink-volume $(pactl list sinks | grep -B2 "Name: $(pactl info | grep "Default Sink:" | sed "s/Default Sink: //")" | sed "s/Sink #//; /State/d; /Name/d") +1%
