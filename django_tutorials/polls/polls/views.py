from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from django.http import Http404
# given an url pattern django uses url() to pick the right view.
# To do the opposite (view to pick right url), reverse function is used.
from django.urls import reverse
from django.views import generic
from django.utils import timezone

from .models import Question, Choice

# NOTE: ccbv.co.uk covers generic views in more detail.


# def index(request):
#     return HttpResponse('Hello')

# def index(request):
#     # request == 'polls/'
#     latest_question_list = Question.objects.order_by('-pub_date')[:5]
#     template = loader.get_template('polls/index.html')
#     # the context is a dict mapping template variable names to python objects
#     # thet can be used to display information in the template.
#     context = {
#         'latest_question_list': latest_question_list,
#     }
#     # parse the context and request to the template
#     return HttpResponse(template.render(context, request))


# def index(request):
#     latest_question_list = Question.objects.order_by('-pub_date')[:5]
#     context = {'latest_question_list': latest_question_list}
#     # render bypasses the use of loader & HttpResponse
#     return render(request, 'polls/index.html', context)


class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """Return the last five published questions."""
        # the returned queryset value is accesible to the template
        # as 'latest_question_list'
        past_questions = Question.objects.filter(pub_date__lte=timezone.now())
        return past_questions.order_by('-pub_date')[:5]


# def detail(request, question_id):
#     return HttpResponse("You're looking at question %s." % question_id)


# def detail(request, question_id):
#     # raise a 404 if question doesn't exist
#     try:
#         question = Question.objects.get(pk=question_id)
#     except Question.DoesNotExist:
#         raise Http404("Question does not exist")
#     return render(request, 'polls/detail.html', {'question': question})


# def detail(request, question_id):
#     # a try/except 404 shortcut
#     question = get_object_or_404(Question, pk=question_id)
#     return render(request, 'polls/detail.html', {'question': question})


class DetailView(generic.DetailView):
    # the model is available to the template as a lowercase
    # name of the model e.g. 'question'
    model = Question
    template_name = 'polls/detail.html'

    def get_queryset(self):
        """ Exclude any questions that aren't yet publshed. """
        return Question.objects.filter(pub_date__lte=timezone.now())


# def results(request, question_id):
#     response = "You're looking at the results of question %s."
#     return HttpResponse(response % question_id)


# def results(request, question_id):
#     question = get_object_or_404(Question, pk=question_id)
#     return render(request, 'polls/results.html', {'question': question})


class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'


# def vote(request, question_id):
#     return HttpResponse("You're voting on question %s." % question_id)


def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        # request.POST contains the dated posted by the detail.html form
        # in a dictionary format. Specifically the selected radio name (choice) as
        # a dict key and the radio value (choice.id) as the dict value in the deatil.html.
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
