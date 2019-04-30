from os import environ, system
from os.path import join
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep

from hammer.secret_settings import username, password

from .models import Page
from .log import log_exception
from .page import page_results


# ------------------------------
# Command Interpreter

def robot_command(options):
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd == 'list':
            print('\n'.join(robot_list()))
        elif cmd == 'get':
            robot_fetch_page(args[0])
        elif cmd == 'results':
            robot_results()
        elif cmd == 'run':
            robot_run()
        else:
            robot_help(options)
    else:
        robot_help(options)


def robot_help(args=None):
    print('        x robot ' + ' '.join(args))
    print('''
        usage: x robot COMMAND

        COMMAND:

            list    - list the document files
            results - show the results of the pages
            run     - go fetch all of the pages
        ''')


# ------------------------------
# Functions

def robot_doc_path(doc=None):
    path = join(environ['p'], 'test', 'robot_pages')
    if doc:
        path = join(path, doc)
    return path


def robot_fetch_page(url):
    print('fetching page %s ...' % url)
    browser = webdriver.Chrome(environ['HOME'] + '/Tools/selenium/chromedriver')
    browser.get('https://%s' % url)
    body = browser.find_element_by_tag_name('body')
    # html = body.get_attribute('innerHTML').encode('ascii', 'ignore')
    text = body.text.encode('ascii', 'ignore')
    browser.quit()
    print('PAGE TEXT:\n'+text)


def robot_get_page(browser, page):
    try:
        if page.endswith('login'):
            robot_login(browser,page)
        browser.get('https://%s' % page)
        body = browser.find_element_by_tag_name('body')
        html = body.get_attribute('innerHTML').encode('ascii', 'ignore')
        text = body.text.encode('ascii', 'ignore')
        if not text:
            text = 'No text'
        if not html:
            html = 'No HTML'
    except:
        text = 'Web page not found: ' + page
        html = 'BAD HTML'
        log_exception()
    return text, html


def robot_list():
    path = robot_doc_path()
    return [f for f in open(path).read().split('\n') if f]


def robot_login(browser,page):
    browser.get('https://%s' % page)
    username_field = browser.find_element_by_name('username')
    username_field.send_keys(username)
    password_field = browser.find_element_by_name('password')
    password_field.send_keys(password)
    password_field.send_keys(Keys.RETURN)
    sleep(2)


def robot_results():
    print(page_results())


def robot_run():
    print('robot run')
    for url in robot_list():
        Page.objects.get_or_create(url=url)
    browser = webdriver.Chrome(environ['HOME']+'/Tools/selenium/chromedriver')
    for page in Page.objects.all():
        print('Getting page ... %s' % page.url)
        text,html = robot_get_page(browser, page.url)
        page.text = text
        page.html = html
        page.save()
    browser.quit()
    robot_results()


