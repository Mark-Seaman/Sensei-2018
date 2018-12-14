from os.path import exists, isdir, join

from bin.pandoc import text_to_html, file_to_html
from bin.shell import read_file
from hammer.settings import BASE_DIR
from tool.log import log


def doc_cards(page):
    if doc_exists(page):
        text = doc_content(page)
    else:
        text = 'No Document found, %s' % page
    text = text.split('\n## ')
    results =[]
    for i, t in enumerate(text):
        t = t.split('\n')
        title = t[0]
        body = '\n'.join(t[1:])
        body = text_to_html(body)
        results.append((title, body))
    return results


def doc_content(page):
    return read_file(doc_path(page))


def doc_dir_exists(title):
    log('doc_dir_exists', title)
    path = doc_path(title)
    return isdir(path)


def doc_exists(title):
    log('doc_exists',title)
    path = doc_path(title)
    if exists(path) or exists(path+'.md'):
        return not isdir(path)


def doc_html_text(page, image_path=None):
    return file_to_html(doc_path(page), image_path)


def doc_link(title):
    return title.replace('.md', '')


def doc_path(page):
    return join(BASE_DIR, 'Documents', page)


