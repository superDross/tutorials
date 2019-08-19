from django.urls import include, path
from rest_framework.urlpatterns import format_suffix_patterns

from snippets import views

urlpatterns = [
    path("", views.api_root),
    path("api-auth/", include("rest_framework.urls")),
    path("snippets/", views.SnippetList.as_view(), name="snippet-list"),
    path("snippets/<int:pk>/", views.SnippetDetail.as_view(), name="snippet-detail"),
    # path("snippets/", views.snippet_list),
    # path("snippets/<int:pk>/", views.snippet_detail),
    path("users/", views.UserList.as_view(), name="user-list"),
    path("users/<int:pk>/", views.UserDetail.as_view(), name="user-detail"),
    path(
        "snippets/<int:pk>/highlight/",
        views.SnippetHighlight.as_view(),
        name="snippet-highlight",
    ),
]

# allows you to use suffix on links e.g. /downloads/1.json
urlpatterns = format_suffix_patterns(urlpatterns)
