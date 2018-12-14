from glob import glob
from os import system, listdir, environ, chdir, rename
from os.path import join, isfile, exists
from platform import node
from re import sub,compile,DOTALL,IGNORECASE
from sys import argv

from shell import shell


def book_command(argv):
    '''Execute all of the book specific commands '''
    print('book command %s '%argv)
    if argv:
        chdir(environ['book'])
        cmd = argv[0]
        if cmd == 'build':
            print(book_build())

        elif cmd == 'changes':
            print(book_changes())

        elif cmd == 'commit':
            book_commit(argv)

        elif cmd == 'edit':
            book_edit(argv)

        elif cmd == 'find':
            book_find(argv[1:])

        elif cmd == 'index':
            book_index()

        elif cmd == 'headlines':
            book_headlines()

        elif cmd == 'headings':
            book_headings(argv[1:2])

        elif cmd == 'kdp':
            web('kdp.amazon.com')

        elif cmd == 'list':
            print(book_list())

        elif len(argv)>2 and cmd == 'outline':
            book_outline(argv[1])

        elif cmd == 'plan':
            book_plan()

        elif cmd == 'read':
            book_read()

        elif cmd == 'status':
            print(book_status())

        elif cmd == 'text':
            if len(argv)>2:
                book_text(chapter=argv[1])
            else:
                book_text()

        elif cmd == 'words':
            book_words()
        
        else:
            print('No book command found, '+cmd )
            book_help()
    else:   
        book_help()



def book_build():
    '''Put together a markdown file from the individual parts '''

    def image_list():
        images = '''Archimedes.jpg
            Dev_Tasks.png
            Dev_Tasks.png
            Leverage_Improvement.png
            Pulley.jpg
            Releases.png
            Spheres.png
            TechBalance.png
            TechMature.png
            TechStartup.png
            Wedge.jpg
            Wheel.jpg'''
        return ' '.join([ 'images/'+x.strip() for x in images.split('\n')])
        
    def book_html():
        print("Building HTML book")
        html = 'Leverage_Principle.html'
        css = 'Book.css'
        system('cd $book; pandoc -s  -c Book.css Book.md -o '+html) # --toc 
        zip = "zip Leverage %s %s %s" % (html,css,image_list())
        system(zip) 
        rename('Book.md', 'books/Book.md')
        rename(html, 'books/'+html)
        rename('Leverage.zip', 'books/Leverage_Principle.zip')
        print('cd $book/books; zip Leverage_Principle Leverage_Principle.html')

    def book_epub():
        print("Building epub book")
        system('cd $book; pandoc Book.md -o Book.epub')
        rename('Book.epub', 'books/Book.epub')

    def book_pdf():
        print("Building PDF book")
        geometry = '-V geometry:paperwidth=6.14in -V geometry:paperheight=9.21in'
        # margin = '-V geometry:margin=0in'
        system('cd $book; pandoc Book.md %s -o Leverage_Principle.pdf' % geometry)
        rename('Leverage_Principle.pdf', 'books/Leverage_Principle.pdf')
        book_copy()

    def book_mobi():
        print("Building MOBI book")
        system('cd $book; pandoc Book.md -o Book.mobi')

    def book_assemble():
        results = 'Build: Book.md\n'
        chapters = ['chapters/'+i for i in book_read_index()]
        with open('Book.md','w') as output_file:
            for p in chapters:
                path = p+'.md'
                results += 'Build '+path+'  ...\n'
                text = open(path).read()    
                output_file.write(text+'\n\n')
        return results

    def book_copy():
        pdf = 'books/Leverage_Principle.pdf'
        dropbox = '/Users/seaman/Dropbox/Shrinking_World/Book'
        print('cp  %s %s' % (pdf,dropbox))
        system('cp  %s %s' % (pdf,dropbox))

    book_assemble()
    #book_epub()
    #book_mobi()
    book_pdf()
    book_html()


def book_changes():
    return 'Changes to Book content' + shell('git diff')


def book_commit(argv):
    '''Form the shell script for the commit command. '''
    if argv[2:]:
        comment =' '.join(argv[2:])
    else:
        comment = 'Automatic book commit'
    command = '''echo Commit all changes from the book project
        cd $book &&
        git add -A . &&
        git commit -m"%s" &&
        git pull &&
        git push 
    ''' % comment
    system(command)    
    

def book_edit(argv):
    '''Edit the book content'''
    if len(argv)>2 and argv[2]== 'index':
        yml = join(environ['book'],'../mkdocs.yml')
        system('book index > '+yml)
        system('e '+yml)
    elif len(argv)>2:
        system('e '+join(environ['book'], 'chapters', argv[2]+'.md'))
    else:
        system('e '+environ['book'])


def book_find(words):
    if not words:
        print ('No string to search for')
        return
    chdir(join(environ['book'],'chapters'))
    system('grep -n %s %s' % (words[0],'*.md'))


def book_headings(topic=None):
    '''Extract all of the functions from the source and count their length'''

    def find_headings(text, pattern='##'):
        lines = text.split('\n')
        start = 0
        title = ''
        for i,line in enumerate(lines):
            if line.strip().startswith(pattern) or line== '****':
                pat = compile(r"\=* (.*)")
                name = pat.sub(r'\1',line)
                if '###' != name:
                    if title:
                        yield ((i-start,title))
                    start = i
                    if '****' in line:
                        title = '--'
                    else:
                        title = line.replace('#','    ')[9:]
        yield((i-start,title))

    def print_headings(topic):
        path = join(environ['book'],'chapters',topic+'.md')
        print('\n'+topic)
        words = shell ('wc -w ' + path).strip().split(' ')[0]
        print ('    %s.md:  %s words' %(topic,words))
        text = open(path).read()
        print('\n    major: ')
        for heading in find_headings(text, '### '):
            print('    %3d : %-15s ' % heading)
        print('\n    minor:')
        for heading in find_headings(text, '#### '):
            print('    %3d : %-15s ' % heading)

    if topic:
        print_headings(topic[0])
    else:
        for topic in book_read_index():
            print_headings(topic)


def book_headlines():
    for i in book_read_index():
        path = join(environ['book'],'chapters',i+'.md')
        headline = open(path).read().split('\n')[0]
        print('%-15s ' % i + headline.replace('#','..'))


def book_index():
    def print_index_entry(category, path, title):
        print('- [%s.md, "%s", "%s"]' % (category+'/'+path, category, title))

    print('site_name: Software Leverage\n\npages:\n')
    for i in book_read_index():
        print_index_entry('chapters', i, i) 


def book_help():
    '''Show all the book commands and their usage. '''
    print('''
*    usage: book command [args]
* 
*   commands:
*
*     build                 -- Build the content of the book
*     changes               -- List doc changes 
*     commit [message args] -- Commit all changes to the book
*     edit                  -- Edit the book content
*     find pattern          -- Find the string in the book
*     files                 -- List all of the files
*     headlines             -- List all chapter headlines
*     headings              -- List length of all headings
*     help                  -- Show the available commands
*     list                  -- List the parts of the book
*     outline               -- Show the outline for the book
*     plan                  -- Open the planning spread sheet
*     push                  -- Push the book to the dropbox
*     words                 -- Count the words
            ''')


def nested_list(name, children):
    '''Build a string that is a formatted list'''
    return '\n'+name+':    \n    '+'\n    '.join(sorted(children))


def book_list():
    '''List the parts of the book source code. '''
    results = "List the contents of this book\n"
    for d in ['.', 'chapters']:
        book_dir = join(environ['book'],d)
        files = [f for f in listdir(book_dir) if isfile(join(book_dir,f))]
        results += '\n\n'+d+':    \n    '+'\n    '.join(sorted(files))
    return results


def book_outline(topic):
    '''Build a new outline from the book text'''
    from outline import extract_headings, convert_to_outline
    f = join(environ['book'], 'chapters', '%s.md'%topic)
    headings = extract_headings(open(f).read())
    print(convert_to_outline(headings))
   

def book_plan():
    print ('book plan')
    spreadsheet = '''#!/bin/bash
        # Open the invoices spreadsheet

        f="$HOME/Documents/Dropbox/Personal/Book_Planner.ods"
        open "$f" ||
        o "$f"
    '''
    system(spreadsheet)


def book_read():
    '''Read the PDF for the book'''
    system('rbg firefox $book/Book.html')


def book_read_index(part=None):
    '''Read an index from the book directory'''
    topics = [
        'Title;Book-TOC;Preface',
        'Part1;Leverage;Debt;Practices',
        'Part2;Technology;Design;Code;Test',
        'Part3;Release;Services;Deployment;Monitoring',
        'Part4;Knowledge;Teamwork;Learning;Planning',
        'AppendixA;AppendixB;AppendixC'
    ]
    if part:
        topics = topics[part]
    else:
        topics = ';'.join(topics)
    
    topics = [t for t in topics.split(';') if t]
    return topics


def book_status():
    '''Form the shell script for the commit command. '''
    return 'List all pending changes to the book\n' +shell('git status')


def book_text(chapter=None):
    '''Display the raw text of one chapter'''
    if chapter:
        f = join(environ['book'], 'chapters', '%s.md'%chapter)
    else:
        f = join(environ['book'], 'Book.md')
    print(open(f).read())


def chapter_words(chapter):
    if exists(chapter):
        text = shell('wc -w '+chapter) 
        count = [t for t in text.split(' ') if t ]
        return int(count[0])


def book_calculate_words(label,files):
    '''Measure the words for a file set'''
    print(label)
    total = 0
    for topic in files:
        if exists(topic):
            count = chapter_words(topic) / 250
            total  += count
            topic = topic.replace('chapters/','').replace('.md','')
            print('    %4d pages  %-30s' % (count,topic))
    if topic != 'Book':
        print('\n    %4d pages total' % total)


def book_word_count(part):
    chapters = ['chapters/'+i+'.md' for i in book_read_index(part+1)]
    book_calculate_words('Part %d' % (part+1), chapters)


def book_words():
    '''Count all of the words in the book '''
    chdir(environ['book'])
    book_calculate_words('manuscript',['books/Book.md'] )
    print('\n')
    for part in range(5):
        book_word_count(part)



def web(page):
    '''Open a web page in Google Chrome'''
    url = page
    if not page.startswith('http://') and not page.startswith('https://'):
        url = 'http://' + page
    # Use the correct invocation
    if 'mac' in node() or 'mini' in node():
        system('open -a "Google Chrome" '+url)
    else:
        system('rbg google-chrome '+url)



'''
Create a script that can be run from the shell
'''
if __name__== '__main__':
    book_command(argv)

