#!/usr/bin/python3
# -*- coding: utf-8 -*-

from urllib.request import Request, urlopen
import json

url = "https://api.propublica.org/campaign-finance/v1/2016/president/totals.json"

# Sáb Nov 11 19:56:57 -02 2017: Got error 500...
q = Request(url)
q.add_header("X-API-Key", 'n8QLPm41NS2Mfak1bam5X7H1evBAOSoF9epQkX0m') # API token
data = urlopen(q).read()
data = json.loads(data.decode('utf-8'))

for candidate in data['results']:
    print(candidate['name'])
    print(candidate['total_contributions'])
    print(candidate['cash_on_hand'])
