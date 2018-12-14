from platform import node

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

if 'seaman-' in node() or 'sws-' in node() or 'iMac' in node():

    # Development server settings

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3', 
            'NAME': 'data/hammer.db',  # Database file
            'USER': '',                            # Not used with sqlite3.
            'PASSWORD': '',                        # Not used with sqlite3.
            'HOST': '',                            # Set to empty string for localhost. 
            'PORT': '',                            # Set to empty string for default. 
        }
    }

elif node() == 'MyBook-Staging':

    # Staging server settings (mybook online)

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': 'django',
            'USER': 'django',
            'PASSWORD': 'xdfwQKUZIZ',
            'HOST': 'localhost',
            'PORT': '',
        }
    }

else:

    # Production server settings  (mybook online)

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': 'django',
            'USER': 'django',
            'PASSWORD': '2nlRtx0NCo',
            'HOST': 'localhost',
            'PORT': '',
        }
    }

# def database_init():
#     from tool.user import *
#     user_add('Mark Seaman', 'Mark.B.Seaman@gmail.com', 'MS1959-sws')


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '6zVnHtBCBGe9U8wJKHU3Xksg9P96hR4LYE0A1UXaeh09ezD4aV'


# User logins
username = 'MarkSeaman'
password = 'MS1959-sws'


# Mandrill Email
# EMAIL_BACKEND = "djrill.mail.backends.djrill.DjrillBackend"
# MANDRILL_API_KEY = "xT7vaqDAdPOY6xeM5Trcow"

# SendGrid Email
# EMAIL_BACKEND = "sgbackend.SendGridBackend"
# SENDGRID_API_KEY = "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"


# SMTP Email
EMAIL_HOST = 'smtp.sendgrid.net'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'ShrinkingWorld'
EMAIL_HOST_PASSWORD = 'SW2007-sg'
EMAIL_USE_TLS = True




