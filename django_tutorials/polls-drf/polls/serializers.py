""" Serializers convert data, like querysets, to be converted to JSON types. """
from rest_framework import serializers

from .models import Choice, Question


class ChoiceSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    choice_text = serializers.CharField(max_length=200)

    def create(self, validated_data):
        """ Used for POST requests (override base method)."""
        return Choice.objects.create(**validated_data)


class QuestionListPageSerializer(serializers.Serializer):
    # read only as it is not a model field and so serializers should
    # expect it in post calls
    id = serializers.IntegerField(read_only=True)
    question_text = serializers.CharField(max_length=200)
    pub_date = serializers.DateTimeField()
    # Serializer is smart enough to understand that was_published_recently is a method on Question
    published_recently = serializers.BooleanField(read_only=True)
    word_count = serializers.IntegerField(read_only=True)

    def create(self, validated_data):
        """ Used for POST requests (override base method)."""
        return Question.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """ Used for PATCH requests."""
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class QuestionDetailPageSerializer(QuestionListPageSerializer):
    # many displays a list of all choices
    choices = ChoiceSerializer(many=True, read_only=True)


class VoteSerializer(serializers.Serializer):
    choice_id = serializers.IntegerField()


class ChoiceSerializerWithVotes(ChoiceSerializer):
    votes = serializers.IntegerField(read_only=True)


class QuestionResultPageSerializer(QuestionListPageSerializer):
    choices = ChoiceSerializerWithVotes(many=True, read_only=True)
