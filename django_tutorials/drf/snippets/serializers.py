""" Serializers convert the data (e.g. queryset) from and to JSON."""
from django.contrib.auth.models import User
from rest_framework import serializers

from snippets.models import LANGUAGE_CHOICES, STYLE_CHOICES, Snippet


class SnippetSerializer(serializers.HyperlinkedModelSerializer):
    owner = serializers.ReadOnlyField(source="owner.username")
    highlight = serializers.HyperlinkedIdentityField(
        view_name="snippet-highlight", format="html"
    )

    class Meta:
        model = Snippet
        fields = [
            "id",
            "title",
            "code",
            "linenos",
            "language",
            "style",
            "owner",
            "url",
            "highlight",
        ]


class UserSerializer(serializers.HyperlinkedModelSerializer):
    """ Show snippet detail urls instead of only ids."""

    snippets = serializers.HyperlinkedRelatedField(
        many=True, view_name="snippet-detail", read_only=True
    )

    class Meta:
        model = User
        # show user url too
        fields = ["url", "id", "username", "snippets"]
