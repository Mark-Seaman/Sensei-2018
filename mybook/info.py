from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import RedirectView, TemplateView

from mybook import main_menu, mybook_redirect, mybook_site_title
from tool.document import doc_html_text
from tool.log import log_page


def site_title():
    return ' Private notes', 'by Mark Seaman'


class InfoView(TemplateView):
    template_name = 'mybook_public.html'

    def get_context_data(self, **kwargs):
        log_page(self.request)
        title = kwargs.get('title', 'Index')
        site = site_title()
        page = title
        text = kwargs.get('text')
        if not text:
            text = doc_html_text(title)
        menu = main_menu('info/%s' % title, page)
        settings = dict(title=title, site=site, menu=menu, text=text, page=page)
        kwargs.update(settings)
        return kwargs

    # def get_redirect_url(self, *args, **kwargs):
    #     return '/info/Work'


class InfoRedirect(RedirectView):
    def get_redirect_url(self, *args, **kwargs):
        title = kwargs.get('title', '')
        r = mybook_redirect(self.request.get_host(), title, self.request.user)
        return "/info/Work"


# class InfoDocDisplay(LoginRequiredMixin, ContextMixin):
#     def get_context_data(self, **kwargs):
#         kwargs = super(TaskBase, self).get_context_data(**kwargs)
#         kwargs.update({
#             'site': mybook_site_title('info'),
#             'title': "No title set",
#             'menu': main_menu('info', 'info/Index'),
#             'text': 'Task Base',
#         })
#         return kwargs