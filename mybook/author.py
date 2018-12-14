# author.py - Query and data type manipulation

from django.contrib.auth.models import User
from os.path import join

from models import Author
from tool.document import doc_html_text
from tool.log import log

# Canonical data queries

def author_add_data(username, email):
    pass

def author_delete_data(author):
    pass

def author_detail_data(author):
    pass

def author_edit_data(author):
    pass

def author_list_data():
    pass


# Add
def author_add(args):
    log('author_add', args)
    user = User.objects.get(first_name='Mark', last_name="Seaman")
    o = Author.objects.create(user=user, organization='No organization')
    return o


# Delete
def author_delete(pk):
    log('Author delete', pk)
    Author.objects.filter(pk=pk).delete()


# Read
def author_lookup(pk):
    return Author.objects.get(pk=pk)


# Print List
def author_print(objects):
    print('\n\n' + ''.join(Author.labels))
    for s in objects:
        print('\n    skill %s. %s' % (s.pk, s.name))
        fields = [('%-15s'%f) for f in objects.as_row()]
        print(''.join(fields))


# List
def author_query(select):
    return [x.as_row() for x in Author.objects.filter(author=select)]


# User
def author_user(user):
    return Author.objects.get(user=user)


# Doc
def author_doc(author, title):
    return join('mybook', 'author', author.name(), title)


# Doc
def author_doc_content(doc):
    return doc_html_text(doc)
