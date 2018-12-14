# book.py - Query and data type manipulation

from os.path import exists, join, isdir
from os import listdir

from author import author_doc
from tool.log import log
from models import Book
from hammer.settings import BASE_DIR


# Canonical data queries

def book_add_data(author):
    pass

def book_delete_data(book):
    pass

def book_detail_data(book):
    pass

def book_edit_data(book):
    pass

def book_list_data(author):
    pass


# Add
def book_add(args):
    log('book_add', args)
    o = Book()
    o.title = ' '.join(args)
    o.save()


# Delete
def book_delete(pk):
    log('Book delete', pk)
    Book.objects.filter(pk=pk).delete()


# Read
def book_lookup(pk):
    return Book.objects.get(pk=pk)


# # Print List
# def book_print(objects):
#     print('\n\n' % ''.join(Book.labels))
#     for x in objects:
#         print('\n    book %s. ' % s.pk)
#         fields = [('%-15s' % f) for f in objects.as_row()]
#         print(''.join(fields))


# Doc
def book_doc(author, doc):
    b = Book.objects.filter(author=author, doc=doc)
    if b:
        return b[0]


# List
def book_query(select):
    # return [x.as_row() for x in Book.objects.filter(pk__gt=select)]
    return [x.as_row() for x in Book.objects.all()]


# Stats
def book_stats(book):
    if book:
        chapters = book_chapters(book)
        return {
            'directory': book_path(book),
            'book': book,
            'chapters': chapters,
            'words': 1000,
            'pages': 4,
        }


# Path to doc
def book_path(book, chapter=None):
    doc = author_doc(book.author, book.doc)
    path = join(BASE_DIR, 'Documents', doc)
    if chapter:
        path = join(path,chapter)
    return path


# Chapters
def book_chapters(book):
    if exists(book_path(book, 'Chapters')):
        chapters = chapter_text(book, 'Chapters').split('\n')
    elif isdir(book_path(book)):
        chapters = listdir(book_path(book))
    else:
        chapters = []
    chapters = [[c]+chapter_size(book,c) for c in chapters if c]
    return chapters


# Chapter Text
def chapter_text(book, chapter):
    path = book_path(book, chapter)
    return open(path).read()


def chapter_size(book, chapter):
    text = chapter_text(book, chapter)
    words = len(text.split())
    pages = words/250
    return [words, pages]
