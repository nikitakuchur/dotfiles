#!/usr/bin/env sh

# notify.sh - Send audio and brightness notifications for dunst

# dependencies: dunstify, pulsemixer, xbacklight

notifyAudio() {
        volume=`pulsemixer --get-volume`
	muted=`pulsemixer --get-mute`
        [[ $muted -eq 1 ]] && text="Muted" || text="Volume: "
        dunstify -h string:x-canonical-private-synchronous:audio "$text" -h int:value:"$volume" -t 1500
}

notifyMic() {
        mic=`pulsemixer --id source-1 --get-mute`
        [[ $mic -eq 1 ]] && text="Mic muted" || text="Mic unmuted"
        dunstify -h string:x-canonical-private-synchronous:mic "$text" -t 1500
}

notifyBrightness() {
        brightness=`xbacklight`
        dunstify -h string:x-canonical-private-synchronous:brightness "Brightness: " -h int:value:"$brightness" -t 1500
}

case "$1" in
        volume)
                notifyAudio
	        ;;
        mic)
                notifyMic
                ;;
        brightness)
                notifyBrightness
                ;;
        *)
                echo "Not the right arguments"
                echo "$1"
                exit 2
esac

