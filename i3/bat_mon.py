#!/ usr / bin / python3

import os
from time import sleep 

full = False
while True:
        cmd = 'cat /sys/class/power_supply/BAT0/capacity'
        bat = int(os.popen(cmd).read())
        if bat < 20:
            os.system("notify-send -t 10000 -u critical 'Battery Low' 'Perc %s'"%bat)
        if bat == 100 and not full:
            os.system("notify-send -t 4000 -u normal 'Battery Full' 'Perc %s'"%bat)
            full = True
        if bat != 100:
            full = False
        sleep(5*60)
