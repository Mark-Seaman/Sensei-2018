from bin.shell import check_shell_lines, shell


def check_page(url, min=1, max=1):
    x = check_shell_lines('curl -s %s' % url, min, max)
    return x if x else 'OK - %s' % url


def page_list_test():
    return check_shell_lines('x page list', 18, 30)


def page_text_test():
    return check_shell_lines('x page text all', 400, 1000)


def page_diff_test():
    return check_shell_lines('x page diff', 1, 100)


def page_sites_test():
    pages = [
        check_page('https://markseaman.info',       196, 196),
        check_page('https://markseaman.org',        193, 193),

        check_page('https://seamansguide.com',      171, 171),
        check_page('https://seamanslog.com',        160, 160),

        check_page('https://shrinking-world.com',   165, 165),
        check_page('https://spiritual-things.org',  401, 401),

        check_page('https://who2hire.us',           338, 338),
        check_page('https://app.who2hire.us/admin', 324, 324),

    ] 
    return '\n'.join(pages)

