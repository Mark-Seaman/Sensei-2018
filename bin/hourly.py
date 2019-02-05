from datetime import datetime
from os import environ, system
from os.path import join

from shell import banner, read_file


# ------------------------------
# Command Interpreter

def hourly_command(options):
    #print('Hourly command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd=='edit':
            hourly_edit()
        elif cmd=='list':
            hourly_list()
        elif cmd=='run':
            hourly_run()
        elif cmd=='show':
            hourly_show()
        else:
            hourly_help(args)
    else:
        hourly_help()


def hourly_help(args=None):
    print('''
        Hourly Command

        usage: x hourly COMMAND

        COMMAND:

            edit - edit the hourly task
            list - list the document files
            run  - run all the requested scripts
            show - show the doc content
        ''')


# ------------------------------
# Functions

def hourly_doc_path(doc=None):
    return join(environ['p'], 'bin', 'hourly.py')


def hourly_edit():
    system('e '+hourly_doc_path())


def hourly_list():
    print('\nHourly Tasks\n')
    print(hourly_tasks)
    print('\nDaily Tasks\n')
    print(daily_tasks)


daily_tasks = '''
          # x spiritual article
          # x seamanslog article
          x data backup
          # rm $p/log/django.log
      '''

hourly_tasks = '''
          echo "PATH=" `path`
          echo "env=" `env`
          echo Python: `which python`
          # git status
          x tst
          x tst list
          x tst send
      '''


def hourly_run():

    def execute(cmd):
        for t in cmd.split('\n'):
            t = t.strip()
            if t:
                print(t)
                if t.startswith('x '):
                    t = 'cd $p && python bin/x.py '+t[2:]
                    print('python:' + t)
                else:
                    print('shell:' + t)
                system(t)

    # Daily tasks
    if datetime.now().hour == 8:
        execute(daily_tasks)

    # Hourly tasks
    execute(hourly_tasks)


def hourly_show():
    print('Hourly Show')
    path = hourly_doc_path()
    print(banner(path.replace(path+'/', '')))
    print(read_file(path))

