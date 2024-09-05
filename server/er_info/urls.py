# er_info/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),  # 메인 페이지  # 병원 정보 조회
]
