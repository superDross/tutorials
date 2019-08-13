import datetime

from django.db import models
from django.utils import timezone


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")

    def __str__(self):
        return self.question_text

    def was_published_recently(self):
        now = datetime.datetime.now()
        return now.date() - datetime.timedelta(days=1) <= self.pub_date <= now.date()

    def word_count(self):
        return len(self.question_text.split())

    def choices(self):
        """ Allows all choices to be displayed in the api """
        return self.choice_set.all()


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text
