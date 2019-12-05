#!/usr/bin/python

import requests
import json

url = "https://hyperplanning.univ-paris13.fr/hp2109/invite/"

session = requests.Session()
numeroOrdre = '45C48CCE2E2D7FBDEA1AFC51C7C6AD26fb1600e1708b109e5ef12bcb46c8d631' # Doesn't work obv


jar = requests.cookies.RequestsCookieJar()
jar.set('resolution','1920x1080')
session.cookies = jar

r = session.get(url)
jasondata = json.loads(str(r.text)
print(r)


"""
Problem with numerOrdre which is encrypted ...
- Maybe simulate a browser (browserify & nodejs maybe puppeteer..) to get missing field 
- Or extract json from webpage and use it as PoC ... 
"""


