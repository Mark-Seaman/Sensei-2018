
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def datatype_list_test():
    return shell('x datatype list')

def datatype_show_test():
    return check_shell_lines('x datatype show', 2200, 2500)


    