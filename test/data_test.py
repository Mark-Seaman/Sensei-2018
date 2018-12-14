'''
Tests for data code
-------------------

Run all of the tests for the 'data' objects.  Output the test results.

'''

from bin.shell import shell, file_list, check_lines
from bin.switches import TEST_DATA

def data_files_test():
    return check_lines('Data files', '\n'.join(file_list('data')), 20, 30)


def data_save_test():
    if TEST_DATA:
        return shell('x data save test')
    else:
        return 'Test is DISABLED'


def data_tables_test():
    if TEST_DATA:
        return shell('x data tables')
    else:
        return 'Test is DISABLED'


def data_migrate_test():
    if TEST_DATA:
        return shell('x data migrate')
    else:
        return 'Test is DISABLED'