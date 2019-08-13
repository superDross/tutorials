# Django Polls CheatSheet
## Virtual Environment
Create a virtual environment, install the required packages and initiate the virtual enviornment. 
```bash
mkdir project
cd project

pipenv install django psycopg2
pipenv shell
```
## Initiation
Creating a project
```bash
django-admin startproject mysite
```
Creating an app
```bash
python3 manage.py startapp polls
```
Runserver on localhost
```bash
python3 manage.py runserver
```
Runserver on LAN
```bash
python3 manage.py runserver <your_ip:port>
```

## App Settings
Add the app to our installed apps in `mysite/mysite/settings.py`.
```python
INSTALLED_APPS = [
	'polls.apps.PollsConfig',
	...
]
```

## App Urls
Add the app to our project url path in `mysite/urls.py`.
```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
	path('admin/', admin.site.urls),
	path('catalog/', incude('catalog.urls')),
]
```

## Database Setup
#### Settings
Alter the project settings in `mysite/mysite/settings.py` to match your database connetion settings. If you are using an alternative DB then you will want to change the database from the default (SQLite) to PostgreSQL you will need to change the DATABASE dicts entries for ENGINE and NAME:
```python
DATABASE = {
	'default': {
        'ENGINE': 'django.db.backends.postgresql'
        'NAME': 'mysite_db',
        'USER': 'davidr',
        'PASSWORD': 'password',
        'HOST': 'localhost',
        'PORT': ''
	}
}
```
#### DB Creation
If a postgres database does not exist:
```bash
sudo su - postgres
psql

CREATE DATABASE mysite_db;
CREATE USER davidr WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE mysite_db TO davidr;

\q
exit
```
#### Migration
Create the tables in the database and include the app.
```bash
python manage.py migrate
python manage.py makemigrations poll
```

## Models
Models are classes that are converted into SQL commands and facilitate the creation of categories in your DB. To create a model in your app edit the file `mysite/polls/models.py` to create a model to hold questions.
```python
from django.db import models
from django.utils import timezone
import datetime

class Question(models.Model):
	question_text = models.CharField(max_length=200)
	pub_date = models.DateTimeField('date_published')

	def was_published_recently(self):
		now = timezone.now()
		return now - datetime.timedelta(days=1) <= self.pub_date <= now
```
#### Migration
You will want to store the models as migrations (viewable in `mysite/polls/migrations/`) which are how django stores changes to your models.
```bash
python3 manage.py makemigrations
```
To apply the changes you made to your models in the database.
```bash
python3 manage.py migrate
```
<B>This activation process is required each time you make changes to your model code.</B>


## Views
Create a class in your `mysite/polls/views.py` file which should inherit from the `django.views.generic` module.
```python
from django.views import generic
from .models import Question

class DetailView(generic.DetailView):
	model = Question
	template_name = 'polls/detail.html'
```
#### URLconf
Then map the view to an url by creating/editing your `mysite/polls/urls.py` file.
```python
app_name = 'polls'
urlpatterns = [
	path('detail/', view.DetailView.as_view(), name='detail')
]
```
This will also have to be mapped in the root url page


## Templates
The Django [teamplate language](https://docs.djangoproject.com/en/2.0/ref/templates/language/) allows you to generate HTML dynamically. Create a a directory `mysite/polls/templates/polls/` and create `detail.html` in said directory with the following code inserted within it.
```html
<h1>{{ question.question_text }}</h1>
<ul>
{% for choice in question.choice_set.all %}
    <li>{{ choice.choice_text }}</li>
{% endfor %}
</ul>
```
The question text refers to the Question object stored in the database and its methods can accessed within the template language.

Alter the `mysite/settings.py` by adding the following to the TEMPLATES dict to tell django where to find the templates.
```python
TEMPLATES = [
    {
        'DIRS': os.path.join(BASE_DIR, 'templates'),
    }
]
```


## Testing
#### Unit Testing
Create `my_site/polls/tests.py` and insert unittest like code into it.
```python
import datetime
from django.test import TestCase
from django.utils import timezone
from .models import Question

class QuestionModelTests(TestCase):
    def test_was_published_recently_with_future_question(self):
        ''' Expects was_published_recently() method to return False
            if the question has a future date as its pub_date attribute.
        '''
        time = timezone.now() + datetime.timedelta(days=30)
        future_question = Question(pub_date=time)
        self.assertIs(future_question.was_published_recently(), False)
```
To execute the test.
```bash
python3 manage.py test polls
```

## Admin
Create an admin user.
```bash
python manage.py createsuperuser
```
Admin stuff can viewed after running the server and going to `<ip-address>/admin/` in your browser.
#### Customisation
The admin form can be customised by altering `mysite/polls/admin.py`. If we want to change the order of the fields in the admin form:
``` python
from django.contrib import admin
from .models import Question

class QuestionAdmin(admin.ModelAdmin):
    fields = ['pub_date', 'question_text']

# gives the Quesions object an admin interface
admin.site.register(Question, QuestionAdmin)
```
#### Project Templates
Create a `mysite/template/admin/` directory. Copy the `/home/davidr/.local/lib/python3.6/site-packages/django/contrib/admin/templates/admin/base.html` base admin template to your new directory. This can be edited to change the look and feel of the admin page.


## CSS
Create dirs/file named `mysite/polls/static/polls/style.css` containg some styling info.
```css
li a {
    color: green;
}
```
Then add the following to the top of your `detail.html` file.
```html
{% load static %}

<link rel="stylesheet" type="text/css" href="{% static 'polls/style.css' %}">
```
Finally edit the `mysite/settings.py` file to tell django where to find the static files.
```python
STATICFILES_DIR = (
    '/polls/static/'
) 

# or the DIRS dict in the TEMPLATE dict. Not sure whcih one.....
TEMPLATES = [
{
    ....
    DIRS = [os.path.join(BASE_DIR, 'polls/static/')],
    ....
}
```
## Forms
#### Generic FormViews
Generic form views allow you to create CRUD forms for a specific model easily.

Add the following views to `project/polls/views.py`
```python
from django.views.generic.edit import CreateView, DeleteView, UpdateView


class QuestionCreate(CreateView):
    model = Question
    fields = '__all__'
    template_name = 'polls/generic_form.html'
    success_url = reverse_lazy('polls:index')


class QuestionUpdate(UpdateView):
    model = Question
    fields = '__all__'
    template_name = 'polls/generic_form.html'
    success_url = reverse_lazy('polls:index')


class QuestionDelete(DeleteView):
    model = Question
    success_url = reverse_lazy('polls:index')
    template_name = 'polls/confirm_delete.html'
```
Add the views to you `polls/urls.py`
```python
urlpatterns = [
    ....
    path('add_question/', views.QuestionCreate.as_view(), name='question_create'),
    path('question/<int:pk>/update/', views.QuestionUpdate.as_view(), name='question_update'),
    path('question/<int:pk>/delete/', views.QuestionDelete.as_view(), name='question_delete'),
]
```

Create the template for the generic view `polls/templates/polls/generic_form.html`.
```html
<h1>Add Question</h1>
{{ data }}
<form method="post">{% csrf_token %}
    {{ form.as_p }}
    <input type="submit" value="Save">
</form>
```

Create the delete template `polls/templates/polls/confirm_delete.html`
```html
{% block content %}

<h1>Delete Question</h1>
{# object keyword is the parsed model.__str__ #}
<p>Are you sure you want to delete the question: {{ object }}?</p>

<form action="" method="POST">
  {% csrf_token %}
  <input type="submit" value="Yes, delete.">
</form>

{% endblock %}
```

#### ModelForm
Useful if you just want to create a model object via a form.

Add the following to the `project/polls/forms.py`
```python
from django import forms

class ChoiceForm(forms.ModelForm):
    class Meta:
        model = Choice
        fields = '__all__'
```
Create a view in `project/polls/views.py`
```python
from django.views.generic.edit import FormView

class AddChoice(FormView):
    template_name = 'polls/generic_form.html'
    form_class = ChoiceForm
    success_url = reverse_lazy('polls:index')

    def form_valid(self, form):
        ''' Save model.'''
        form.save()
        return super().form_valid(form)
```
Add to the urlpatterns in `project/polls/urls.py`
```python
urlpatterns = [
    ....
    path('add_choice/', views.AddChoice.as_view(), name='add_choice'),
]
```

#### Custom Form
The most flexible form method.

Create a `project/polls/forms.py` file and add the following.
```python
from django import forms
from polls.models import Choice, Question

class QuestionForm(forms.Form):
    ''' Allows users to create a Question with four Choices.'''
    question_text = forms.CharField(max_length=200)
    choice1 = forms.CharField(max_length=200)
    choice2 = forms.CharField(max_length=200)
    choice3 = forms.CharField(max_length=200)
    choice4 = forms.CharField(max_length=200)
    template_name = 'generic_form.html'
```
Create a function in `views.py` to handle the question.
```python
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.utils import timezone
from .models import Question, Choice


def add_question_and_choices(request):
    if request.method == 'POST':
        q_form = QuestionForm(request.POST)
        # ensure no weird characters are there
        if q_form.is_valid():
			# get the question_text attribute from the form
            q_str = q_form.cleaned_data['question_text']
            q = Question(question_text=q_str, pub_date=timezone.now())
            q.save()
            all_choices_str = [q_form.cleaned_data['choice{}'.format(x)] for x in range(1, 5)]
            for choice_str in all_choices_str:
                choice = Choice(question=q, choice_text=choice_str)
                choice.save()
        # redirect to the index page after success
        return HttpResponseRedirect(reverse('polls:index'))
    # GET
    else:
        # pass the form as context to the template.
        # after the form is complete, this will then POST to this function.
        context = {'form': QuestionForm()}
        return render(request, 'polls/generic_form.html', context)
```
Map the view to its corresponding template in `polls/urls.py`.
```python
urlpatterns = [
	....
	path('add_question_and_choices/', views.add_question_and_choices, name='add_question_and_choices')
]
```
## Users
Alter your settings.
```python
INSTALLED_APPS = [
    ...
    # Core authentication framework and its default models.
    'django.contrib.auth',  
    # Django content type system (allows permissions to be associated with models).
    'django.contrib.contenttypes',  
    ....

MIDDLEWARE = [
    ...
	# Manages sessions across requests
    'django.contrib.sessions.middleware.SessionMiddleware',  
    ...
    # Associates users with requests using sessions.
    'django.contrib.auth.middleware.AuthenticationMiddleware',  
    ....
```
Create users.
``` python
from django.contrib.auth.models import User

# Create user and save to the database
user = User.objects.create_user(username='myusername', email='myemail@crazymail.com')
user.set_password('password')

# Update fields and then save again
user.first_name = 'John'
user.last_name = 'Citizen'
user.save()
```
Create a group to associate users with.
```python
from django.contrib.auth.models import Group

g1 = Group.objects.create(name='Name of the group')
user = User.objects.get(username='username')

# assign user to group
g1.users.add(user)
```

## Log In
Clone all log templates. They assume a base\_generic.html template exists.
```bash
cd project/
mkdir -p  templates/registration/
git clone https://gist.github.com/superDross/801fc7473f48bdcddcf1fa8445bd1488
mv 801fc7473f48bdcddcf1fa8445bd1488/* templates/registration/
rmdir 801fc7473f48bdcddcf1fa8445bd1488/
```
Add the following to your `urlpattern` list in `project/templates/url.py`.
```python
urlpatterns = [
    ....
    path('accounts/', include('django.contrib.auth.urls')),
]
```
Add the following to your `project/settings.py` file.
```python
TEMPLATES = [
    {
        ...
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        ...
```
The default successful login url-path is /accounts/profile. To change that, place the following in your `project/settings.py` file.
```python
LOGIN_REDIRECT_URL = '/polls'
```
To logout simply go to the `accounts/logout` url path.

## Permissions
To create a permission, put it into a models meta class then use `makemigration` and `migrate`.
```python

class Question(models.Model):
    ....
	class Meta:
    	....
		# first element is a variable and secpnd is the permissions name attribute
		permissions = (("can_view_question", "View Question"),)
```
Restrict view access to users with the given permissions.
```python
from django.contrib.auth.mixins import PermissionRequiredMixIN

class DetailView(PermissionRequiredMixIn, generic.DetailView):
	permission_required = 'polls.can_view_question'
    ....
```
Restrict parts of the template only to users with the required permission(s).
```
{% perms.polls.can_view_question %}
    <!-- something -->
{% endif %}
```
Grant a group with a permission.
```python
from django.contrib.auth.models import Group, Permission

g1 = Group.objects.create(name='Name of the group')
permission = Permission.objects.get(name='View Question')
g1.permissions.add(permission)
```
Grant a user with a permission.
```python
from django.contrib.auth.models import Permission
from django.contrib.auth.models import User

test_user1 = User.objects.create_user(username='testuser1', password='1X<ISRUkw+tuK')
permission = Permission.objects.get(name='permission name')
test_user1.user_permissions.add(permission)
```
#### Login Permissions
Only allow view to be accessible by thos logged in.
```python
from django.contrib.auth.mixins import LoginRequiredMixin

class MyView(LoginRequiredMixin, View):
	login_url = '/login/'
    # redirects to 
	redirect_field_name = 'redirect_to'
```
