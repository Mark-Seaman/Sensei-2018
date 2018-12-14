from os import listdir, mkdir, remove
from os.path import exists, isfile, isdir, join, dirname

from client import client_user
from tool.document import doc_html_text


def doc_dir_exists(path):
    return exists(path) and isdir(path)


def doc_exists(path):
    return exists(path) and isfile(path)


def doc_folder(path):
    assert exists(path) and isfile(path)
    text = doc_read(path)
    doc_delete(path)
    mkdir(path)
    doc_write(path+'/Index', text)


def doc_index(path):
    if path.endswith('/Index'):
        return sorted(listdir(dirname(path)))


def doc_delete(path):
    assert doc_exists(path)
    remove(path)


def doc_directory(path):
    files = []
    for d in listdir(path):
        x = join(path, d)
        if isdir(x):
            files.append([d, listdir(x)])
        else:
            files.append([d])
    return files


def doc_html(path):
    if doc_exists(path):
        return doc_html_text(path)
    else:
        if doc_dir_exists(path):
            return 'No file content for newly created file, ' + path


def doc_path(user, title):
    client = client_user(user)
    #return join('aspire', 'clients', client.name(), title)
    return client.doc_path(title)


def doc_read(path):
    if doc_exists(path):
        return open(path).read()
    else:
        if doc_dir_exists(path):
            return 'No file content for newly created file, '+path


def doc_remove(path):
    if doc_exists(path):
        remove(path)


def doc_write(path, text):
    dir_path = dirname(path)
    if not doc_dir_exists(dir_path):
        mkdir(dir_path)
    open(path, 'w').write(text+'\n')


def doc_project(path):
    if not doc_dir_exists(path):
        mkdir(path)
    if not doc_exists(path + '/Index'):
        doc_write(path + '/Index', '# %s\n\nThis is a newly created project' % path)

