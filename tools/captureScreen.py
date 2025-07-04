import os
import time

for i in range(10):
    os.system("adb shell input keyevent KEYCODE_APP_SWITCH")
    time.sleep(0.2)
    os.system("adb exec-out screencap > screenshot_%d.png" % i)