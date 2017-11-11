#!/usr/bin/python3
# -*- coding: utf-8 -*-

import urllib.request
import json

# API token
api_key = '7ba14b76dcea0086a03f8eca5a3a801f:1:74295566'
category = 'editorial'

for i in range(5):
    url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?" \
          "q={0}&api-key={1}&page={2}".format(category, api_key, i)
    h = urllib.request.urlopen(url)
    result = json.loads(h.read().decode('utf-8'))
    print("Headline:",result['response']['docs'][0]['headline']['main'])
    # The original program uses 'abstract' in the last bracket,
    # The API's been changed and comes with 'snippet' instead.
    print(result['response']['docs'][0]['snippet'])
    print()
