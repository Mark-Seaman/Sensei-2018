from mybook.mybook import main_menu, mybook_redirect, mybook_site_title
from bin.shell import shell


def get_sites():
    return ['aspire', 'booknotes', 'brain', 'church', 'guide', 'info', 'money', 'mybook',
             'seamanslog', 'shrinking-world', 'software', 'spiritual', 'tech', 'unc', 'workshop']


def mybook_menu_list_test():
    lines = shell('find Documents').split('\n')
    lines = [x for x in lines if 'Menu' in x]
    lines = '\n'.join(lines)
    return lines


def mybook_menu_test():
    return '\n'.join([str(main_menu(s, s+'/Index')) for s in get_sites()])


def mybook_redirect_test():

    def verify(c):
        x = str(mybook_redirect(c[0][0], c[0][1], c[0][2]))
        if x != c[1] and 'random' not in c[1]:
            return 'Redirect %s:  Expected: %s, Got: %s' % (c[0], c[1], x)
        return 'OK'

    cases = (
        (('mybookonline.org', '', ''), '/Index'),
        (('mybookonline.org', 'xxx', ''), '/mybook/xxx'),
        (('mybookonline.org', 'mybook/xxx', ''), '/missing/mybook/xxx'),
        (('mybookonline.org', 'mybook/Index', ''), 'None'),
        (('myhost', 'xxx', ''), '/missing/xxx'),
        (('myhost', 'seamanslog', ''), '/seamanslog/random'),
        (('myhost', 'seamanslog/Index', ''), 'None'),
        (('mybookonline.org', 'brain', ''), '/mybook/brain'),
        (('exteriorbrain.org', 'brain', ''), '/brain/Index'),
        (('seamansguide.com', 'guide', ''), '/guide/Index'),
        (('spiritualthings.org', 'spiritual/reflect', ''), '/spiritual/reflect/random'),
        (('spiritualthings.org', 'spiritual', ''), '/spiritual/random'),
        (('spiritualthings.org', 'spiritual/reflect/43', ''), 'None'),
    )
    return '\n'.join([verify(c) for c in cases])


def mybook_site_title_test():
    return '\n'.join([str(mybook_site_title(s+'/Index')) for s in get_sites()])


