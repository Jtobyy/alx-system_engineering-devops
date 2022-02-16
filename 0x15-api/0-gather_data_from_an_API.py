#!/usr/bin/python3
'''Gets information of a given emplyee from a REST API and displays
this information'''

import json
import sys
import urllib.request

if __name__ == '__main__':
    id = sys.argv[1]
    req1 = urllib.request.Request(
        'https://jsonplaceholder.typicode.com/users/{}'.format(id))
    req2 = urllib.request.Request(
        'https://jsonplaceholder.typicode.com/users/{}/todos'.format(id))
    with urllib.request.urlopen(req1) as response:
        inres1 = response.read().decode('utf-8')
    with urllib.request.urlopen(req2) as response:
        inres2 = response.read().decode('utf-8')
    task_done = 0
    titles = []
    res1 = json.loads(inres1)
    res2 = json.loads(inres2)
    for todo in res2:
        if todo.get('completed') is True:
            task_done += 1
            titles.append(todo.get('title'))
    print("Employee {} is done with tasks({}/{}):"
          .format(res1.get('name'), task_done, len(res2)))
    for title in titles:
        print('\t {}'.format(title))
