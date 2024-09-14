import requests
import xml.etree.ElementTree as ET
from django.shortcuts import render
from django.conf import settings

def main(request):
    hospitals = []
    lon = request.GET.get('WGS84_LON')
    lat = request.GET.get('WGS84_LAT')
    
    if lon and lat:
        api_url = "http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEgytLcinfoInqire"  
        service_key = settings.ER_API_KEY

        params = {
            'serviceKey': service_key,
            'WGS84_LON': lon,
            'WGS84_LAT': lat,
        }

        response = requests.get(api_url, params=params)

        # API 호출 URL 출력
        print(f"API 요청 URL: {response.url}")

        if response.status_code == 200:
            print(response.text)  # 응답 데이터를 로그로 출력하여 확인
            try:
                # XML 응답을 파싱
                root = ET.fromstring(response.content)
                # 여기서 필요한 XML 데이터를 추출
                for item in root.findall('.//item'):
                    hospital = {
                        'hpid': item.find('hpid').text,
                        'distance': item.find('distance').text,
                        'dutyName': item.find('dutyName').text,
                        'dutyAddr': item.find('dutyAddr').text
                    }
                    hospitals.append(hospital)
                totalCount = int(root.findtext('.//totalCount'))
                if totalCount == 0:
                    print("해당 위치 반경 내에 응급실이 없습니다.")
            except ET.ParseError as e:
                print(f"XML 파싱 오류: {e}")

            
        else:
            print(f"API 호출 실패. 상태 코드: {response.status_code}")
            print(response.text)

    return render(request, 'emergencyroom/index.html', {'hospitals': hospitals})
