from django.shortcuts import render
from django.http import JsonResponse
from django.conf import settings
from .models import Stage
from django.views.decorators.csrf import csrf_exempt
import requests
import json

def index(request):
    return render(request, 'location/index.html')

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
        # 데이터베이스에 저장
        location = Stage(
            sido=region_info['sido'],
            sigungu=region_info['sigungu'],
            latitude=lat,
            longitude=lng
        )
        location.save()

        return JsonResponse(region_info)
    else:
        return JsonResponse({'error': 'Failed to fetch data from Kakao API'}, status=response.status_code)





@csrf_exempt
def save_location(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            latitude = data.get('latitude')
            longitude = data.get('longitude')

            # 위도/경도를 처리하는 로직 (예: DB에 저장하거나 시도/시군구 변환)
            # 이 부분은 필요에 따라 구현하세요.

            return JsonResponse({'status': 'success', 'latitude': latitude, 'longitude': longitude})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'invalid request'})