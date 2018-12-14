#!/usr/bin/env python

from sys import argv
from os import system


def sys_command():
    #print argv
    cmd = argv[1]

    if cmd == 'gunicorn':
        system('cat /etc/systemd/system/gunicorn.service')

    elif cmd == 'nginx':
        system('cat /etc/nginx/sites-available/django')

    elif cmd == 'set-gunicorn':
        system('cp ~django/MyBook/config/gunicorn.P.1 /etc/systemd/system/gunicorn.service')

    elif cmd == 'set-nginx':
        system('cp ~django/MyBook/config/nginx.P.1    /etc/nginx/sites-available/django')

    else:
        print('''
                usage:  ./x.py  command

                gunicorn
                nginx
                set-gunicorn
                set-nginx
             '''

sys_command()

