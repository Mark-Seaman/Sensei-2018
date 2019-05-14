from os import listdir
from os.path import exists, join
from random import choice

from bin.shell import read_file
from hammer.settings import BASE_DIR
from tool.document import doc_html_text, text_to_html, domain_doc
from tool.log import log


def mybook_path(page):
    return join(BASE_DIR, 'Documents', page)
#
#
# def mybook_site_title(title):
#
#     def site_title_text(page):
#         x = page.split('/')
#         for i, d in enumerate(x):
#             f = join('Documents', '/'.join(x[:len(x) - i - 1]), 'SiteTitle')
#             # print i, f
#             if exists(f):
#                 return open(f).read().split('\n')
#
#     label = site_title_text(title)
#     if label:
#         return label[:2]
#
#     return ('My Book Online', 'Personal Publishing')
#
#
# def mybook_content(author, title):
#     if title.startswith('role'):
#         return {
#             'title': title,
#             'doc': join('mybook', 'author', author.name(), title),
#             'text': '<h1>%s</h1>' % title,
#         }
#     else:
#         doc = join('aspire', 'clients', author.name(), title)
#         return {
#             'title': title,
#             'doc': doc,
#             'text': doc_html_text(doc),
#         }


def booknotes_excerpt(doc):

    def booknotes_doc_path(doc=None):
        path = join(BASE_DIR, 'Documents', 'MarkSeaman', 'booknotes')
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
    return excerpt(doc), 'http://markseaman.org/MarkSeaman/booknotes/%s' % doc


def domain_menu(domain, page):
    domdoc = domain_doc(domain, page)
    site = mybook_site_title(domdoc)
    return main_menu(site, domdoc)


def theme(domain):
    if domain == 'spiritual-things.org':
        return 'spiritual_theme.html'
    elif domain == 'markseaman.org':
        return 'log_theme.html'
    elif domain == 'markseaman.info':
        return 'task_theme.html'
    elif domain == 'seamanslog.com':
        return 'log_theme.html'
    elif domain == 'seamansguide.com':
        return 'guide_theme.html'
    else:
        return 'mybook_theme.html'