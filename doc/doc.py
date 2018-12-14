# doc.py - Query and data type manipulation

from os.path import basename
from os import listdir, mkdir, remove
from os.path import exists, isfile, isdir, join, dirname

from models import Doc
from tool.document import doc_html_text
from tool.log import log


# Add
def doc_add(name):
    log('doc_add', name)
    o = Doc.objects.get_or_create(name=name)[0]
    #o.abc = abc
    o.save()


def doc_breadcrumbs(title):
    parts = title.split('/')
    crumbs = []
    path = ''
    for p in parts:
        path += p
        crumbs.append(path)
        path += '/'
    crumbs = ['<a href="/doc/%s">%s</a>' % (c,basename(c)) for c in crumbs]
    return ' * '.join(crumbs)


# Delete
def doc_delete(pk):
    log('Doc delete', pk)
    Doc.objects.filter(pk=pk).delete()


def doc_dir_exists(path):
    path = doc_path(path)
    return exists(path) and isdir(path)


def doc_dir_list(path):
    def link(url, path, text):
        return '<li><a href="/doc/%s">%s</a></li>' % (url,text)

    return '\n'.join([link(join(path[10:], path, d), d) for d in listdir(path)])


def doc_dir_tree(path):

    def links(path):
        x = []
        for d in listdir(path):
            title = path[10:]
            x.append(link(join(title, d), path, d))
        return '<ul>' + '\n'.join(x) + '</ul>'

    def link(url, path, text):
        path = join(path,text)
        return '<li><a href="/doc/%s">%s</a>%s</li>' % (url, text, doc_dir_tree(path))

    if doc_dir_exists(path):
        return links(path)
    return ''


# Edit
def doc_edit(pk, name):
    log('project_add', name)
    o = Doc.objects.get(pk=pk)
    o.name = name
    o.save()


def doc_exists(path):
    path = doc_path(path)
    return exists(path) and isfile(path)


# Get
def doc_lookup(pk):
    return Doc.objects.get(pk=pk)


# Get
def doc_get(client, name):
    return Doc.objects.get(client=client, name=name)


# HTML
def doc_html(title):
    path = join('Documents', title)
    if doc_exists(path):
        return doc_html_text(title)
    else:
        if doc_dir_exists(path):
            return doc_dir_tree(path)
            #return doc_dir_list(path)


# Path
def doc_path(title):
    return join('Documents', title)


# Print List
def doc_print(objects):
    print('\n\n' % ''.join(Doc.labels))
    for x in objects:
        print('\n    doc %s. ' % x.pk)
        fields = [('%-15s' % f) for f in objects.as_row()]
        print(''.join(fields))


# List
def doc_query(select=None):
    if select:
        objects = Doc.objects.filter(client=select)
    else:
        objects = Doc.objects.all()
    return [x.as_row() for x in objects.order_by('-pk')]


# Read
def doc_read(path):
    if doc_exists(path):
        return open(doc_path(path)).read()
    else:
        if doc_dir_exists(path):
            return 'No file content for newly created file, '+path


# Remove
def doc_remove(path):
    if doc_exists(path):
        remove(doc_path(path))


# Table
def doc_table(select=None):
    return Doc.labels(), doc_query(select)


# Write
def doc_write(path, text):
    dir_path = dirname(path)
    path = doc_path(path)
    if not doc_dir_exists(dir_path):
        mkdir(doc_path(dir_path))
    open(path, 'w').write(text+'\n')

