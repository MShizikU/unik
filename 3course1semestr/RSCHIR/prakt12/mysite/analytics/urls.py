from django.urls import path
from . import views

urlpatterns = [
    path('books/', views.books, name='books'),
    path('telephones/', views.telephones, name='telephones')
]
