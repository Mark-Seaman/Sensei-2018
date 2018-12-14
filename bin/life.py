
from os import environ, system
from os.path import join

from doc import doc_words
from shell import banner, file_tree_list, read_file
from switches import TODO_DIR


def life_command(options):
    # print('life command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='edit':
            life_edit(args[0])
        elif cmd=='list':
            life_list(args)
        elif cmd=='publish':
            life_publish(args)
        elif cmd=='show':
            life_show(args)
        elif cmd=='todo':
            life_todo(args)
        elif cmd=='web':
            life_web(args)
        elif cmd=='words':
            life_words(args)
        else:
            life_help(args)
    else:
        life_help()


def life_doc_path(doc=None):
    path = join(environ['p'], 'Documents', 'guide', 'Life')
    if doc:
        path = join(path, doc)
    return path


def life_edit(doc):
    system('e '+life_doc_path(doc))


def life_help(args=None):
    print('''
        life Command

        usage: x life COMMAND

        COMMAND:

            edit  - edit a doc file
            list - list the document files
            publish - send the files to the remote server
            show    - show the doc content
            todo    - todo list
            web     - view the web page online
            words   - count words in document
        ''')


def life_list(args):
    print('life list')
    path = life_doc_path()
    for f in file_tree_list(path):
        print(f.replace(path+'/', ''))


def life_publish(args):
    system('x vc ' + ' '.join(args))
    system('x staging deploy')


def life_show(args):
    if args:
        for f in args:
            print(read_file(life_doc_path(f)))
    else:
        path = life_doc_path()
        for f in file_tree_list(path):
            print(banner(f.replace(path+'/', '')))
            print(read_file(f))


def life_todo(args):
    for x in ['Today', '2016-10', 'Write-ToDo', 'Write-Done']:
        system('e %s' % join(TODO_DIR, x))


def life_web(args):
    system('x web seamansguide.com/Life')


def life_words(args):
    if args:
        for f in args:
            doc_words(join('guide', 'Life', f))
    else:
        doc_words(join('guide', 'Life'))

    