from django.urls import path

from . import views

# app_name is a namespace that is accessible from the template
app_name = 'polls'
urlpatterns = [
    # .as_view() required for all class based views
    path('', views.IndexView.as_view(), name='index'),
    # the name value can be used in the template e.g. 'polls:detail'
    path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    # question_id changed to pk and view changed for paths connected to generic views.
    path('<int:pk>/results/', views.ResultsView.as_view(),
         name='results'),
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
