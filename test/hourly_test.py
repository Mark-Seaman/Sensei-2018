
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def hourly_list_test():
    return shell('x hourly list')

def hourly_show_test():
    return check_shell_lines('x hourly show', 80, 120)


    