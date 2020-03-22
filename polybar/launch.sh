#!/usr/bin/env bash

# Terminate any currently running instances
killall -q polybar

# Pause while killall completes
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/Config/polybar/config example &
  done
else
  polybar --reload -c ~/Config/polybar/config example &
fi

# Launch bar(s)
# polybar example -q &
# polybar top -q &
# polybar bottom -q  &

echo "polybars launched..."
