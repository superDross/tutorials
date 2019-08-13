from django.shortcuts import render
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.decorators import permission_required
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse, reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView

from .models import Book, Author, BookInstance, Genre
from .forms import RenewBookForm

import datetime


def index(request):
    '''View function for home page of site.'''
    # Generate counts of some of the main objects
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.all().count()
    # Available books (status = 'a')
    num_instances_available = BookInstance.objects.filter(
        status__exact='a').count()
    # The 'all()' is implied by default.
    num_authors = Author.objects.count()
    # The number of fantasy genre books
    num_fantasy = Genre.objects.filter(name__icontains='fantasy').count()
    # number of books taht use the word fable
    num_fables = Book.objects.filter(summary__icontains='fable').count()
    # number of times a user has visited the website
    num_visits = request.session.get('num_visits', 0)
    request.session['num_visits'] = num_visits + 1
    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
        'num_fantasy': num_fantasy,
        'num_fables': num_fables,
        'num_visits': num_visits,
    }
    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)


class BookListView(generic.ListView):
    model = Book
    template_name = 'book_list.html'
    # restrict the number of listed items to 10/page.
    # placing /?page=2 at teh end of the link allows
    # you to see the next 10.
    paginate_by = 10

    # def get_context_data(self, **kwargs):
    #     # Call the base implementation first to get the context
    #     context = super(BookListView, self).get_context_data(**kwargs)
    #     # Create any data and add it to the context
    #     context['some_data'] = 'This is just some data'
    #     return context

    # your own name for the list as a template variable
    context_object_name = 'my_book_list'


# DetailView expects to be parsed a primary key (pk)
class BookDetailView(generic.DetailView):
    # context object name becomes the model name in lowercase
    model = Book
    template_name = 'book_detail.html'


# this MixIn will not let you access the page unless logged in
class LoanedBooksByUserListView(LoginRequiredMixin, generic.ListView):
    ''' CBV listing books on loan to current user.'''
    model = BookInstance
    template_name = 'bookinstance_list_borrowed_user.html'
    paginate_by = 10

    def get_queryset(self):
        book_instances = BookInstance.objects.filter(
            borrower=self.request.user)
        return book_instances.filter(status__exact='o').order_by('due_back')


class AllLoanedBooks(LoginRequiredMixin, generic.ListView):
    model = BookInstance
    template_name = 'bookinstance_list.html'
    paginate_by = 10
    permission_required = 'catalog.can_view_all_books'


class AuthorListView(generic.ListView):
    model = Author
    template_name = 'author_list.html'
    paginate_by = 10
    context_object_name = 'my_author_list'


class AuthorDetailView(generic.DetailView):
    model = Author
    template_name = 'author_detail.html'


# Functional View for our RenewBookForm
@permission_required('catalog.can_mark_returned')
def renew_book_librarian(request, pk):
    ''' Gives librarians the ability to renew loaned books.
    Args:
        pk (uuid): primary key of a BookInstance
    '''
    book_instance = get_object_or_404(BookInstance, pk=pk)
    # If this is a POST request then process the Form data
    if request.method == 'POST':
        # Create a form instance and populate it with data
        # from the request (binding):
        book_renewal_form = RenewBookForm(request.POST)
        # Check if the form is valid:
        if book_renewal_form.is_valid():
            # process the data in form.cleaned_data as required
            # (here we just write it to the model due_back field)
            book_instance.due_back = book_renewal_form.cleaned_data['renewal_date']
            book_instance.save()
            # redirect to a new URL:
            # reverse generates the URL used in the URLConfig name
            return HttpResponseRedirect(reverse('all-borrowed'))
    # If this is a GET (or any other method)
    # create the default form.
    else:
        proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
        # RenewBookForm.renewal_date = proposed_renewal_date
        book_renewal_form = RenewBookForm(
            initial={'renewal_date': proposed_renewal_date})
    context = {
            'form': book_renewal_form,
            'book_instance': book_instance,
    }
    return render(request, 'book_renew_librarian.html', context)


# Generic form views that handle BOTH the view and form creation
class AuthorCreate(PermissionRequiredMixin, CreateView):
    model = Author
    fields = '__all__'
    initial = {'date_of_death': '05/01/2018'}
    template_name = 'generic_form.html'
    # template name is always {app_name}/{model}_form.html
    # e.g. catalog/author_form.html
    permission_required = 'catalog.can_crud_author'


class AuthorUpdate(PermissionRequiredMixin, UpdateView):
    model = Author
    fields = ['first_name', 'last_name', 'date_of_birth', 'date_of_death']
    template_name = 'generic_form.html'
    permission_required = 'catalog.can_crud_author'


class AuthorDelete(PermissionRequiredMixin, DeleteView):
    model = Author
    # a redirection url after deletion
    success_url = reverse_lazy('authors')
    template_name = 'confirm_delete.html'
    # template name is always {app_name}/{model}_confirm_delete.html
    permission_required = 'catalog.can_crud_author'

    def get_context_data(self, **kwargs):
        ''' Passes model name to the context.'''
        context = super().get_context_data(**kwargs)
        context['model_name'] = 'Author'
        return context


class BookCreate(PermissionRequiredMixin, CreateView):
    model = Book
    fields = '__all__'
    # initial = {'date_of_death': '05/01/2018'}
    template_name = 'generic_form.html'
    permission_required = 'catalog.can_crud_book'


class BookUpdate(PermissionRequiredMixin, UpdateView):
    model = Book
    fields = '__all__'
    template_name = 'generic_form.html'
    permission_required = 'catalog.can_crud_book'


class BookDelete(PermissionRequiredMixin, DeleteView):
    model = Book
    # a redirection url after deletion
    success_url = reverse_lazy('books')
    template_name = 'confirm_delete.html'
    permission_required = 'catalog.can_crud_book'

    def get_context_data(self, **kwargs):
        ''' Passes model name to the context.'''
        context = super().get_context_data(**kwargs)
        context['model_name'] = 'Book'
        return context
