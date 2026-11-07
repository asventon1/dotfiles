pactl set-sink-mute $(pactl list sinks | grep -B2 "Name: $(pactl info | grep "Default Sink:" | sed "s/Default Sink: //")" | sed "s/Sink #//; /State/d; /Name/d") toggle
