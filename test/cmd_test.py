from bin.shell import  shell, check_shell_lines


def cmd_list_test():
    return shell('x cmd list')

def cmd_show_test():
    return check_shell_lines('x cmd read cmd', 218, 230)


    