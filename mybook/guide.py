
from .mybook import  page_settings, page_text, topic_menu
from .views import DocDisplay


def seamans_guide_menu(title):

    def menu_items(title):
        return [('https://shrinking-world.com', 'Shrinking World'),
                ('https://shrinking-world.com/unc/', 'UNC Courses'),
                ('https://markseaman.org', 'Mark Seaman')]

    return topic_menu(menu_items(title), '/seamansguide/', "Seaman's Guide")


class SeamansGuide(DocDisplay):

    def get_context_data(self, **kwargs):

        def logo():
            return "/static/images/MarkSeaman.100.png", 'Mark Seaman'

        domain = self.request.get_host()
        title = self.request.path[1:]
        site_title = "Seaman's Guides", 'Software Development Courses'
        text = page_text(domain, title)
        menu = seamans_guide_menu(title)
        return page_settings(title, site_title, logo(), menu, text['text'], text['url'])
