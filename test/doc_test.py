from datetime import datetime

from bin.shell import shell, check_shell_lines
from bin.switches import TEST_DOC_ENCODING
from bin.doc import doc_path, list_documents
from bin.pandoc import file_to_html
from tool.document import doc_exists
from bin.files import encode_text, fix_chars, read_text


def doc_test():
    return check_shell_lines('x doc list', 800, 900)


def doc_help_test():
    return check_shell_lines('x doc', 14, 25)


def doc_search_test():
    return check_shell_lines('x doc search Hammer', 80, 90)


def doc_scan_test():
    if TEST_DOC_ENCODING:
        return shell('x doc test encoding-test')
    else:
        return 'doc_encoding_test is DISABLED'


def doc_file_test():
    if not doc_exists('Test/TestDoc'):
        return  'No file, Test/TestDoc'
    return


def doc_file_missing_test():
    if doc_exists('Test/Missing'):
        return 'OK'
    return 'No file, Test/Missing'


def doc_consolidate():
    return '''
# TODO: Consolidate all doc code

# bin.doc
# doc.doc
# doc.doc_views
# mybook.mybook
# mybook.mybook_views
# tool.document
'''


def doc_render_test():
    if datetime.now().hour == 8:  # Only run at 8 in the morning
        docs = list_documents()
        for doc in docs:
            try:
                text = file_to_html(doc_path(doc))
                open('/tmp/doc_test', 'w').write(text)
            except:
                print('\nbad document: %s - %d chars' % (doc_path(doc), len(text)))
    else:
        return ('Not your time %s:00' % datetime.now().hour)


def doc_encoding_test():
    text16 = read_text('Documents/Test/BadCharEncoding-utf16')
    text8  = read_text('Documents/Test/BadCharEncoding-utf8')
    output = ['Ignore bad chars', text8,
              'Convert UTF8', encode_text(text8),
              'Convert UTF16', encode_text(text16, 'utf-16')]
    return fix_chars('\n'.join(output))