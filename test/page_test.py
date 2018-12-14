from bin.shell import check_shell_lines


def page_list_test():
    return check_shell_lines('x page list', 18, 30)


def page_text_test():
    return check_shell_lines('x page text all', 400, 1000)


def page_diff_test():
    return check_shell_lines('x page diff', 1, 100)
