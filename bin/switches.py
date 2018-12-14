from os import environ
from os.path import join
from platform import node

# Project
HOME = environ.get('HOME', '/home/django')
PROJECT_BASE = join(HOME, 'Projects', 'hammer')


# Application Config
BASE_DIR = environ.get('p', '/home/django/MyBook')

APP_PORT = '8001'
APP_DIRS = ['bin', 'hammer', 'test', 'tool', 'spiritual']
APP_DIR = 'tool'


# Documents
DOC_DIRS = ['tech', 'spiritual', 'software', 'seamanslog', 'brain', 'MarkSeaman']
TODO_DIR  = join(BASE_DIR, 'Documents', 'info', 'days')
THOT_DIR = join(BASE_DIR, 'Documents', 'thot')
TODO_FILES = [
    join(TODO_DIR, '2018-05-08'),
]


# Test Settings
TEST_ARCHIVE = False
TEST_DOC = join(BASE_DIR, 'Documents', 'info', 'history', 'Index')
TEST_DOC_ENCODING = False
TEST_DATA = False
TEST_SELENIUM = True
TEST_EMAIL = False
TEST_PAGES = join(BASE_DIR, 'Documents', 'tech', 'test', 'pages')
TEST_HOSTS = ['localhost:8001', environ.get('DROPLET_IP','localhost')]
IMPORT_RECORDS = True
EXPORT_RECORDS = True
SHOW_WEB_PAGE = False
ON_INTERNET = True


# Servers
WHO2HIRE_PRODUCTION  = 'app.who2hire.us'         # 138.68.46.197
WHO2HIRE_STAGING     = 'who2hire.biz'        # 138.68.229.80
MYBOOK_PRODUCTION    = 'mybookonline.org'    # 138.68.234.96  # old: 45.55.50.13
MYBOOK_STAGING       = 'the-very-idea.us'    # 162.243.52.136
SERVER_DIR           = '/home/django/MyBook'


# Server Types
if node()   == 'MyBook':           
    SERVER_TYPE = 'production'
elif node() == 'MyBook-Staging':   
    SERVER_TYPE = 'staging'
elif node() == 'Marks-iMac.local':
    SERVER_TYPE = 'imac'
elif node() == 'seaman-macbook.local':
    SERVER_TYPE = 'macbook'
else:  
    SERVER_TYPE = 'dev'


# Type of server for this machine
def server_type():
    return SERVER_TYPE


# Select Domain that matches Hostname
def server_host(server):
    if   server == 'who2hire':             return 'who2hire.co'
    elif server == 'who2hire-staging':     return 'who2hire.biz'
    elif server == 'MyBook':               return 'mybookonline.org'
    elif server == 'MyBook-Staging':       return 'the-very-idea.us'
    elif server == 'Marks-iMac.local':     return 'iMac'
    elif server == 'seaman-macbook.local': return 'macbook'

