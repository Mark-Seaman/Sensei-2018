
from os import system

from switches import  server_host
from vc import vc_commit
from web import web


host = server_host('MyBook')


# ------------------------------
# Command Interpreter

def ops_command(options):
    if options:
        print('Ops Command - %s' % ' '.join(options))
        cmd = options[0]
        args = options[1:]

        if cmd=='command':
            ops_cmd(args)
        elif cmd=='console':
            ops_console()
        elif cmd=='deploy':
            ops_deploy()
        elif cmd=='log':
            ops_log()
        elif cmd=='restart':
            ops_restart()
        elif cmd=='root':
            ops_root()
        elif cmd=='update':
            ops_update(args)
        else:
            ops_help(cmd, args)
    else:
        ops_help()


def ops_help(cmd=None, args=None):
    print('''
        ops %s %s

        usage: x ops COMMAND [ARGS]

        COMMAND:

            command - execute a single command on the remote server
            console - login to production
            deploy  - push all changes to staging server
            log     - show the log on the production server
            restart - restart the web server
            root    - show the root console
            update  - push all files to remote server

        ''' % (cmd, args))

# ------------------------------
# Functions


def ops_cmd(args):
    remote_command(host, ' '.join(args))
    

def ops_console():
    system('ssh django@%s' % host)


def ops_deploy():
    print('Deploy new code with remote pull')
    remote_command(host, 'x vc pull')
    ops_restart()


def ops_log():
    cmd = 'command tail -99 log/hammer.log'
    print('%s: %s' % (host, cmd))
    remote_command(host, cmd)


def ops_restart():
    print('Remote service restart')
    ops_root(host, 'service gunicorn restart')
    ops_root(host, 'service nginx restart')
    

def ops_root(server=host, cmd=''):
    system('ssh root@%s %s' % (server, cmd))


def ops_update(args):
    vc_commit(args)
    ops_deploy()
    web('http://markseaman.info/task/import')


def remote_command(server, cmd, user='django'):
    bashrc = 'source /home/django/MyBook/bin/bashrc>/dev/null' 
    script = "%s && %s" % (bashrc, cmd)
    ssh = 'ssh %s@%s -C \"%s\"' % (user, server, script)
    print('\nRemote Execution \n    ssh %s@%s \"%s\"' % (user, server, cmd))
    system (ssh)
