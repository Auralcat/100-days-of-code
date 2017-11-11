#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Data scraping example using the results from 2015.
# The data is extracted from the JSON file given by worldcup.sfg.io

import urllib.request
import json

# Get the raw data from the URL
resp = urllib.request.urlopen('http://worldcup.sfg.io/matches').read()

# Ensure that you can handle non-ASCII characters from the result:
for game in json.loads(resp.decode('utf-8')):
    if game['status'] == 'completed':
        print("Location: %s" % game['location'])
        print("Date: %s" % game['datetime'])
        print(game['home_team']['country'], game['home_team']['goals'], 'x',
              game['away_team']['country'], game['away_team']['goals'])
