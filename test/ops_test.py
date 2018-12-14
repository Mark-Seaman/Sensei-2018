
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines
from bin.switches import ON_INTERNET, SERVER_TYPE


# def ops_git_pull_test():
#     if ON_INTERNET and SERVER_TYPE == 'dev':
#         return shell('x ops dev commit pull')


def ops_help_test():
    return check_shell_lines('x ops production help', 17, 30)


def ops_server_test():
    return shell('x ops production server')


def ops_server_type_test():
    return shell('x ops production type')


def ops_status_test():
    return shell('x ops production status')

