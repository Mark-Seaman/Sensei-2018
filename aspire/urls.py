from django.conf.urls import url

from views import AspireAnonymous, AspireDoc, AspireDir, AspireDocEdit, AspireFolder, AspireDelete, AspireDocDelete, AspireError, AspireClient
from advisor_views import Advisor
# from node_views import NodeAdd, NodeDelete, NodeDetail, NodeEdit, NodeList
from client_views import ClientAdd, ClientDelete, ClientDetail, ClientEdit, ClientList
from project_views import ProjectAdd, ProjectDelete, ProjectDetail, ProjectEdit, ProjectList
from role_views import RoleAdd, RoleDelete, RoleDetail, RoleEdit, RoleList, RoleView

from goal_views import GoalAdd, GoalDelete, GoalDetail, GoalEdit, GoalList


urlpatterns = (

    # Client
    url(r'^client_add$',                ClientAdd.as_view(),    name='client_add'),
    url(r'^client_delete/(?P<pk>\d+)$', ClientDelete.as_view(), name='client-delete'),
    url(r'^client_detail/(?P<pk>\d+)$', ClientDetail.as_view(), name='client-detail'),
    url(r'^client_edit/(?P<pk>\d+)$',   ClientEdit.as_view(),   name='client-edit'),
    url(r'^client_list$',               ClientList.as_view(),   name='client_list'),

    # URLs

    # Goal
    url(r'^goal_add$',                   GoalAdd.as_view(),    name='goal_add'),
    url(r'^goal_delete/(?P<pk>\d+)$',    GoalDelete.as_view(), name='goal-delete'),
    url(r'^goal_detail/(?P<pk>\d+)$',    GoalDetail.as_view(), name='goal-detail'),
    url(r'^goal_edit/(?P<pk>\d+)$',      GoalEdit.as_view(),   name='goal-edit'),
    url(r'^goal_list$',                  GoalList.as_view(),   name='goal_list'),

    # # Node
    # url(r'^node_add$',                  NodeAdd.as_view(),      name='node_add'),
    # url(r'^node_delete/(?P<pk>\d+)$',   NodeDelete.as_view(),   name='node-delete'),
    # url(r'^node_detail/(?P<pk>\d+)$',   NodeDetail.as_view(),   name='node-detail'),
    # url(r'^node_edit/(?P<pk>\d+)$',     NodeEdit.as_view(),     name='node-edit'),
    # url(r'^node_list$',                 NodeList.as_view(),     name='node_list'),
    #
    # Project
    url(r'^project_add$',                ProjectAdd.as_view(),      name='project_add'),
    url(r'^project_delete/(?P<pk>\d+)$', ProjectDelete.as_view(),   name='project-delete'),
    url(r'^project_detail/(?P<pk>\d+)$', ProjectDetail.as_view(),   name='project-detail'),
    url(r'^project_edit/(?P<pk>\d+)$',   ProjectEdit.as_view(),     name='project-edit'),
    url(r'^project_list$',               ProjectList.as_view(),     name='project_list'),

    # Role
    url(r'^role/(?P<title>[\w/\-_.]*)$', RoleView.as_view()),
    url(r'^role_add$',                   RoleAdd.as_view(),    name='role_add'),
    url(r'^role_delete/(?P<pk>\d+)$',    RoleDelete.as_view(), name='role-delete'),
    url(r'^role_detail/(?P<pk>\d+)$',    RoleDetail.as_view(), name='role-detail'),
    url(r'^role_edit/(?P<pk>\d+)$',      RoleEdit.as_view(),   name='role-edit'),
    url(r'^role_list$',                  RoleList.as_view(),   name='role_list'),

    # Doc
    url(r'^$', AspireClient.as_view()),
    url(r'^anon',                       AspireAnonymous.as_view()),
    url(r'^advisor', Advisor.as_view()),
    url(r'^doc_edit/(?P<title>[\w/\-_.]*)$', AspireDocEdit.as_view()),
    url(r'^doc_delete/(?P<title>[\w/\-_.]*)$', AspireDocDelete.as_view()),
    url(r'^dir/(?P<title>[\w/\-_.]*)$', AspireDir.as_view()),
    url(r'^doc_folder/(?P<title>[\w/\-_.]*)$', AspireFolder.as_view()),
    url(r'^delete/(?P<title>[\w/\-_.]*)$',     AspireDelete.as_view()),
    url(r'^(?P<title>[\w/\-_.]*)$',     AspireDoc.as_view()),
    url(r'^',                           AspireError.as_view()),

)
