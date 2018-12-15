"""
Django settings for Hammer project.

"""

from platform import node
from os.path import dirname, join


BASE_DIR = dirname(dirname(__file__))
DOC_ROOT = join(BASE_DIR, 'Documents')
LOG_DIR = join(BASE_DIR, 'log')


# SECURITY WARNING: don't run with debug turned on in production!
if 'MyBook' == node():
    DEBUG = False
else:
    DEBUG = True
    ALLOWED_HOSTS = ['*']
DEBUG = True


# Application definition
INSTALLED_APPS = [
    # Django System
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.humanize',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # MyBook
    'aspire',
    'guide',
    'health',
    'life',
    'mybook',
    'superuser',
    'tasks',
    'tool',
    'unc',
]

MIDDLEWARE_CLASSES = [
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

# Loading templates
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            join(BASE_DIR, "templates"),
            join(BASE_DIR, 'contact', "templates"),
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                # Insert your TEMPLATE_CONTEXT_PROCESSORS here or use this
                # list if you haven't customized them:
                'django.contrib.auth.context_processors.auth',
                'django.template.context_processors.debug',
                'django.template.context_processors.i18n',
                'django.template.context_processors.media',
                'django.template.context_processors.static',
                'django.template.context_processors.tz',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

ROOT_URLCONF = 'hammer.urls'
LOGIN_URL='/login/'
LOGIN_REDIRECT_URL = '/'

WSGI_APPLICATION = 'hammer.wsgi.application'

EMAIL_FROM = "mark.seaman@shrinking-world.com"


# Secrets
from secret_settings import DATABASES, SECRET_KEY, EMAIL_HOST, EMAIL_PORT, EMAIL_HOST_USER, EMAIL_HOST_PASSWORD, EMAIL_USE_TLS


AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'US/Mountain'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static server
STATIC_URL = '/static/'
STATICFILES_DIRS = (BASE_DIR + '/static', BASE_DIR + '/docs',)

LOGGING = {

    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        # 'django-file': {
        #     'level': 'DEBUG',
        #     'class': 'logging.FileHandler',
        #     'filename': join(BASE_DIR, 'log', 'django.log'),
        # },
        'hammer-file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': join(BASE_DIR, 'log', 'hammer.log'),
        },
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
        },
    },
    'loggers': {
        # 'django': {
        #     'handlers': ['django-file'],
        #     'level': 'DEBUG',
        #     'propagate': True,
        # },
        'tool': {
            'handlers': ['hammer-file'],
        },
    },
    'root': {'level': 'INFO'},
}



if 'MyBook' in node():

    # Allow Django from all hosts. This snippet is installed from
    # /var/lib/digitalocean/allow_hosts.py

    import os
    import netifaces

    # Find out what the IP addresses are at run time
    # This is necessary because otherwise Gunicorn will reject the connections
    def ip_addresses():
        ip_list = []
        for interface in netifaces.interfaces():
            addrs = netifaces.ifaddresses(interface)
            for x in (netifaces.AF_INET, netifaces.AF_INET6):
                if x in addrs:
                    ip_list.append(addrs[x][0]['addr'])
        return ip_list

    # Discover our IP address
    domains = [
        'shrinking-world.com',
        'markseaman.info',
        'markseaman.org',   
        'markseaman.org',
        'shrinking-world.com',
        'seamanslog.com',
        'seamansguide.com',
        'shrinking-world.com',
        'spiritual-things.org',
        'shrinking-world.com',
    ]
    ALLOWED_HOSTS = domains + ip_addresses()


