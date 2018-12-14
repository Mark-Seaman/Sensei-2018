'''
Tests for vc code
-------------------

Run all of the tests for the 'vc' objects.  Output the test results.

'''


from bin.shell import  limit_lines
from bin.switches import ON_INTERNET, SERVER_TYPE


def vc_status_test():
    '''Test the git status command'''
    return limit_lines('x vc status', 1, 22)


def vc_pull_test():
    if ON_INTERNET and SERVER_TYPE != 'production':
        return limit_lines('x vc pull', 2, 15)
