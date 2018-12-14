from os.path import join
from random import choice

from views import AspireDocDisplay
from bin.shell import file_tree_list
from mybook.mybook import mybook_site_title, main_menu
from tool.document import doc_html_text
from tool.log import log_page


advisor_doc_groups = dict(
    spiritual=('Spiritual Things', 'https://spiritual-things.org'),
    seamanslog=("Seaman's Log", 'https://seamanslog.com'),
    guide=("Seaman's Guides", 'https://seamansguide.com'),
    booknotes=('Book Notes', 'https://shrinking-world.com/booknotes')
)


def advisor_doc_pick(directory):
    exceptions = ['.gitignore', 'Menu', 'SiteTitle', 'Report']
    files = file_tree_list('Documents/'+directory)
    files = [f[10:] for f in files]
    for x in exceptions:
        files = [f for f in files if x not in f]
    return choice(files)


def advisor_doc_review():
    group = choice(advisor_doc_groups.keys())  #'seamanslog'
    doc = advisor_doc_pick(group)
    title = advisor_doc_groups[group]
    return {
        'advice_title': 'Document Review: %s' % title[0],
        'doc': join('Documents', doc),
        'url': join(title[1], doc),
        'doc_content': doc_html_text(doc),
    }


class Advisor(AspireDocDisplay):
    template_name = 'advisor.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = self.request.path[1:]+'/Index'
        site = 'aspire'
        data = advisor_doc_review()
        data.update({
            'site': mybook_site_title(site),
            'title': title,
            'menu': main_menu(site, title),
            'text': doc_html_text(title),
        })
        return data


