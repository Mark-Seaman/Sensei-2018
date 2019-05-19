from django.utils.timezone import now
from os import listdir
from os.path import join
from random import choice

from bin.shell import read_file
from hammer.settings import BASE_DIR
from tool.document import text_to_html, domain_doc, doc_html_text
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
    if title.startswith('info') or title.startswith('task'):
        time = ' active' if (title == 'task') else ''
        future = ' active' if (title == 'info/Aspire.md') else ''
        return 'ASPIRE ', [
            dict(url='/task/time', label='Past', active=time),
            dict(url='/info/Index', label='Present', active=(not future and not time)),
            dict(url='/info/Aspire.md', label='Future', active=future),
            dict(url='https://shrinking-world.com', label='Shrinking World', active=''),
            dict(url='https://markseaman.org', label='Mark Seaman', active=''),
        ]
    elif title.startswith('markseaman'):
        return 'Mark Seaman ', [
            dict(url='https://seamanslog.com', label='Blog', active=''),
            dict(url='https://shrinking-world.com', label='Shrinking World', active=''),
            dict(url='https://markseaman.org', label='Mark Seaman', active=' active'),
        ]
    elif title.startswith('seamanslog'):
        index = ' active' if (title == 'seamanslog/Index') else ''
        listing = ' active' if (title == 'seamanslog/List') else ''
        reading = (not index and not listing)
        return "Seaman's Log", [
            dict(url='https://seamanslog.com/seamanslog/Index', label='Blog', active=index),
            dict(url='https://seamanslog.com/seamanslog/List', label='Articles', active=listing),
            dict(url='https://seamanslog.com/seamanslog/Random', label='Read', active=reading),
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
            dict(url='https://shrinking-world.com/Leverage', label='Book', active=' active'),
            dict(url='https://shrinking-world.com/Leverage/Part1', label='Leverage', active=''),
            dict(url='https://shrinking-world.com/Leverage/Part2', label='Development', active=''),
            dict(url='https://shrinking-world.com/Leverage/Part3', label='Devops', active=''),
            dict(url='https://shrinking-world.com/Leverage/Part4', label='People', active=''),
        ]
    elif title.startswith('guide'):
        return "Seaman's Guide", [
            dict(url='https://shrinking-world.com', label='Shrinking World', active=''),
            dict(url='https://shrinking-world.com/unc/', label='UNC Courses', active=''),
            dict(url='https://markseaman.org', label='Mark Seaman', active=''),
        ]
    else:
        return 'Shrinking World', [
            dict(url='https://seamanslog.com',      label='Blog',               active=''),
            dict(url='https://shrinking-world.com', label='Shrinking World',    active=''),
            dict(url='https://markseaman.org',      label='Mark Seaman',        active=' active'),
        ]


def header_info(domain):
    if domain == 'markseaman.org':
        return dict(title='Mark Seaman', subtitle='Inventor - Teacher - Writer',
                    logo="/static/images/MarkSeaman.100.png", logo_text='Mark Seaman')

    elif domain == 'markseaman.info':
        return dict(title='My Brain', subtitle='Private notes and secrets',
                    logo="/static/images/SWS_Logo_200.jpg", logo_text='Shrinking World Solutions')

    elif domain == 'seamanslog.com':
        return dict(title="Seaman's Log", subtitle='Big Ideas & Deep Thoughts',
                    logo="/static/images/MarkSeaman.100.png", logo_text='Mark Seaman')

    elif domain == 'seamansguide.com':
        return dict(title="Seaman's Log", subtitle='Big Ideas & Deep Thoughts',
                    logo="/static/images/SWS_Logo_200.jpg", logo_text='Shrinking World Solutions')

    # elif domain == 'spiritual-things.org':
    #     return dict(title='Spiritual Things', subtitle='Daily Inspiration',
    #                 logo="/static/images/MarkSeaman.100.png", logo_text='Mark Seaman')

    else:
        return dict(title="Shrinking World", subtitle='Software Development Training',
                    logo="/static/images/SWS_Logo_200.jpg", logo_text='Shrinking World Solutions')


def header_settings(site_title, logo=(None,None)):
    return dict(title=site_title[0], subtitle=site_title[1], logo=logo[0], logo_text=logo[1])


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



def topic_menu(title, topics, base, home):
    def is_active(title, topic):
        return ' active' if title.startswith(topic) else ''

    menu_items = [dict(url=base+i[0], label=i[1], active=is_active(title,i[0])) for i in topics]
    return home, menu_items


def page_settings(domain, title, site_title, menu):
    domdoc = domain_doc(domain, title)
    text = doc_html_text(domdoc, '/static/images')
    url = "https://%s/%s" % (domain, domdoc)
    header = header_settings(site_title)
    time = now()
    return dict(title=title, text=text, menu=menu, url=url, header=header, time=time)