
from .mybook import  page_settings, page_text, topic_menu
from .views import DocDisplay


class SeamansGuide(DocDisplay):

    def get_settings(self):
        title = self.kwargs.get('title', 'Index')
        domain = self.request.get_host()
        return seamans_guide_settings(domain, title)


def seamans_guide_settings(domain, title):

    def menu(title):
        def menu_items(title):
            return [('https://shrinking-world.com', 'Shrinking World'),
                    ('https://shrinking-world.com/unc/', 'UNC Courses'),
                    ('https://markseaman.org', 'Mark Seaman')]

        return topic_menu(menu_items(title), '/seamansguide/', "Seaman's Guide")

    site_title = ("Seaman's Guides", 'Software Development Courses')
    logo = ("/static/images/SWS_Logo_200.jpg", 'Shrinking World Solutions')
    theme = 'seaman_theme.html'
    text = page_text(domain, 'guide/' + title)

    return page_settings(title, site_title, logo, theme, menu(title), text['text'], text['url'])