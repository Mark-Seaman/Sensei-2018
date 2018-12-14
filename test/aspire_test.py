
from os import environ
from os.path import join

from bin.shell import file_tree_list, shell, check_shell_lines


def aspire_list_test():
    return check_shell_lines('x aspire list', 250, 500)


def aspire_show_test():
    return check_shell_lines('x aspire show', 10, 20)


# def aspire_score_test():
#     return shell('x aspire score')


def aspire_report_test():
    return check_shell_lines('x aspire report', 2, 2)

    
def aspire_week_test():
    return check_shell_lines('x aspire week', 15, 21)

    
