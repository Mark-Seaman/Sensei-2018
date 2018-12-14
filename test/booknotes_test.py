
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def booknotes_list_test():
    return shell('x booknotes list')


def booknotes_lines_test():
    return check_shell_lines('x booknotes content', 1500, 1600)
