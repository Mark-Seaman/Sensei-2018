
from bin.shell import shell, check_shell_lines


def days_list_test():
    return shell('x days list 15 2017-03-01')


def days_month_test():
    return check_shell_lines('x days month', 32, 32)


def days_show_test():
    return check_shell_lines('x days list', 9, 9)

