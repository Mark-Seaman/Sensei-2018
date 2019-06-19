
from .mybook import  page_settings, page_text, topic_menu
from .views import DocDisplay


def guide_menu(page, title):

    def menu_items(page):
        return [('https://shrinking-world.com', 'Shrinking World'),
                ('https://shrinking-world.com/unc/', 'UNC Courses'),
                ('https://shrinking-world.com/shrinkingworld/Leverage', 'Leverage'),
                ('https://markseaman.org', 'Mark Seaman')]

    return topic_menu(menu_items(title), '/guide/', title)


def guide_settings(title):
    if title.startswith('guide/Software'):
        return guide_menu(title, "Software Engineering")
    elif title.startswith('guide/PhpApps'):
        return guide_menu(title, "PHP Apps")
    elif title.startswith('guide/PythonApps'):
        return guide_menu(title, "Python Apps")
    elif title.startswith('guide/HtmlApps'):
        return guide_menu(title, "HTML Apps")
    else:
        return guide_menu(title, "Seaman's Guides")


class SeamansGuide(DocDisplay):

    def get_context_data(self, **kwargs):
        domain = self.request.get_host()
        title = self.request.path[1:]
        site_title = "Seaman's Guides", 'Software Development Courses'
        logo = "/static/images/MarkSeaman.100.png", 'Mark Seaman'
        text = page_text(domain, title)
        menu = guide_settings(title)
        return page_settings(title, site_title, logo, menu, text['text'], text['url'])
