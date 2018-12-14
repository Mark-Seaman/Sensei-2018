from django.shortcuts import redirect, render

from church import church_settings
from mybook.mybook import main_menu
from tool.document import doc_html_text
from tool.log import log_page


def church_home(request, title=None):
    log_page(request, __name__)
    if not title:
        return redirect('/church/Index')
    data = {
        'settings': church_settings('home'),
        'title': title,
        'card_text': doc_html_text('church/%s' % title),
        'menu': main_menu('church', 'church/Index'),
    }
    return render(request, 'church.html', data)


def church_people(request):
    log_page(request, __name__)
    data = {
        'settings': church_settings('home'),
        'title': 'Church Event Meetings',
        'card_text': doc_html_text('church/Meetings')
    }
    return render(request, 'church.html', data)

