# location_search/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('get-location/', views.get_location, name='get_location'),
]
