from platform import node
from os import environ
from os.path import join
from sys import version_info

from bin.shell import check_lines, check_shell_lines, file_tree_list, line_match, shell
from bin.switches import TEST_DOC


def system_cron_test():
    return shell('crontab -l')


def system_disk_free_test ():
    df = shell('df /')
    used = df.split()[-2][:-1]
    if (int(used) > 80):   # Disk usage should be less than 80%
        print('Disk Free: %s percent (should be less than 80)\n%s' % (used, df))


def system_files_count_test():
    files = file_tree_list(environ['p'])
    return check_lines('File list', '\n'.join(files), 5000, 6000)


def system_host_test():
    return 'Hostname: %s' % node()


def system_ip_test():
    return check_shell_lines ('ifconfig', 51, 69)


def system_pandoc_test():
    return shell('pandoc  -t html %s' % TEST_DOC)


def system_python_files_test():
    files = file_tree_list(environ['p'], '.py')
    return check_lines('Python file list', '\n'.join(files), 150, 200)


def system_python_version_test():
    return str(version_info)


def system_python_virtualenv_test():
        return shell ('which python')
