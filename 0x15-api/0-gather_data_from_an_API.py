#!/usr/bin/python3
"""
Gets information of a given emplyee from a REST API
"""
import json
import sys
import urllib.request


if __name__ == "__main__":
    """main function"""
    id = sys.argv[1]
    req1 = urllib.request.Request(
        f'https://jsonplaceholder.typicode.com/users/{id}'
        )
    req2 = urllib.request.Request(
        f'https://jsonplaceholder.typicode.com/users/{id}/todos'
        )
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
    print(f"Employee {res1.get('name')} is done with tasks({task_done}/\
{len(res2)}):")
    for title in titles:
        print(f'\t {title}')
