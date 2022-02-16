#!/usr/bin/python3
"""Queries the Reddit API and returns the number of
subscribers (not active users,total subscribers) for a given subreddit.
"""
import requests


def number_of_subscribers(subreddit):
    r = requests.get('https://reddit.com/r/programming/',
                     allow_redirects=False)
    if r.status_code != 200:
        return 0
    return len(r)
