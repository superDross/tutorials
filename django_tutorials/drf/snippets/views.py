from django.contrib.auth.models import User
from rest_framework import permissions, renderers, viewsets
from rest_framework.decorators import action, api_view
from rest_framework.response import Response
from rest_framework.reverse import reverse

from snippets.models import Snippet
from snippets.permissions import IsOwnerOrReadOnly, SuperUsersOnly
from snippets.serializers import SnippetSerializer, UserSerializer


@api_view(["GET"])
def api_root(request, format=None):
    return Response(
        {
            "users": reverse("user-list", request=request, format=format),
            "snippets": reverse("snippet-list", request=request, format=format),
        }
    )


class SnippetViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.

    Additionally we also provide an extra `highlight` action.

    It replaces the SnippetDetail, SnippetList & SnippetHighlight.
    """

    queryset = Snippet.objects.all()
    serializer_class = SnippetSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]

    @action(detail=True, renderer_classes=[renderers.StaticHTMLRenderer])
    def highlight(self, request, *args, **kwargs):
        snippet = self.get_object()
        return Response(snippet.highlighted)

    def perform_create(self, serializer):
        """ Belongs to owner upon saving."""
        serializer.save(owner=self.request.user)

#     def get_queryset(self, *args, **kwargs):
#         """ Only show users snippets."""
#         if self.request.user.is_superuser:
#             return Snippet.objects.all()
#         return Snippet.objects.filter(owner=self.request.user)


# NOTE:  multiple errors when trying to use this with get_queryset

class UserViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """

    queryset = User.objects.all()
    serializer_class = UserSerializer

#     def get_queryset(self, *args, **kwargs):
#         """ Only show users snippets."""
#         if self.request.user.is_superuser:
#             return User.objects.all()
#         return User.objects.filter(pk=self.request.user.id)
