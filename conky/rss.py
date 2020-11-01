#!/usr/bin/python3

import re
from urllib.request import urlopen

W = 78

url = "https://www.elfinancierocr.com"
page = urlopen(url)

html_bytes = page.read()
html = html_bytes.decode("utf-8")

mRSS = re.search("LO MÁS RECIENTE(.*)VIDEOS", html)

cnt = 0
if mRSS:
    html_rss = mRSS.group(1)
    data = html_rss.split("a href")
    for l in data:
        mStory = re.search("story/\">(.*)</a> <span>(.*)</span> </div>", l)
        if mStory:
            title = mStory.group(1)
            time = mStory.group(2)
            cnt += 1
            print("%8s - %s"%(time,title[0:W]))
            if len(title)>W:
                print("           %s"%(title[W:len(title)]))
                cnt += 1

#print(cnt)
for i in range(10-cnt):
    print("")
    i += 1





