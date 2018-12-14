
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def health_list_test():
    return shell('x health list')

def health_score_test():
    return check_shell_lines('x health score', 10, 80)


    