from bin.shell import banner, differences
from bin.switches import TEST_PAGES
from log import log
from models import Page


# ------------------------------
# Command Interpreter

def page_command(self, options):
    log('page command %s' % options)

    if not options:
        page_help(self)
    else:
        cmd = options[0]
        args = options[1:]
        if cmd == 'add':
            page_add(self, args)
        elif cmd == 'delete':
            page_delete(self, args)
        elif cmd == 'diff':
            page_diff(self, args)
        elif cmd == 'expect':
            page_expect(self, args)
        elif cmd == 'html':
            page_html(self, args)
        elif cmd == 'like':
            page_like(self, args)
        elif cmd == 'list':
            page_list(self)
        elif cmd == 'reset':
            page_reset(self)
        elif cmd == 'text':
            page_text(self, args)
        else:
            page_help(self)


def page_help(self):
    self.stdout.write('''

        script to manage pages on servers

        usage: x page command

        command

        Pages:
            list                - list the configured page
            add           page  - add a new page to the lineup
            delete        page  - remove this page

        Page Content:
            get                 - get all pages from the web or localhost servers
            text          page  - server page last text received
            html          page  - server page last html received

        Differences:
            expect        page  - server page text expected
            diff          page  - unexpected text received
            like          page  - accept the text and html as correct

        ''')


# ------------------------------
# Functions

def page_add(self, args):
    if not args:
        self.stdout.write('no page requested')
    else:
        url = args[0]
        try:
            Page.objects.create(url=url, expected_text='New page')
            self.stdout.write('added page %s' % url)
        except:
            self.stdout.write('page is already present %s' % url)
        print('%s Pages found' % len(Page.objects.all()))


def page_delete(self, args):
    if args:
        if args[0] == 'all':
            self.stdout.write('delete all pages')
            Page.objects.all().delete()
        else:
            self.stdout.write('delete pages %s' % args[0])
            Page.objects.get(pk=args[0]).delete()
    else:
        self.stdout.write('no page given')


def page_diff(self, args):
    def show_diff(page):
        #try:
            if not page.expected_text: 
                page.expected_text = page.text
                page.save()
            if page.text != page.expected_text:
                self.stdout.write(banner(page.url))
                self.stdout.write(differences(page.text, page.expected_text))
                return
            if page.expected_html:
                page.expected_html = page.html
                page.save()
            if page.html != page.expected_html:
                self.stdout.write(banner(page.url+'-html'))
                self.stdout.write(differences(page.html, page.expected_html))
                return
            #else:
                #self.stdout.write('%s: Expected results' % page.url)
        # except:
        #     self.stdout.write('%s: Error in Expected results' % page.url)

    if args:
        page = page_lookup(args[0])
        show_diff(page)
    else:
        for page in Page.objects.all():
            show_diff(page)


def page_expect(self, args):
    page = page_lookup(args[0])
    self.stdout.write(banner(page.url))
    self.stdout.write('Expected results: \n\n%s' % page.expected_text)
    self.stdout.write(banner(page.url+'-html'))
    self.stdout.write('Expected results: \n\n%s' % page.expected_html)


def page_html(self, args):
    def show_output(page):
        self.stdout.write(banner(page))
        p = page_lookup(page)
        if p:
            self.stdout.write(p.html)
        else:
            self.stdout.write('Page not found, %s' % page)

    if args:
        if args[0] == 'all':
            for p in Page.objects.all():
                show_output(p.url)
        else:
            show_output(args[0])


def page_like(self, args):
    def like_page(page):
        if page.expected_text != page.text:
            page.expected_text = page.text
            page.save()
            self.stdout.write('like %s' % page.url)
        if page.expected_html != page.html:
            page.expected_html = page.html
            page.save()
            self.stdout.write('like %s-html' % page.url)

    if args:
        like_page(page_lookup(args[0]))
    else:
        for p in Page.objects.all():
            like_page(p)


def page_list(self):
    self.stdout.write('page list')
    for p in Page.objects.all():
        print('%s.  %s' % (p.pk, p.url))


def page_lookup(url):
    if Page.objects.filter(url=url):
        return Page.objects.get(url=url)


def page_reset(self):
    pages = open(TEST_PAGES).read().split('\n')
    for p in pages:
        p = p.strip()
        if p:
            page_add(self, [p])


def page_results():
    differences = []
    for page in Page.objects.all():
        if not page.expected_text: 
            page.expected_text = page.text
            page.save()
        if page.text != page.expected_text:
            differences.append('page diff %s' % page.url)
            differences.append('page text %s' % page.url)
        if not page.expected_html:
            page.expected_html = page.html
            page.save()
        if page.html != page.expected_html:
            differences.append('page diff %s' % page.url)
            differences.append('page html %s' % page.url)
    return '\n'.join(differences)


def page_text(self, args):

    def show_output(page):            
        self.stdout.write(banner(page))
        p = page_lookup(page)
        if p:
            self.stdout.write(p.text)
        else:
            self.stdout.write('Page not found, %s' % page)

    if args:
        if args[0] == 'all':
            for p in Page.objects.all():
                show_output(p.url)
        else:
            show_output(args[0])
