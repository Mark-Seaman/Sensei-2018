from django.utils.timezone import now
from os import listdir
from os.path import join
from random import choice

from bin.shell import read_file
from hammer.settings import BASE_DIR
from tool.document import doc_title, text_to_html, domain_doc, doc_html_text
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



def page_settings(domain, title, site_title):
    header = header_settings(site_title)
    menu = get_menu(title)
    time = now()
    return dict(title=title, menu=menu,  header=header, theme=theme(domain), time=time)


def page_text(domain, title):
    domdoc = domain_doc(domain, title)
    text = doc_html_text(title, '/static/images')
    url = "https://%s/%s" % (domain, domdoc)
    doc = title.split('/')[-1]
    title = doc_title(title)
    return dict(doc=doc, title=title, text=text, url=url)


# TODO: simplify the menu loading and active item highlight
def get_menu(title):
    if title.startswith('info') or title.startswith('task'):
        time = ' active' if (title == 'task') else ''
        future = ' active' if (title == 'info/Aspire') else ''
        return 'ASPIRE ', [
            dict(url='/info/Done', label='Past', active=time),
            dict(url='/info/Index', label='Present', active=(not future and not time)),
            dict(url='/info/Aspire', label='Future', active=future),
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
        # index = ' active' if (title == 'seamanslog/Index') else ''
        listing = ' active' if (title == 'seamanslog/List') else ''
        reading = not listing
        return "Seaman's Log", [
            # dict(url='https://seamanslog.com/seamanslog/Index', label='Blog', active=index),
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
            dict(url='https://shrinking-world.com/shrinkingworld/Leverage', label='Book', active=' active'),
            dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part1', label='Leverage', active=''),
            dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part2', label='Development', active=''),
            dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part3', label='Devops', active=''),
            dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part4', label='People', active=''),
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
        return dict(title="Seaman's Guides", subtitle='Software Development Courses',
                    logo="/static/images/SWS_Logo_200.jpg", logo_text='Shrinking World Solutions')

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
        return 'seaman_theme.html'
    elif domain == 'seamansguide.com':
        return 'seaman_theme.html'
    else:
        return 'mybook_theme.html'


def topic_menu(title, topics, base, home):

    def is_active(active):
        return ' active' if active and active[0] else ''

    menu_items = [dict(url=base+i[0], label=i[1], active=is_active(i[2:])) for i in topics]
    return home, menu_items


# ----------------------
# View Adapters

def seamanslog_menu(title):

    def menu_items(title):
        return [('List', 'Articles', title == 'Index'),
                ('Random', 'Read', title != 'List' and title != 'Index'),
                ('https://markseaman.org', 'Mark Seaman')]

    return topic_menu(title, menu_items(title), '/seamanslog/', "Seaman's Log")


def seamanslog_settings(domain, title):
    site_title = ("Seaman's Log", 'Big Ideas & Deep Thoughts')
    logo = ("/static/images/MarkSeaman.100.png", 'Mark Seaman')
    menu = seamanslog_menu(title)
    header = header_settings(site_title, logo)
    theme = 'seaman_theme.html'
    time = now()
    text = page_text(domain, 'seamanslog/' + title)
    return dict(title=text['title'], menu=menu, header=header, theme=theme, text=text['text'], url=text['url'], time=time)

