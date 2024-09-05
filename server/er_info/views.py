from django.shortcuts import render
from django.http import HttpResponse

# index 뷰 함수 정의
def index(request):
    return HttpResponse("This is the Emergency Room information page.")
