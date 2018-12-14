from os.path import exists, isdir, join

from bin.pandoc import file_to_html
from models import Client
from tool.log import log
from tool.user import user_add


def client_add(name, email, organization):
    log('client_add (name=%s, email=%s, organization=%s)' % (name, email, organization))
    user = user_add(name,email)
    return Client.objects.get_or_create(user=user, organization=organization)[0]


def client_login_request(name, email, organization):
    text = '''<h1>Sign up request for Aspire</h1>

    <ul>
    <li>Name: %s</li>
    <li>Email: %s</li>
    <li>Organization: %s</li>
    </ul>

    <br>
    <p>
        To add this user visit the following link and fill out the form.
    </p>
    <p>http://the-very-idea.com/aspire/client_add</p>

    ''' % (name, email, organization)
    # TODO: open(BASE_DIR+'/Documents/send/aspire','w').write(text+'\n')


def client_user(user):
    if user.username:
        return Client.objects.get_or_create(user=user)[0]


def client_doc_path(client, doc=None):
    return client.doc_path(doc)


def client_is_doc(client, doc):
    path = join('aspire', 'clients', client.name())
    return doc.startswith(path)


def client_doc_text(client, doc):
    if client_doc_exists(client, doc):
        log('client_doc_text', doc)
        log('file_to_html', client.doc_path(doc))
        return file_to_html(client.doc_path(doc))


def client_doc_exists(client, doc):
    f = client.doc_path(doc)
    is_doc = exists(f) and not isdir(f)
    log('client_doc_exists: path = %s, exists = %s, dir= %s' % (f, exists(f), isdir(f)))
    return is_doc


def client_list():
    return Client.objects.all()


def my_client(user):
    return Client.objects.get(user=user)