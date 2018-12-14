from os.path import exists, isdir, isfile, join

from client import client_user
from role import role_query
from tool.document import doc_html_text
from tool.log import log


def doc_redirect(title, user):

    log('doc_redirect', title)

    if not user.username:
        return '/aspire/anon'

    client = client_user(user)
    path = client.doc_path(title)
    index = path + '/Index'

    if exists(path) and isdir(path) and exists(index) and isfile(index):
         if title:
             new_page = '/aspire/'+ title + '/Index'
         else:
             new_page = '/aspire/Index'
         log('doc_redirect --> %s' % new_page)
         return new_page


def aspire_site_title():
    return ('Aspire','Dreams to Reality')


def aspire_context(context, data, page='home'):
    settings = {
        'color': 'green',
        'site':  aspire_site_title(),
        #'menu':  role_menu(),
    }
    context.update(data)
    context.update(settings)
    return context


def  aspire_content(client, title):
    if title.startswith('role'):
        return {
            'title': title,
            'doc': join('aspire', 'clients', client.name(), title),
            'roles': role_query(client),
            'text': '<h1>%s</h1>' % title,
        }
    else:
        doc = join('aspire', 'clients', client.name(), title)
        return {
            'title': title,
            'doc': doc,
            'text': doc_html_text(doc),
        }


