from django.contrib import admin

from catalog.models import Author, Book, BookInstance


# this allows one to edit Book on the same admin page
# if it is added to the inline field
class BookInline(admin.TabularInline):
    model = Book
    # no spare book fields
    extra = 0


# the decorator is the equivalent to:
#     admin.site.register(Book, BookAdmin)
@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    # display the following fields in the admin Author list page
    list_display = ('last_name', 'first_name',
                    'date_of_birth', 'date_of_death')
    # place the date of birth and death on the same line
    # within an authors admin page.
    fields = ['first_name', 'last_name', ('date_of_birth', 'date_of_death')]
    # allows you to edit Book data of a give Author
    # on the same Book admin page.
    inlines = [BookInline]


class BookInstanceInline(admin.TabularInline):
    model = BookInstance
    extra = 0


@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    # Genre can't be added directly as it is a ManyToMany field
    # so we have to use a new method instead.
    list_display = ('title', 'author', 'display_genre')
    inlines = [BookInstanceInline]


@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    # allows you to filter using a right hand sided panel
    list_filter = ('status', 'due_back')
    list_display = ('book', 'status', 'due_back', 'borrower')
    fieldsets = (
        # adds the detailed info below
        (None, {
            'fields': ('book', 'imprint', 'id')
        }),
        # adds a section called availability with
        # status and due_back within them
        ('Availability', {
            'fields': ('status', 'due_back', 'borrower')
        }),
    )
