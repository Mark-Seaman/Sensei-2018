from bin.shell import check_lines, shell, file_tree_list

from tool.models import Test


def tst_test():
    return shell('x tst list')


def tst_time_test():
    return shell('date')


# def remote_server_test():
#     return shell('x server command bin/remote_tests.py')

