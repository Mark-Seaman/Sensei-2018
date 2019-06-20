
from .mybook import  page_settings, page_text, topic_menu
from .views import DocDisplay


def guide_menu(page, title):

    def sws_items(page):
        return [('https://shrinking-world.com', 'Shrinking World'),
                ('https://shrinking-world.com/unc/', 'UNC Courses'),
                ('https://shrinking-world.com/shrinkingworld/Leverage', 'Leverage'),
                ('https://markseaman.org', 'Mark Seaman')]

    def lifecycle_items(page):
        return [('Requirements', 'Requirements'),
                ('Design', 'Design'),
                ('Code', 'Code'),
                ('Test', 'Test')]

    return topic_menu(lifecycle_items(title), '', title)


def guide_settings(title):
    logo = "/static/images/SWS_Globe_small.jpg", 'Mark Seaman'
    if title.startswith('guide/Software'):
        site_title = "Software Engineering", 'Principles and Practices'
        menu = guide_menu(title, "Software Engineering")
        return site_title, menu,logo
    elif title.startswith('guide/PhpApps'):
        site_title = "PHP Apps", 'Software Engineering Cookbook'
        menu =  guide_menu(title, "PHP Apps")
        return site_title, menu,logo
    elif title.startswith('guide/PythonApps'):
        site_title = "Python Apps", 'Software Engineering Cookbook'
        menu =  guide_menu(title, "Python Apps")
        return site_title, menu,logo
    elif title.startswith('guide/HtmlApps'):
        site_title = "HTML Apps", 'Software Engineering Cookbook'
        menu =  guide_menu(title, "HTML Apps")
        return site_title, menu,logo
    else:
        site_title = "Seaman's Guides", 'Software Development Courses'
        menu =  guide_menu(title, "Seaman's Guides")
        return site_title,menu,logo


class SeamansGuide(DocDisplay):

    def get_context_data(self, **kwargs):
        domain = self.request.get_host()
        title = self.request.path[1:]
        site_title,menu,logo = guide_settings(title)
        text = page_text(domain, title)
        return page_settings(title, site_title, logo, menu, text['text'], text['url'])
