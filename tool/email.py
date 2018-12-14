from django.core.mail import send_mail
from django.template.loader import render_to_string
from os.path import exists

from tool.log import log, log_exception, log_notifications
from hammer.settings import EMAIL_FROM
from tool.document import doc_html_text

SEND_NOTIFICATIONS = True


# ------------------------------
# Command Interpreter

def email_command(options):
    log('email command %s' % options)

    if not options:
        email_help()
    else:
        cmd = options[0]
        args = options[1:]
        if cmd == 'doc':
            send_doc_email(args)
        if cmd == 'text':
            send_text_email(args)
        elif cmd == 'file':
            send_file_email(args)
        elif cmd == 'html':
            send_html_email(args)
        elif cmd == 'template':
            send_template_message(args)
        elif cmd == 'test':
            from notify import notify_test_email, notify_test_results
            notify_test_results()
        else:
            email_help()


def email_help():
    print('''

        script to manage pages on servers

        usage: x email COMMAND

        COMMAND:

            doc      - send a document by email
            file     - send file content in message
            html     - send HTML content in message
            text     - send HTML content in message
            template - send HTML content using a template
            test     - send canned message for testing
            
            ''')


def email_args(args, use_html=True):
    if args:
        subject = args[0]
    else:
        subject = 'No Subject'
    if args[1:]:
        text = args[1]
        html = '<h1>%s</h1><pre>%s</pre>' % (subject, text)
    else:
        text = 'No text for message'
    if args[2:]:
        recipients = args[2]
    else:
        recipients = EMAIL_FROM
    if use_html:
        return dict(
                    subject=subject, from_email=EMAIL_FROM, recipient_list=recipients,
                    message=text, html_message=html
                )
    else:
        return dict(
                    subject=subject, from_email=EMAIL_FROM, recipient_list=recipients,
                    message=text
                )


def send_support_request(title, text):
    log('send_support_request (%s, %s)' % (title, text))
    me = 'Mark.B.Seaman@gmail.com'
    options = dict(subject=title, from_email=me, recipient_list=[me], message=text)
    send_mail(**options)


def send_file_email(args):
    if exists(args[1]):
        args[1] = open(args[1]).read()
    args[2] = args[2].split(',')
    #send_html_email(args)
    print(args)


def send_doc_email(args):
    email_to = args[0].split(',')
    doc = args[1]
    title = ' '.join(args[2:])
    text = doc_html_text(doc)
    data = dict(title='Document: %s' % doc, doc=doc, body=text)
    html = render_to_string('message_doc.html', data)
    options = dict(
        subject=title, from_email=EMAIL_FROM, recipient_list=email_to,
        message=html, html_message=html
    )
    send_mail(**options)
    print(args)


def send_text_email(args):
    log('send_text_email')
    options = email_args(args, False)
    send_mail(**options)


def send_html_email(args):
    log('send_html_email')
    options = email_args(args)
    send_mail(**options)


def send_template_message(emailTo, title, template, data={}):
    try:
        s = 'send_template_message (subject = %s, emailTo = %s)' % (title, emailTo)
        log(s)
        if SEND_NOTIFICATIONS:
            log_notifications(title, emailTo)
            html = render_to_string(template, data)
            options = dict(
                subject=title, from_email=EMAIL_FROM, recipient_list=emailTo,
                message=html, html_message=html
            )
            send_mail(**options)
            log('send successful: %s' % emailTo)
            print(s+" successful !")
        else:
            log('email on this system is disabled: %s' % emailTo)
            print(s + " disabled !")
    except:
        log('Error: during send_mail: To %s' % emailTo)
        log_exception()
        print(s + " error !")
