#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Get random jokes from the Internet Chuck Norris Database
import urllib.request
import json

# The API allows picking from a specified category
url = 'http://api.icndb.com/jokes/random?=limitTo=[nerdy]'

resp = urllib.request.urlopen(url).read()
data = json.loads(resp.decode('utf-8'))

print("A random joke for you:")
print(data['value']['joke'])
