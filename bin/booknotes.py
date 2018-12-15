from os import environ, listdir, system
from os.path import join
from random import choice

from shell import banner, file_tree_list, read_file
from log import log

# ------------------------------
# Command Interpreter

def booknotes_command(options):
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd == 'content':
            booknotes_content(args)
        elif cmd == 'edit':
            booknotes_edit(args)
        elif cmd == 'excerpt':
            booknotes_excerpt(args)
        elif cmd == 'list':
            booknotes_list(args)
        else:
            booknotes_help(args)
    else:
        booknotes_help()


def booknotes_help(args=None):
    print('''
        booknotes Command

        usage: x booknotes COMMAND

        COMMAND:

            content - show all content
            edit    - edit a doc file
            excerpt - show an excerpt from the booknote doc content
            list    - list the document files
        ''')


# ------------------------------
# Functions

def booknotes_content(args):
    system('cat Documents/MarkSeaman/booknotes/*')


def booknotes_doc_path(doc=None):
    path = join(environ['p'], 'Documents', 'MarkSeaman', 'booknotes')
    if doc:
        path = join(path, doc)
    return path


def booknotes_edit(args):
    system('e '+booknotes_doc_path(args))


def booknotes_excerpt(args):

    def booknotes():
        not_these = ['Index', 'Menu', 'SiteTitle']
        return [b for b in listdir(booknotes_doc_path()) if b not in not_these]

    def excerpt(note):
        print('Book Notes: %s\n\n' % note)
        path = booknotes_doc_path(note)
        text = read_file(path).split('\n\n## Excerpts\n\n')
        excerpts = text[1].split('\n\n')
        excerpts = [e for e in excerpts if e and e!='\n']
        excerpt = choice(excerpts).replace('\n',' ')
        log('Booknotes - %s: %s' % (path, excerpt))
        print(excerpt)
        print('\n\nRead more at\nhttp://markseaman.org/booknotes/%s\n\n' % note)

    print(booknotes())
    if args:
        note = args[0]
    else:
        note = choice(booknotes())
    excerpt(note)


def booknotes_list(args):
    print('booknotes list')
    path = booknotes_doc_path()
    for f in file_tree_list(path):
        print(f.replace(path+'/', ''))

