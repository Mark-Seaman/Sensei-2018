from bin.shell import check_shell_lines


# def check_page(url, min=1, max=1):
#     x = check_shell_lines('curl -s %s' % url, min, max)
#     return x if x else 'OK - %s' % url


# def page_list_test():
#     return check_shell_lines('x page list', 18, 30)


# def page_text_test():
#     return check_shell_lines('x page text all', 400, 1000)


# def page_diff_test():
#     return check_shell_lines('x page diff', 1, 100)


# def page_sites_test():
#     pages = [
#         check_page('https://markseaman.info/Index.md',       195, 270),
#         check_page('https://markseaman.org/Index.md',        193, 250),

#         check_page('https://seamansguide.com/Index.md',      171, 200),
#         check_page('https://seamanslog.com/Index.md',        160, 200),

#         check_page('https://shrinking-world.com/Index.md',   165, 200),
#         check_page('https://spiritual-things.org/Index.md',  190, 400),

#         check_page('https://who2hire.us/Index.md',           338, 338),
#         check_page('https://app.who2hire.us/admin/Index.md', 300, 500),

#     ] 
#     return '\n'.join(pages)

