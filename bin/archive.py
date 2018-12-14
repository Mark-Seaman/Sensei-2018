from os import environ, listdir
from os.path import exists, join

from bin.files import grep


def list_archives():
    path = join(environ['HOME'], 'Archive')
    if not exists(path):
        return 'No archive home directory on this computer'
    archives = [join(path, d, '.git/config') for d in listdir(path)]
    archives = [grep('url', a) for a in archives if exists(a)]
    return '\n'.join(archives)
