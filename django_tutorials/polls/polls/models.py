import datetime

from django.db import models
from django.utils import timezone

# Each model is a seperate table in our database.


class Question(models.Model):
    # database fields (columns in a DB) with define types.
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published', default=timezone.now())

    def __str__(self):
        return self.question_text

    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.pub_date <= now

    # admin settings for the method in the question selection screen
    # order by pub date
    was_published_recently.admin_order_field = 'pub_date'
    # small images for booleans
    was_published_recently.boolean = True
    # change name of the method in the admin screen
    was_published_recently.short_description = 'Published recently?'


class Choice(models.Model):
    # the ForeignKey represents a one-to-one relationship that tells
    # django each Choice is related to a single Question.
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text


''' NOTES

# to add a Question to the table Question:
q = Question(question_text="What's new?", pub_date=timezone.now())
q.save()

# to give the Question object a choice we must use the choice_set method
q.choice_set.create(choice_text='Nothing', votes=0)

# djangos ORM follows the relationship backwards from Question too, which
# automatically generates on each instance called choice_set.

# choice_set is a RelatedManager which can create querysets of Choice
# objects which relate to the Question instance.
'''
