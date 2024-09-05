import requests
from django.shortcuts import render
from django.conf import settings

def main(request):
    hospitals = []
    lon = request.GET.get('WGS84_LON').strip()
    lat = request.GET.get('WGS84_LAT').strip()
    
    if lon and lat:
        # 실제 API URL로 교체
        api_url = "http://apis.data.go.kr/B552657/ErmctInfoInqireService"  
        service_key = settings.ER_API_KEY

        params = {
            'serviceKey': service_key,
            'WGS84_LON': lon,
            'WGS84_LAT': lat,
            'radius': 5000  # 반경 설정
        }

        response = requests.get(api_url, params=params)

        if response.status_code == 200:
            data = response.json()
            hospitals = data['response']['body']['items']
        else:
            print(f"API 호출 실패. 상태 코드: {response.status_code}")
            print(response.text)  # 응답 본문 출력

    return render(request, 'emergencyroom/index.html', {'hospitals': hospitals})
