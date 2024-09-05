from django.shortcuts import render

def main(request):
    # 메인 화면 렌더링
    return render(request, 'emergencyroom/index.html')
