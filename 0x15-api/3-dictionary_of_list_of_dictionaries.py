#!/usr/bin/python3
'''A script that gets information of a given emplyee from
a REST API and exports this information in CSV format.
'''
import json
import urllib.request


if __name__ == '__main__':
    req1 = urllib.request.Request(
        'https://jsonplaceholder.typicode.com/users')
    req2 = urllib.request.Request(
        'https://jsonplaceholder.typicode.com/todos')
    with urllib.request.urlopen(req1) as response:
        inres1 = response.read().decode('utf-8')
    with urllib.request.urlopen(req2) as response:
        inres2 = response.read().decode('utf-8')

    res1 = json.loads(inres1)
    res2 = json.loads(inres2)

    values = []
    id = 1
    users_no = len(res1)
    totaldict = {}
    while id <= users_no:
        for todo in res2:
            if todo.get('userId') == id:
                for user in res1:
                    if user.get('id') == id:
                        tododict = {"username": user.get('username')}
                        break
                tododict["task"] = todo.get('title')
                tododict["completed"] = todo.get('completed')
                values.append(tododict)
        totaldict[id] = values
        values = []
        id += 1

    filename = "todo_all_employees.json"
    with open(filename, 'w+', encoding='utf-8') as file:
        file.write(json.dumps(totaldict))
