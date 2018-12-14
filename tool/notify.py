from os.path import join
from platform import node
from datetime import datetime

from tool.email import send_template_message
from bin.switches import server_host
from tst import tst_results


ADMIN_EMAIL = 'mark.b.seaman@gmail.com'


def notify_test_results():
    host = server_host(node())
    subtitle = 'Test Failed on %s at %s' % (host, datetime.now())
    emailTo = ['mark.seaman@shrinking-world.com', 'mdseaman.c125c@m.evernote.com']
    title = 'Test Results'
    template = 'message_tst_results.html'
    body = tst_results()
    data = dict(subtitle=subtitle, body=body, host=host)
    send_template_message(emailTo, title, template, data)


def notify_test_email():
    emailTo = ["Mark.B.Seaman@gmail.com", 'mdseaman.c125c@m.evernote.com']
    title = "Source code - email.py"
    template = 'message_email.html'
    body = open(join('tool', 'email.py')).read()
    data = dict(body=body)
    send_template_message(emailTo, title, template, data)

