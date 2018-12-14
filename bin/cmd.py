from glob import glob
from os import environ, chdir

from log import log
from shell import  file_path, file_list, line_count, read_file, shell


# ----------------------------
# Command Interpreter

def cmd_command(options):
    '''
    Execute a command script from scriptor.  Parse off command and args and dispatch it.
    '''
    log('Cmd command output %s' % options)
    chdir(environ['p'])
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='add':
            cmd_add(args)
        elif cmd=='edit':
            cmd_edit(args)
        elif cmd=='function':
            cmd_function(args)
        elif cmd=='list':
            cmd_list()
        elif cmd=='length':
            cmd_length()
        elif cmd=='read':
            cmd_read(args)
        else:
            cmd_help()
    else:
        cmd_help()


def cmd_help():
    print('''
        usage: x cmd command

        command:
            add      - Add a new command
            edit     - Edit a specific document file
            function - Add a new function to a command script
            help     - Show the commands
            list     - List the available commands
            length   - Measure the lines in each doc
            read     - Show the text from all document

        ''')


# ----------------------------
# Function

def cmd_add(args):
    path = file_path('bin', args[0]+'.py')


    cmd_text = """
# TODO: bin/x.py
#
#   from xxx import xxx_command
#   elif cmd=='xxx':
#       xxx_command(args)
#

from os import environ, system
from os.path import join

from shell import banner, file_tree_list, read_file


# ------------------------------
# Command Interpreter

def xxx_command(options):
    print('xxx command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='edit':
            xxx_edit(args[0])
        elif cmd=='list':
            xxx_list(args)
        elif cmd=='show':
            xxx_show(args)
        else:
            xxx_help(args)
    else:
        xxx_help()


def xxx_help(args=None):
    print('''
        xxx Command

        usage: x xxx COMMAND

        COMMAND:

            edit  - edit a doc file
            list - list the document files
            show - show the doc content
        ''')


# ------------------------------
# Functions

def xxx_doc_path(doc=None):
    path = join(environ['p'], 'Documents', 'xxx')
    if doc:
        path = join(path, doc)
    return path


def xxx_edit(doc):
    system('e '+xxx_doc_path(doc))


def xxx_list(args):
    print('xxx list')
    path = xxx_doc_path()
    for f in file_tree_list(path):
        print(f.replace(path+'/', ''))


def xxx_show(args):
    print('xxx Show')
    path = xxx_doc_path()
    for f in file_tree_list(path):
        print(banner(f.replace(path+'/', '')))
        print(read_file(f))

    """.replace('xxx', args[0])
    open(path, 'w').write(cmd_text)
    print(shell('e %s' % path))

    test_text = '''
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def xxx_list_test():
    return shell('x xxx list')

def xxx_show_test():
    return check_shell_lines('x xxx show', 20, 30)


    '''.replace('xxx', args[0])
    path = path.replace('bin/', 'test/').replace('.py','_test.py')
    open(path, 'w').write(test_text)
    print(shell('e %s' % path))
    print(shell('e bin/x.py bin/bash-alias'))


def cmd_edit(args):
    print(shell('e %s' % cmd_path(args)))


def cmd_path(args):
    files = glob('*/%s.py' % args[0])
    if files:
        return file_path(files[0])
    else:
        return file_path('bin', args[0]+'.py')
   

def cmd_function(args):
    if args[1:]:
        file, function = args
        function_string = '''
        # TODO: yyy xxx
        #
        # elif cmd=='xxx':
        #     yyy_xxx(args)
        # xxx  - do it
        # def yyy_xxx(args):
        #      print(args, 'not implemented')
        #     
        '''.replace('yyy',file).replace('xxx',function)
        open(cmd_path(args), 'a').write(function_string)
        cmd_edit(args)
    else:
        print('usage:  xxx cmd_file function')


def cmd_list():
    files = file_list('bin','.py')
    files = [f for f in files if f!='__init__.py']
    for f in files:
        print(f)


def cmd_length():
    files = file_list('bin','.py')
    files = [f for f in files if f!='__init__.py']
    for f in files:
        fp = file_path('bin', f)
        print('%-20s %d' % (f, line_count(fp)))


def cmd_read(args):
    if args:
        path = file_path('bin', args[0]+'.py')
        text = read_file (path)
        print(text)
    else:
        files = file_list('bin','.py')
        files = [f for f in files if f!='__init__.py']
        for f in files:
            path = file_path('bin', f)
            text = read_file(path)
            print(text)


