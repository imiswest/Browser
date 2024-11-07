import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  LatLng? _currentLocation; //위경도를 저장할 변수
  @override
  void initState() {
    super.initState();
    fetchLocationData();  // 초기화 시 서버에서 데이터 요청
  }
  // 서버에서 위경도 데이터 가져오는 함수
  Future<void> fetchLocationData() async {
    final response = await http.get(Uri.parse('http://43.202.50.175:8000/location/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body); // JSON 응답을 파싱
      // 서버에서 받은 데이터를 위경도 형태로 변환
      setState(() {
        _currentLocation = LatLng(data['latitude'], data['longitude']);
      });
    } else {
      // 요청 실패 시 에러 처리
      print('Failed to load map location data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLocation == null 
        ? Center(child: CircularProgressIndicator())
        : FlutterMap(
          options: MapOptions(
            initialCenter: _currentLocation!, //서버에서 받은 좌표
            //LatLng(37.5665, 126.9780),  // 서울 좌표
            initialZoom: 16.5,  // 초기 줌 레벨
            maxZoom: 20.0,
            minZoom: 7.0, 
          ),
          // 마커 레이어
           children: [
            // OSM 타일 레이어
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            // 마커 레이어
            MarkerLayer(
              markers: [
                Marker( 
                  width: 80.0,
                  height: 80.0,
                  point: _currentLocation!, //서버에서 받은 주소
                  //LatLng(37.5665, 126.9780),  // 서울 좌표에 마커 추가
                  child: Icon(Icons.location_on, color: Colors.red, size: 40),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
