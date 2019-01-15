from os import listdir
from os.path import exists, isdir, isfile, join
from random import choice

from bin.shell import read_file
from hammer.settings import BASE_DIR
from tool.document import doc_html_text, text_to_html
from tool.log import log
# from tool.domain import domain_directory


def mybook_path(page):
    return join(BASE_DIR, 'Documents', page)


# def mybook_random_select(directory):
#     path = mybook_path(directory)
#     log('doc_random_select -- dir', path)
#     select = choice(listdir(path))
#     log('doc_random_select',  select)
#     return select
#

# def mybook_redirect(host, page, user):
#     if not page:
#         return '/Index'
#
#     log('mybook_redirect (host=%s, page=%s)' % (host,page))
#     path = mybook_path(page)
#     index = path + '/Index'
#     random = path + '/Random'
#
#     dom = domain_directory(host)
#     log('domain directory', dom)
#     if dom and not page.startswith(dom):
#         if page:
#             url = '/' + dom + '/' + page
#         else:
#             url = '/' + dom
#         log('domain_redirect --> ', url)
#         return url
#
#     if exists(path) and isdir(path) and exists(random+'Dir') and isfile(random+'Dir'):
#
#         return '/' + choice(open(random+'Dir').read().split('\n')[:-1])
#
#     if exists(path) and isdir(path) and exists(random) and isfile(random):
#         if page:
#             new_page = '/' + page + '/' + mybook_random_select(path)
#         else:
#             new_page = '/xxx'
#         log('doc_redirect --> %s' % new_page)
#         return new_page
#     if exists(path) and isdir(path) and exists(index) and isfile(index):
#         if page:
#             new_page = '/'+ page + '/Index'
#         else:
#             new_page = '/Index'
#         log('doc_redirect --> %s' % new_page)
#         return new_page
#     if not exists(path):
#         return '/missing/' + page


# def mybook_site(title):
#     return title.split('/')[0]


def mybook_site_title(title):

    def site_title_text(page):
        x = page.split('/')
        for i, d in enumerate(x):
            f = join('Documents', '/'.join(x[:len(x) - i - 1]), 'SiteTitle')
            # print i, f
            if exists(f):
                return open(f).read().split('\n')

    label = site_title_text(title)
    if label:
        return label[:2]

    return ('My Book Online', 'Personal Publishing')


def mybook_content(author, title):
    if title.startswith('role'):
        return {
            'title': title,
            'doc': join('mybook', 'author', author.name(), title),
            'text': '<h1>%s</h1>' % title,
        }
    else:
        doc = join('aspire', 'clients', author.name(), title)
        return {
            'title': title,
            'doc': doc,
            'text': doc_html_text(doc),
        }


def main_menu(menu, page=None):

    def menu_active(page, menu_item):
        if page and page.startswith(menu_item):
            return 'class=active'

    def menu_entry(page, x):
        icon, label, url = x
        return url, "zmdi-" + icon, label, menu_active('/'+page, url)

    def menu_read(menu, page):
        menu_items = menu_text(page).split('\n')
        menu_data = [m.split(',') for m in menu_items if m]
        return [menu_entry(page, x) for x in menu_data]

    def menu_text(page):
        # print 'split page '+page
        x = page.split('/')
        for i, d in enumerate(x):
            f = join('Documents', '/'.join(x[:len(x) - i - 1]), 'Menu')
            # print i, f
            if exists(f):
                log('Menu', f)
                return open(f).read()
        return 'home,Home,/MarkSeaman'

    return menu_read(menu, page)


def booknotes_excerpt(doc):

    def booknotes_doc_path(doc=None):
        path = join(BASE_DIR, 'Documents', 'booknotes')
        if doc:
            path = join(path, doc)
        return path

    def booknotes(doc):
        if not doc:
            not_these = ['Index', 'Menu', 'SiteTitle']
            notes = [b for b in listdir(booknotes_doc_path()) if b not in not_these]
            doc = choice(notes)
        return doc

    def excerpt(note):
        path = booknotes_doc_path(note)
        text = read_file(path).split('\n\n## Excerpts\n\n')
        if text[1:]:
            excerpts = text[1].split('\n\n')
            excerpts = [e for e in excerpts if e and e!='\n']
            excerpt = choice(excerpts).replace('\n',' ')
            log('Booknotes - %s: %s' % (path, excerpt))
            excerpt = '\n\n## Excerpt\n\n'+excerpt
        else:
            excerpt = ''
        summary = text[0]
        return text_to_html(summary + excerpt)

    doc = booknotes(doc)
    return excerpt(doc), 'http://markseaman.org/booknotes/%s' % doc
