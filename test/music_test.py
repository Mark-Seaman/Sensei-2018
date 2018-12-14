
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def music_list_test():
    return check_shell_lines('x music tracks', 1000, 1600)


    