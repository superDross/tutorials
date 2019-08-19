from rest_framework import permissions


class IsOwnerOrReadOnly(permissions.BasePermission):
    """
    Custom permission to only allow owners of an object to edit it,
    unless they are superuser.
    """

    def has_object_permission(self, request, view, obj):
        # Read permissions are allowed to any request,
        # so we'll always allow GET, HEAD or OPTIONS requests.

        if request.method in permissions.SAFE_METHODS and request.user.is_superuser:
            return True

        # Write permissions are only allowed to the owner of the snippet.
        return obj.owner == request.user


class SuperUsersOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_superuser
