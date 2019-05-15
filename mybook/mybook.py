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


def get_menu(title):
    if title.startswith('info'):
        return 'Mark ', [
            dict(url='https://seamanslog.com', label='Blog', active=''),
            dict(url='https://shrinking-world.com', label='Shrinking World', active=''),
            dict(url='https://markseaman.org', label='Mark Seaman', active=' active'),
        ]
    elif title.startswith('markseaman'):
        return 'Mark ', [
            dict(url='https://seamanslog.com', label='Blog', active=''),
            dict(url='https://shrinking-world.com', label='Shrinking World', active=''),
            dict(url='https://markseaman.org', label='Mark Seaman', active=' active'),
        ]
    elif title.startswith('seamanslog'):
        index = ' active' if (title == 'seamanslog/Index') else ''
        return "Seaman's Log", [
            dict(url='https://seamanslog.com/seamanslog/Index', label='Blog', active=index),
            dict(url='https://seamanslog.com/seamanslog/List', label='Articles', active=''),
            dict(url='https://seamanslog.com/seamanslog/Random', label='Read', active=''),
            dict(url='https://markseaman.org', label='Mark Seaman', active=''),
        ]
    elif title.startswith('spiritual'):
        index = ' active' if (title == 'spiritual/Index') else ''
        return "Spiritual Things", [
            dict(url='https://seamanslog.com/seamanslog/Index', label='A', active=index),
            dict(url='https://seamanslog.com/seamanslog/List', label='B', active=''),
            dict(url='https://seamanslog.com/seamanslog/Random', label='C', active=''),
            dict(url='https://markseaman.org', label='Mark Seaman', active=''),
        ]
    elif title.startswith('shrinkingworld'):
        index = ' active' if (title == 'seamanslog/Index') else ''
        return "Shrinking World", [
            dict(url='https://shrinking-world.com', label='Training Center', active=index),
            dict(url='https://shrinking-world.com/Leverage/', label='Leverage', active=''),
            dict(url='https://seamansguide.com', label='Guide', active=''),
            dict(url='https://seamanslog.com', label="Seaman's Log", active=''),
        ]
    elif title.startswith('Leverage'):
        return "Shrinking World", [
            dict(url='https://shrinking-world.com/Leverage',       label='Book',        active=' active'),
            dict(url='https://shrinking-world.com/Leverage/Part1', label='Leverage',    active=''),
            dict(url='https://shrinking-world.com/Leverage/Part2', label='Development', active=''),
            dict(url='https://shrinking-world.com/Leverage/Part3', label='Devops',      active=''),
            dict(url='https://shrinking-world.com/Leverage/Part4', label='People',      active=''),
        ]
    else:
        return 'Shrinking World', [
            dict(url='https://seamanslog.com',      label='Blog',               active=''),
            dict(url='https://shrinking-world.com', label='Shrinking World',    active=''),
            dict(url='https://markseaman.org',      label='Mark Seaman',        active=' active'),
        ]


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