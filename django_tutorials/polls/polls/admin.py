from django.contrib import admin

from .models import Question, Choice


# Show choices in line with its Question
class ChoiceInline(admin.TabularInline):
    model = Choice
    # add extra 3 for adding choices in the admin site
    extra = 3


class QuestionAdmin(admin.ModelAdmin):
    # change ordering of field in the
    # fields = ['pub_date', 'question_text']
    # fieldsets allow you to order and give each field a
    # header (first tuple element)
    fieldsets = [
        (None,               {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date']}),
    ]
    inlines = [ChoiceInline]
    # display the question test and pub_date on the question selection screen.
    list_display = ('question_text', 'pub_date', 'was_published_recently')
    # alow admin to filter by date published
    list_filter = ['pub_date']
    # adds a box to search question text
    search_fields = ['question_text']


# give the Question an admin interaface and determine
# ordering and such with QuestionAdmin
admin.site.register(Question, QuestionAdmin)
admin.site.register(Choice)
