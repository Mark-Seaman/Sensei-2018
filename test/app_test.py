from bin.app import *
from bin.shell import check_lines
from bin.switches import BASE_DIR


def app_classes_test():
    return app_classes()


def app_functions_test():
    return check_lines('App Functions', app_functions(), 900, 950)


def app_list_test():
    return check_lines('App Source Files', '\n'.join(app_source()), 120, 140)


def app_switches_test():
    return read_file(BASE_DIR+'/bin/switches.py')


def app_settings_test():
    return read_file(BASE_DIR+'/hammer/settings.py')


def app_show_test():
    return check_lines('App Source Code', app_show(), 9000, 10100)


def app_signature_test():
    return check_lines('Function Signatures', app_signature(), 1200, 1300)


def app_url_test():
    return check_lines('Function Signatures', app_urls(), 90, 100)
