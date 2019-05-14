from os import listdir
from os.path import join
from random import choice

from bin.shell import read_file
from hammer.settings import BASE_DIR
from tool.document import  text_to_html
from tool.log import log


def mybook_path(page):
    return join(BASE_DIR, 'Documents', page)


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


def theme(domain):
    if domain == 'spiritual-things.org':
        return 'spiritual_theme.html'
    elif domain == 'markseaman.org':
        return 'seaman_theme.html'
    elif domain == 'markseaman.info':
        return 'task_theme.html'
    elif domain == 'seamanslog.com':
        return 'log_theme.html'
    elif domain == 'seamansguide.com':
        return 'guide_theme.html'
    else:
        return 'mybook_theme.html'