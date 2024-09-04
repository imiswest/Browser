from django.shortcuts import render
import requests
from django.http import JsonResponse
from django.conf import settings

def get_location(request):
    lat = request.GET.get('lat')
    lng = request.GET.get('lng')
    
    if not lat or not lng:
        return JsonResponse({'error': '위도와 경도를 입력하세요.'}, status=400)
    
    url = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json"
    headers = {"Authorization": f"KakaoAK {settings.KAKAO_API_KEY}"}
    params = {"x": lng, "y": lat}
    
    response = requests.get(url, headers=headers, params=params)
    if response.status_code == 200:
        data = response.json()
        region_info = {
            "sido": data['documents'][0]['region_1depth_name'],
            "sigungu": data['documents'][0]['region_2depth_name']
        }
        return JsonResponse(region_info)
    else:
        return JsonResponse({'error': 'Failed to fetch data from Kakao API'}, status=response.status_code)


def index(request):
    return render(request, 'location/index.html')