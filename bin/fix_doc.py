def doc_fix():
    for path in list_documents():
        try:
            filepath = doc_path(path)
            text = file_to_html(filepath)
            open('/tmp/doc_test','w').write(text)
        except:
            print('Found bad document: %s' % filepath)
            text = open(filepath).read()
            text = fix_chars(text)
            text = text.decode(encoding='UTF-8').encode('ascii', 'ignore')
            if path != 'mybook/test/encoding-test':
                open(filepath,'w').write(text)
            print('fix bad document: '+path)
