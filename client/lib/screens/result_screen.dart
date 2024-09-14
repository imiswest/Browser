import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapOptionsExample extends StatefulWidget {
  @override
  _MapOptionsExampleState createState() => _MapOptionsExampleState();
}

class _MapOptionsExampleState extends State<MapOptionsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapOptions Example'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(37.5665, 126.9780),  // 서울 좌표
          initialZoom: 16.5,  // 초기 줌 레벨
          maxZoom: 20.0,
          minZoom: 7.0, 
        ),
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
                point: LatLng(37.5665, 126.9780),  // 서울 좌표에 마커 추가
                child: Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
