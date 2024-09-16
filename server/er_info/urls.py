# er_info/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),  # 메인 페이지  # 병원 정보 조회
    path('er-realtime-info/', views.er_realtime_info_view, name='er_realtime_info'),
    path('api/er-info/', views.er_realtime_info_api, name='er_info_api'),
]
