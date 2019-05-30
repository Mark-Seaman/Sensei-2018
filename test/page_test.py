from bin.shell import check_shell_lines


def check_page(url, min=1, max=1):
     x = check_shell_lines('curl -s %s' % url, min, max)
     return x if x else 'OK - %s' % url


def page_sites_test():
    pages = [
        check_page('https://markseaman.info/Index.md',              150, 180),
        check_page('https://markseaman.org/MarkSeaman/Index',       160, 180),

        check_page('https://seamansguide.com/guide/Index',          112, 130),
        check_page('https://seamanslog.com/seamanslog/',            124, 127),
        check_page('https://seamanslog.com/seamanslog/HabitualChange', 126, 129),

        check_page('https://shrinking-world.com/shrinkingworld/Index', 126, 129),
        check_page('https://shrinking-world.com/Leverage',          134, 137),

        check_page('https://spiritual-things.org/spiritual/Index',  142, 147),
        check_page('https://spiritual-things.org/spiritual/reflect/66', 123, 128),
    ]
    return '\n'.join(pages)

