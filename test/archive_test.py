from os import environ
from os.path import exists, join

from bin.shell import check_file_list, shell
from bin.archive import list_archives
from bin.switches import TEST_ARCHIVE


def archive_files_test():

    if TEST_ARCHIVE:
        dirs = [
            #('Code', 153898),
            ('MyBook-2018', 5657, 5660),
            ('MyBook-2017', 5657, 5660),
            ('Documents-2018', 1293, 1300),
            ('Documents-2017', 1293, 1300),
            ('Documents-2016', 1364, 1370),
            ('Documents-2015', 3326),
            ('Documents-2014', 6095),
            ('UNC-2017-Fall', 14678, 14780),
            ('UNC-2018-Spring', 14678, 14780),
            ('UNC-2018-Fall', 14678, 14780),
            ('rcp', 39700, 41000),
        ]
        path = join(environ['HOME'], 'Archive')
        return check_file_list(path, dirs)
    else:
        return '\n'.join(shell('x tst output archive-files').split('\n')[4:])
    

def archive_dirs_test():
    if TEST_ARCHIVE:
        path = join(environ['HOME'], 'Archive')
        return shell('du -s '+path)
    else:
        return '\n'.join(shell('x tst output archive-dirs').split('\n')[4:])

# def archive_content_test():
#     files = file_list(join(environ['HOME'], 'Archive'))
#     files += file_list(join(environ['HOME'], 'Archive', 'Code'))
#     return '\n'.join(files)


def archive_nts_test():
    if exists(join(environ['HOME'], 'Archive', 'Documents-2016', 'ntsh')):
        return ('Opened NTSH')
    if exists(join(environ['HOME'], 'Archive', 'Documents-2016', '.ntsh.opc')):
        return ('Closed NTSH.OPC')


def archive_repo_test():
    return list_archives()
    