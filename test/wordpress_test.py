
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def wordpress_list_test():
    return shell('x wordpress list')

def wordpress_host_test():
    return check_shell_lines('x wordpress host', 20, 30)


    