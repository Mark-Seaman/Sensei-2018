from .views import DocDisplay
from .mybook import topic_menu,  page_settings, page_text


class SeamansLog(DocDisplay):

    def get_context_data(self, **kwargs):

        def menu(title):

            def menu_items(title):
                return [('List', 'Articles', title == 'Index'),
                        ('Random', 'Read', title != 'List' and title != 'Index'),
                        ('https://markseaman.org', 'Mark Seaman')]

            return topic_menu(menu_items(title), '/seamanslog/', "Seaman's Log")

        def logo():
            return "/static/images/MarkSeaman.100.png", 'Mark Seaman'

        domain = self.request.get_host()
        title = self.kwargs.get('title', 'Index')
        site_title = "Seaman's Log", 'Big Ideas & Deep Thoughts'
        text = page_text(domain, 'seamanslog/' + title)

        return page_settings(title, site_title, logo(), menu(title), text['text'], text['url'])


# class SeamansLog(RedirectView):
#     permanent = False
#     url = '/seamanslog/Random'


