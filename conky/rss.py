#!/usr/bin/python3

import re
from urllib.request import urlopen

url = "https://www.elfinancierocr.com"
page = urlopen(url)

html_bytes = page.read()
html = html_bytes.decode("utf-8")

mRSS = re.search("LO MÁS RECIENTE(.*)VIDEOS", html)

if mRSS:
    html_rss = mRSS.group(1)
    data = html_rss.split("a href")
    for l in data:
        mStory = re.search("story/\">(.*)</a> <span>(.*)</span> </div>", l)
        if mStory:
            title = mStory.group(1)
            time = mStory.group(2)
            print("%s - %s"%(time,title))




