from os import chdir, environ, system
from sys import argv

from app import app_command
from booknotes import booknotes_command
from data import data_command
from doc import doc_command
from hourly import hourly_command
from i import i_command
from log import log_command
from music import music_command
from ops import ops_command
from seamanslog import seamanslog_command
from text import text_command
from todo import todo_command
from tool import tool_command
from vc import vc_command
from web import web_command
from wordpress import wordpress_command


def execute_command(cmd,args):
    chdir(environ['p'])
    if cmd == 'app':
        app_command(args)

    elif cmd == 'booknotes':
        booknotes_command(args)
    
    elif cmd == 'email':
        command_scriptor(cmd, args)
    
    elif cmd == 'data':
        data_command(args)
    
    elif cmd == 'doc':
        doc_command(args)
    
    elif cmd == 'health':
        command_scriptor(cmd, args)
    
    elif cmd == 'hire':
        command_scriptor(cmd, args)
    
    elif cmd == 'hourly':
        hourly_command(args)

    elif cmd=='i':
        i_command(args)
    
    elif cmd == 'log':
        log_command(args)
    
    elif cmd == 'music':
        music_command(args)
    
    elif cmd == 'node':
        command_scriptor(cmd, args)
    
    elif cmd == 'ops':
        ops_command(args)

    elif cmd == 'page':
        command_scriptor(cmd, args)
    
    elif cmd == 'robot':
        command_scriptor(cmd, args)
    
    elif cmd == 'seamanslog':
        seamanslog_command(args)
    
    elif cmd == 'task':
        command_scriptor(cmd, args)
    
    elif cmd == 'text':
        text_command(args)
    
    elif cmd == 'todo':
        todo_command(args)
    
    elif cmd == 'tool':
        tool_command(args)
    
    elif cmd == 'tst':
        command_scriptor(cmd, args)
    
    elif cmd == 'user':
        command_scriptor(cmd, args)
        
    elif cmd == 'vc':
        vc_command(args)
    
    elif cmd == 'web':
        web_command(args)

    elif cmd == 'wordpress':
        wordpress_command(args)

    else:
        command_help(cmd,args)


def command_help(cmd,args):
    print('''
        Command not found, %s %s

        usage: x cmd [args]

        cmd

            app         # Work with application code
            booknotes   # Manage notes for reading
            data        # Database scripting
            doc         # Manage project documents
            hourly      # Hourly command for maintence
            hours       # Hours of invested time
            log         # Manage logs
            page        # Page Master app
            ops         # Operations script
            project     # Projects for clients
            robot       # Web Robot using Selenium to fetch web pages
            seamanslog  # Seaman's Log blog
            spiritual   # Spiritual Things subscriber list
            software    # Work with software training materials
            task        # Task Master
            todo        # To do list command
            tool        # Manage django tool scripts
            tst         # Run tests with expected results
            web         # Web pages
            wordpress   # Work with wordpress server at Digital Ocean

        Example: 
                 x doc list
                 x tst run
        ''' % (cmd,args))


def command_scriptor(cmd, args):
    system('python manage.py scriptor %s %s' % (cmd, ' '.join(args)))


if __name__ == '__main__':
    if argv[1:]:
        execute_command(argv[1], argv[2:])

    else:
        command_help('',[])

