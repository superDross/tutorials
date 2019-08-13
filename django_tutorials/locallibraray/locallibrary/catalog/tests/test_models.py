''' All unit tests for the catalog models.'''
from django.test import TestCase

from catalog.models import Author


class AuthorModelTest(TestCase):
    ''' Test models.Author.'''

    @classmethod
    def setUpTestData(cls):
        '''Set up non-modified objects used by all test methods.'''
        Author.objects.create(first_name='Big', last_name='Bob')

    def test_last_name_label(self):
        author = Author.objects.get(id=1)
        # _meta is needed to get an instance of the field
        field_label = author._meta.get_field('last_name').verbose_name
        self.assertEquals(field_label, 'last name')

    def test_first_name_label(self):
        author = Author.objects.get(id=1)
        field_label = author._meta.get_field('first_name').verbose_name
        self.assertEquals(field_label, 'first name')

    def test_date_of_birth_label(self):
        author = Author.objects.get(id=1)
        field_label = author._meta.get_field('date_of_birth').verbose_name
        self.assertEquals(field_label, 'Born')

    def test_date_of_death_label(self):
        author = Author.objects.get(id=1)
        field_label = author._meta.get_field('date_of_death').verbose_name
        self.assertEquals(field_label, 'Died')

    def test_last_name_max_length(self):
        author = Author.objects.get(id=1)
        max_length = author._meta.get_field('last_name').max_length
        self.assertEquals(max_length, 100)

    def test_first_name_max_length(self):
        author = Author.objects.get(id=1)
        max_length = author._meta.get_field('first_name').max_length
        self.assertEquals(max_length, 100)

    def test_object_name_is_last_name_comma_first_name(self):
        ''' test __str__ produces expected string.'''
        author = Author.objects.get(id=1)
        expected_object_name = '{}, {}'.format(
            author.last_name, author.first_name)
        self.assertEquals(expected_object_name, str(author))

    def test_get_absolute_url(self):
        ''' This will also fail if the urlconf is not defined.'''
        author = Author.objects.get(id=1)
        self.assertEquals(author.get_absolute_url(), '/catalog/author/1')
