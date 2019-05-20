from bin.shell import check_shell_lines


def check_page(url, min=1, max=1):
     x = check_shell_lines('curl -s %s' % url, min, max)
     return x if x else 'OK - %s' % url


def page_sites_test():
    pages = [
        check_page('https://markseaman.info/Index.md',              195, 270),
        check_page('https://markseaman.org/MarkSeaman/Index',       173, 180),

        check_page('https://seamansguide.com/guide/Index',          112, 112),
        check_page('https://seamanslog.com/seamanslog/',            127, 127),
        check_page('https://seamanslog.com/seamanslog/HabitualChange', 129, 129),

        check_page('https://shrinking-world.com/shrinkingworld/Index', 129, 129),
        check_page('https://shrinking-world.com/Leverage',          137, 137),

        check_page('https://spiritual-things.org/spiritual/Index',  147, 147),
        check_page('https://spiritual-things.org/spiritual/reflect/66', 128, 128),
    ]
    return '\n'.join(pages)

