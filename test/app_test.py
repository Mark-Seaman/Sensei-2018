from os import environ

from os.path import join

from bin.shell import  file_tree_list, read_file, shell, check_shell_lines, check_lines
from bin.switches import BASE_DIR


def app_classes_test():
    return shell('x app classes')


def app_functions_test():
    return check_shell_lines('x app functions', 700, 800)


def app_list_test():
    return shell('x app list')


def app_switches_test():
    return read_file(BASE_DIR+'/bin/switches.py')


def app_settings_test():
    return read_file(BASE_DIR+'/hammer/settings.py')


def app_show_test():
    return check_shell_lines('x app show', 9000, 10000)


def app_signature_test():
    return shell('x app signature')


def app_url_test():
    return shell('x app urls')

