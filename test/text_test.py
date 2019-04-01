from bin.shell import differences, shell, check_shell_lines, read_file
from bin.text import find_functions, find_links, find_urls, text_outline_string, text_markdown, text_outline, \
     match_lines, match_pattern, transform_matches
from bin.text import find_agents, find_anchors, find_quotes, find_signatures


def text_help_test():
    return shell('x text')


def text_match_test():
    return check_shell_lines('x text match def mybook/mybook_views.py', 12, 15)


def text_no_match_test():
    return check_shell_lines('x text no-match def mybook/mybook_views.py', 100, 150)


sample_text = '''
# Work Activities

These activities are critical to successful work.
Balance the four activities for the best outcomes.

This is a second paragraph
of text.

## Learn
create deeper understanding of problem
evaluate solution

## Plan
past history
present tasks
future priorities

## Build
### fix
#### list of known problems
#### issue tracking
### test
#### test inventory
#### tests needed
### extend
### improve

## Teach
share what you know
invite review

    '''

sample_html = '''<p>Hello World</p>
<a href="http://example.com">More Examples</a>
<a href="http://example2.com">Even More Examples</a>
'''

sample_quotes = '''
<div><h1>Heading</h1></div>
<div><p>Paragraph</p></div>
'''

sample_agents = '''
Mark Seaman       Shrinking World   mark@shrinking-world.com
Stacie Seaman     Shrinking World   stacie@shrinking-world.com
'''


def text_agents_test():
    return str(find_agents(sample_agents))


def text_outline_test():
    return str(text_outline(sample_text))


def text_markdown_test():
    return text_markdown(text_outline(sample_text))


def text_format_test():
    return text_outline_string(text_outline(sample_text))


def text_round_trip_test():
    t1 = sample_text
    t2 = text_markdown(text_outline(t1))
    t3 = differences(t2,t1)
    #print 'DIFF COUNT', len(t3)
    #print t2
    return t3


def text_grep_test():
    pattern = '### '
    return match_lines(sample_text, pattern)


def text_findall_test():
    pattern = '^### (.*)'
    return match_pattern(sample_text, pattern)


def text_functions_test():
    text = read_file('bin/text.py')
    return '\n'.join(find_functions(text))


def text_select_lines_test():
    match_pattern = '^### (.*)'
    select_pattern = r'<h3>\1</h3>'
    return transform_matches(sample_text, match_pattern, select_pattern)


def text_url_test():
    urls = find_urls(sample_html)
    return '\n'.join(urls)


def text_links_test():
    return str(find_links(sample_html))


# def text_transforms_test():
#
#     SELECTORS = {
#         'functions': {
#             'match_pattern': r'def (.*)\(.*\)',
#             'select_pattern': r'\1',
#             'text': read_file('bin/text.py'),
#         },
#         'signature': {
#             'match_pattern': r'def (.*)(\(.*\))',
#             'select_pattern': r'\1 \2',
#             'text': read_file('bin/text.py'),
#         },
#         'agents': {
#             'match_pattern': r'(.{40})(.{33}) +[\w\d_\-\.]+\@([\w\d_\-\.]+)',
#             'select_pattern': r'\2\4',
#             'text': read_file('bin/text.py'),
#         },
#     }
#
#     def transform(test_case):
#         return transform_matches(test_case['text'], test_case['match_pattern'], test_case['select_pattern'])
#
#     results = [transform(SELECTORS[t]) for t in 'functions', 'signature']
#     return '\n'.join(results)
#

def text_signatures_test():
    text = read_file('bin/text.py')
    return '\n'.join(find_signatures(text))


def text_anchors_test():
    matches = find_anchors(sample_html)
    return str(matches)


def text_div_test():
    text = read_file("Documents/MarkSeaman/booknotes/ActivateYourBrain-quotes.html")
    matches = find_quotes(text)
    return '<p>' + '</p>\n\n<p>'.join(matches) + '</p>'


