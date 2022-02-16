#!/usr/bin/python3
"""
Task 1
"""
import requests


def top_ten(subreddit):
    r = requests.get('https://reddit.com/r/programming/',
                     allow_redirects=False)
    if r.status_code != 200:
        return 0
    return len(r)
