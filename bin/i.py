from os import environ, system
from os.path import join
from sys import argv


# ------------------------------
# Command Interpreter

def idea_command(options):
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='edit':
            i_edit(args)
        elif cmd=='list':
            return i_list(args)
        else:
            i_list(options)
    else:
        i_help()


def i_help(args=None):
    print('''
        i Command

        usage: x i [COMMAND] [Idea to save]

        COMMAND:

            edit  - edit the ideas file
            list  - list the ideas
        ''')


# ------------------------------
# Functions

def doc_path():
    return join(environ['p'], 'Documents', 'info', 'ideas')

def i_add(args):
    if args:
        open(doc_path(), 'a').write(' '.join(args) + '\n')
    
def i_edit(args):
    i_add(args)
    system('e '+doc_path())


def i_list(args):
    i_add(args)
    return open(doc_path()).read()


if __name__ == '__main__':
    print ('idea script')
    print(idea_command(argv[1:]))
