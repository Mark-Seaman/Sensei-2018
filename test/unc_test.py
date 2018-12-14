from os import environ
from os.path import join

from bin.shell import check_files


def unc_files_test():
    path = join(environ['HOME'], 'Projects', 'UNC-2018-Spring')
    return check_files(path, 6400, 7500)

