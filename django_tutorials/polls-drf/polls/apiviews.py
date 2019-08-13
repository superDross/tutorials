import json
from datetime import datetime

from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from django.views.decorators.csrf import csrf_exempt
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import Choice, Question
from .serializers import (ChoiceSerializer, QuestionDetailPageSerializer,
                          QuestionListPageSerializer,
                          QuestionResultPageSerializer, VoteSerializer)

# First Try (pure django):
# Only handles form data, not JSON.
# Must specify all args in defined format (including pub_date)
# @csrf_exempt
# def questions_view(request):
#     if request.method == "GET":
#          questions = []
#          for question in Question.objects.all():
#              question_representation = {
#                  'question_text': question.question_text,
#                  'pub_date': question.pub_date.strftime("%Y-%m-%d")
#              }
#              questions.append(question_representation)
#          return HttpResponse(json.dumps(questions), content_type='application/json')
#     elif request.method == "POST":
#         question_text = request.POST["question_text"]
#         pub_date = datetime.strptime(request.POST["pub_date"], "%Y-%m-%d")
#         Question.objects.create(question_text=question_text, pub_date=pub_date)
#         return HttpResponse("Question created", status=201)


# Second Try (simple DRF):
#
# Can handle JSON
# uses DRF specific Response object instead of HttpResponse
# data validation
@api_view(["GET", "POST"])
def questions_view(request):
    if request.method == "GET":
        questions = Question.objects.all()
        serializer = QuestionListPageSerializer(questions, many=True)
        return Response(serializer.data)
    elif request.method == "POST":
        serializer = QuestionListPageSerializer(data=request.data)
        if serializer.is_valid():
            question = serializer.save()
            return Response(
                QuestionListPageSerializer(question).data,
                status=status.HTTP_201_CREATED,
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Requests:
#
# NOTE: change data key to json for json post instead of form post
# resp = requests.post(
#     "http://localhost:8000/api/polls/questions/",
#     data={"pub_date": "2019-04-18", "question_text": "What's new?"},
# )

# Curl
#
# curl -X POST /
#      -F 'question_text=What is the meaning of life?' /
#      -F 'pub_date=2019-04-18' /
#      http://localhost:8000/api/polls/questions/


@api_view(["GET", "PATCH", "DELETE"])
def question_detail_view(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    if request.method == "GET":
        serializer = QuestionDetailPageSerializer(question)
        return Response(serializer.data)
    elif request.method == "PATCH":
        serializer = QuestionDetailPageSerializer(
            question, data=request.data, partial=True
        )
        if serializer.is_valid():
            question = serializer.save()
            return Response(QuestionDetailPageSerializer(question).data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == "DELETE":
        question.delete()
        return Response("Question deleted", status=status.HTTP_204_NO_CONTENT)


# requests.patch(
#     "http://localhost:8000/api/polls/questions/6/",
#     json={"question_text": "Whats Newer?"},
# ).content


@api_view(["POST"])
def choices_view(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    serializer = ChoiceSerializer(data=request.data)
    if serializer.is_valid():
        choice = serializer.save(question=question)
        return Response(ChoiceSerializer(choice).data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# requests.post(
#    "http://127.0.0.1:8000/polls/questions/1/choices/",
#    json={"choice_text": "today"},
# )


@api_view(["PATCH"])
def vote_view(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    serializer = VoteSerializer(data=request.data)
    if serializer.is_valid():
        choice = get_object_or_404(
            Choice, pk=serializer.validated_data["choice_id"], question=question
        )
        choice.votes += 1
        choice.save()
        return Response("Voted")
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# requests.patch(
#     "http://localhost:8000/api/polls/questions/6/vote/",
#     json={"choice_id": 12}
# )


@api_view(["GET"])
def question_result_view(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    serializer = QuestionResultPageSerializer(question)
    return Response(serializer.data)
