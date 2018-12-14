from bin.shell import shell
from bin.switches import TEST_EMAIL


def email_test():
    if TEST_EMAIL:
        return(shell('x email test'))

