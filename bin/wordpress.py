from os import environ, system
from os.path import join

from shell import banner, file_tree_list, read_file


# ------------------------------
# Command Interpreter

def wordpress_command(options):
    #print('wordpress command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd == 'edit':
            wordpress_edit(args[0])
        elif cmd == 'hostname':
            wordpress_host(args)
        elif cmd == 'list':
            wordpress_list(args)
        elif cmd == 'ssh':
            wordpress_ssh(args)
        else:
            wordpress_help(args)
    else:
        wordpress_help()


def wordpress_help(args=None):
    print('''
        wordpress Command

        usage: x wordpress COMMAND

        COMMAND:

            edit - edit a doc file
            list - list the document files
            host - show the host name for the wordpress site
            ssh  - show the root console for server
        ''')


# ------------------------------
# Functions

def wordpress_doc_path(doc=None):
    path = join(environ['p'], 'Documents', 'wordpress')
    if doc:
        path = join(path, doc)
    return path


def wordpress_edit(doc):
    system('e '+wordpress_doc_path(doc))


def wordpress_list(args):
    print('wordpress list')
    path = wordpress_doc_path()
    for f in file_tree_list(path):
        print(f.replace(path+'/', ''))


def wordpress_host(args):
    print('wordpress server hostname:')
    system('ssh root@who2hire.us hostname')

   
def wordpress_ssh(args):
    print('wordpress ssh')
    system('ssh root@who2hire.us')
 