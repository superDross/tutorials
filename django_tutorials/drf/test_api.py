from pprint import pprint

import requests

l = requests.get("http://127.0.0.1:8000/snippets/")
pprint(l.json())

d = requests.get("http://127.0.0.1:8000/snippets/1.json")
pprint(d.json())
