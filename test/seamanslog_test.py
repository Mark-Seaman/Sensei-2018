
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def seamanslog_list_test():
    return shell('x seamanslog list')

def seamanslog_show_test():
    return check_shell_lines('x seamanslog show', 1000, 3000)

def seamanslog_summary_test():
    return shell('x seamanslog summary')

def seamanslog_words_test():
    return shell('x seamanslog words')

    