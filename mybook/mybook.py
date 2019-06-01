from django.utils.timezone import now
from os import listdir
from os.path import join
from random import choice

from bin.shell import read_file
from hammer.settings import BASE_DIR
from tool.document import doc_title, text_to_html, domain_doc, doc_html_text
from tool.log import log


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


def document_text(title):
    return doc_html_text(title, '/static/images')


def page_settings(title, site_title, logo=None, menu=None, text=None, url=None):
    if logo:
        header = dict(title=site_title[0], subtitle=site_title[1], logo=logo[0], logo_text=logo[1])
    else:
        header = dict(title=site_title[0], subtitle=site_title[1])
    time = now()
    return dict(title=title, menu=menu, header=header, text=text, url=url, time=time)


def page_hyperlink(domain, title):
    domdoc = domain_doc(domain, title)
    return "http://%s/%s" % (domain, domdoc)


def page_doc(title):
    return title.split('/')[-1]


def page_text(domain, title):
    text = doc_html_text(title, '/static/images')
    doc = page_doc(title)
    url = page_hyperlink(domain, title)
    title = doc_title(title)
    return dict(doc=doc, title=title, text=text, url=url)


def topic_menu(topics, base, home):

    def is_active(active):
        return ' active' if active and active[0] else ''

    def menu_url (base, page):
        if page.startswith('http'):
            return page
        else:
            return base + page

    menu_items = [dict(url=menu_url(base, i[0]), label=i[1], active=is_active(i[2:])) for i in topics]
    return home, menu_items


def shrinking_world_menu(title):
    def menu_items(title):
        return [('https://shrinking-world.com', 'Shrinking World', title == 'Index'),
                ('https://shrinking-world.com/Leverage/', 'Leverage'),
                ('https://seamansguide.com', 'Guides'),
                ('https://seamanslog.com', 'Blog'),
                ('https://markseaman.org', 'Mark Seaman')]

    return topic_menu(menu_items(title), '/shrinkingworld/', "Shrinking World")


def leverage_menu(title):

    def menu_items(title):
        return [('https://shrinking-world.com/shrinkingworld/Leverage', 'Book', title == 'Index'),
                ('https://shrinking-world.com/Leverage/Part1', 'Leverage'),
                ('https://shrinking-world.com/Leverage/Part2', 'Development'),
                ('https://shrinking-world.com/Leverage/Part3', 'Operations'),
                ('https://shrinking-world.com/Leverage/Part4', 'Teams')]

    return topic_menu(menu_items(title), '/shrinkingworld/leverage', "The Leverage Principle")


def info_menu(title):

    def menu_items(title):
        return [('Done', 'Past', title == 'Done.md'),
                ('Index', 'Present', title == 'Index.md'),
                ('Aspire', 'Future', title == 'Aspire.md'),
                ('https://shrinking-world.com', 'Shrinking World'),
                ('https://markseaman.org', 'Mark Seaman')]

    return topic_menu(menu_items(title), '/info/', "Brain")


def mark_seaman_menu(title):
    def menu_items(title):
        return [('https://seamanslog.com', 'Blog'),
                ('https://shrinking-world.com', 'Shrinking World'),
                ('https://markseaman.org', 'Mark Seaman', True)]
    return topic_menu(menu_items(title), '/MarkSeaman/', "Mark Seaman")


#         ]
#     elif title.startswith('Leverage'):
#         return "Shrinking World", [
#             dict(url='https://shrinking-world.com/shrinkingworld/Leverage', label='Book', active=' active'),
#             dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part1', label='Leverage', active=''),
#             dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part2', label='Development', active=''),
#             dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part3', label='Devops', active=''),
#             dict(url='https://shrinking-world.com/shrinkingworld/Leverage/Part4', label='People', active=''),
#         ]
#     elif title.startswith('guide'):
#         return "Seaman's Guide", [
#             dict(url='https://shrinking-world.com', label='Shrinking World', active=''),
#             dict(url='https://shrinking-world.com/unc/', label='UNC Courses', active=''),
#             dict(url='https://markseaman.org', label='Mark Seaman', active=''),
#         ]
#     else:
#         return 'Shrinking World', [
#             dict(url='https://seamanslog.com',      label='Blog',               active=''),
#             dict(url='https://shrinking-world.com', label='Shrinking World',    active=''),
#             dict(url='https://markseaman.org',      label='Mark Seaman',        active=' active'),
#         ]
#

# def header_info(domain):
#     if domain == 'markseaman.org':
#         return dict(title='Mark Seaman', subtitle='Inventor - Teacher - Writer',
#                     logo="/static/images/MarkSeaman.100.png", logo_text='Mark Seaman')
#
#     elif domain == 'markseaman.info':
#         return dict(title='My Brain', subtitle='Private notes and secrets',
#                     logo="/static/images/SWS_Logo_200.jpg", logo_text='Shrinking World Solutions')
#
#     elif domain == 'seamanslog.com':
#         return dict(title="Seaman's Log", subtitle='Big Ideas & Deep Thoughts',
#                     logo="/static/images/MarkSeaman.100.png", logo_text='Mark Seaman')
#
#     elif domain == 'seamansguide.com':
#         return dict(title="Seaman's Guides", subtitle='Software Development Courses',
#                     logo="/static/images/SWS_Logo_200.jpg", logo_text='Shrinking World Solutions')
#
#     else:
#         return dict(title="Shrinking World", subtitle='Software Development Training',
#                     logo="/static/images/SWS_Logo_200.jpg", logo_text='Shrinking World Solutions')
#

# def header_settings(site_title, logo=None):
#     if logo:
#         return dict(title=site_title[0], subtitle=site_title[1], logo=logo[0], logo_text=logo[1])
#     return dict(title=site_title[0], subtitle=site_title[1])



# def theme(domain):
#     if domain == 'spiritual-things.org':
#         return 'spiritual_theme.html'
#     elif domain == 'markseaman.org':
#         return 'seaman_theme.html'
#     elif domain == 'markseaman.info':
#         return 'task_theme.html'
#     elif domain == 'seamanslog.com':
#         return 'seaman_theme.html'
#     elif domain == 'seamansguide.com':
#         return 'seaman_theme.html'
#     else:
#         return 'mybook_theme.html'
#

