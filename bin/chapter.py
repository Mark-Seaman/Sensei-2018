#!/usr/bin/env python

from os import system
from sys import argv


chapter_list = '''
AppendixA
AppendixB
AppendixC
Code
Debt
Deployment
Design
Knowledge
Learning
Leverage
Monitoring
Part1
Part2
Part3
Part4
Planning
Practices
Preface
Release
Services
Teamwork
Technology
Test
'''


def compare_chapter(c):
    print('Compare Chapter - %s' % c)
    cmd = 'diff ~/Sensei/Documents/Leverage/%s /Users/seaman/Archive/Leverage/chapters/%s.md' % (c,c)
    print(cmd)
    system(cmd)


def update_chapter(c):
    print('Update Chapter - %s' % c)
    f1 = '/Users/seaman/Sensei/Documents/Leverage/%s' % c
    f2 = '/Users/seaman/Archive/Leverage/chapters/%s.md' % c
    text = open(f2).read()
    # print(text)
    text = text.replace('## Chapter ', '## ')  
    text = text.replace('\n\\pagebreak\n', '') 
    text = text.replace('](images/', '](img/Leverage/') 
    open(f1, 'w').write(text)


def chapters():
    return chapter_list.split('\n')[1:-1]

def update_all_chapters():
    for c in chapters():
        update_chapter(c)
        compare_chapter(c)
     
update_all_chapters()


