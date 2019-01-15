#!/usr/bin/env python

from os import system
from sys import argv


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
    # cmd = 'diff %s %s' % (f1,f2)
    # system(cmd)


update_chapter(argv[1])
compare_chapter(argv[1])
