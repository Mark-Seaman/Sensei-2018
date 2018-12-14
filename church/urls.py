from django.conf.urls import url
from django.contrib.auth.views import login, logout

from budget_views import BudgetDetail, BudgetReport, ChurchBudgetAdd, ChurchBudgetDelete, ChurchBudgetEdit, ChurchBudgetList, ChurchView
from leader_views import LeaderAdd, LeaderDelete, LeaderDetail, LeaderEdit, LeaderList
from money_views import MoneyAdd, MoneyEdit, MoneyList, MoneyView

# from event_views import ChurchEventAdd, ChurchEventDelete, ChurchEventDetail, ChurchEventEdit, ChurchEventList
# from score_views import ChurchScoreAdd, ChurchScoreDelete, ChurchScoreDetail, ChurchScoreEdit, ChurchScoreList
from views import church_home, church_people

urlpatterns = [

    # Authentication

    url(r'^login', login, {'template_name': 'church_login.html'}),
    url(r'^logout$', logout, {'next_page': '/church/'}),

    url(r'^money$',                         MoneyView.as_view()),
    url(r'^money/(?P<date>\d{4}-\d{2})$',   MoneyView.as_view()),
    url(r'^money_add',                      MoneyAdd.as_view()),
    url(r'^money_edit/(?P<pk>\d+)$',        MoneyEdit.as_view()),
    url(r'^money_list$',                    MoneyList.as_view()),

    # ChurchBudget
    #url(r'^budget$',                        BudgetReport.as_view()),
    #url(r'^budget/(?P<date>\d{4}-\d{2})$',  BudgetReport.as_view()),

    # url(r'^church_budget_add$',                         ChurchBudgetAdd.as_view(),    name='church_budget_add'),
    # url(r'^church_budget_delete/(?P<pk>\d+)$',          ChurchBudgetDelete.as_view(), name='church-budget-delete'),
    # url(r'^church_budget_detail/(?P<date>\d{4}-\d{2})$', BudgetDetail.as_view(),      name='budget-detail'),
    # url(r'^church_budget_edit/(?P<date>\d{4}-\d{2})$',  ChurchBudgetEdit.as_view(),   name='church-budget-edit'),
    # url(r'^church_budget_list$',                        ChurchBudgetList.as_view(),   name='church_budget_list'),
    url(r'^', ChurchView.as_view()),

    # Leader

    url(r'^leader_add$',                   LeaderAdd.as_view(), name='leader_add'),
    url(r'^leader_delete/(?P<pk>\d+)$',    LeaderDelete.as_view(), name='leader-delete'),
    url(r'^leader_detail/(?P<pk>\d+)$',    LeaderDetail.as_view(), name='leader-detail'),
    url(r'^leader_edit/(?P<pk>\d+)$',      LeaderEdit.as_view(),   name='leader-edit'),
    url(r'^leader_list$',                  LeaderList.as_view(),   name='leader_list'),


    # ChurchEvent

    # url(r'^church_event_add/(?P<date>\d{4}-\d{2}-\d{2})$', ChurchEventAdd.as_view(), name='church_event_add'),
    # url(r'^church_event_delete/(?P<pk>\d+)$',   ChurchEventDelete.as_view(),    name='church-event-delete'),
    # url(r'^church_event_detail/(?P<pk>\d+)$',   ChurchEventDetail.as_view(),    name='church-event-detail'),
    # url(r'^church_event_edit/(?P<pk>\d+)$',     ChurchEventEdit.as_view(),      name='church-event-edit'),
    # url(r'^church_event_list$',                 ChurchEventList.as_view(),      name='church_event_list'),
    # url(r'^church_event_list/(?P<date>\d{4}-\d{2}-\d{2})$',  ChurchEventList.as_view(),      name='church_event_list'),


    # # Church
    #
    # url(r'^$', church_home),
    # # url(r'^score$', church_score),
    # url(r'^people$', church_people),
    # url(r'^(?P<title>[\w/\-_.]*)$', church_home),

]
