from platform import node
from os import environ
from sys import version_info

from bin.shell import check_lines, check_shell_lines, file_tree_list, shell
from bin.switches import TEST_DOC


def system_bashrc_test():
    home = environ['HOME']
    return shell('cat %s/.bashrc %s/.profile' %(home, home))


def system_bin_test():
    return shell('ls -l bin')


def system_cron_test():
    return shell('crontab -l')


def system_disk_free_test ():
    df = shell('df /')
    used = df.split()[-2][:-1]
    if (int(used) > 80):   # Disk usage should be less than 80%
        print('Disk Free: %s percent (should be less than 80)\n%s' % (used, df))


def system_env_test():
    return "Environment Context contains %d variables" % len(shell('env').split('\n'))

    
def system_files_count_test():
    files = file_tree_list(environ['p'])
    return check_lines('File list', '\n'.join(files), 5800, 8000)


def system_host_test():
    return 'Hostname: %s' % node()


def system_ip_test():
    return check_shell_lines ('ifconfig', 45, 70)


def system_pandoc_test():
    return shell('pandoc  -t html %s' % 'Documents/info/Test/Index')


def system_pipenv_test():
    return open('hammer/Pipfile').read()


def system_python_files_test():
    files = file_tree_list(environ['p'], '.py')
    return check_lines('Python file list', '\n'.join(files), 160, 180)


def system_python_version_test():
    return str(version_info)


def system_python_virtualenv_test():
    return shell ('which python')

