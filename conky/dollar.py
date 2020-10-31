#!/usr/bin/python3

import re
from urllib.request import urlopen

url = "https://gee.bccr.fi.cr/indicadoreseconomicos/Cuadros/frmConsultaTCVentanilla.aspx"
page = urlopen(url)

html_bytes = page.read()
html = html_bytes.decode("utf-8")

mRSS = re.search("Banco BAC San José(.*)", html)

dollar = []
time = ""
if mRSS:
    html_rss = mRSS.group(1)
    #print(html_rss)
    data = html_rss.split("td align=")
    for l in data:
        mDollar = re.search("size=\"\d+\">(.*)</font", l)
        mTime = re.search("size=\"\d+\">(\d+/\d+/\d+)\s+(.*)</font>", l)
        if mDollar:
            num = mDollar.group(1)
            dollar.append(num)
        if mTime:
            time = "%s %s" %(mTime.group(1),mTime.group(2))


print("%s"%(time))
print("%s - %s"%(dollar[0],dollar[1]))

