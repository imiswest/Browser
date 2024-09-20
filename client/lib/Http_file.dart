import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchHospitalData() async {
  final response = await http.get(Uri.parse('http://localhost:8000/emergencyroom/api/er-info/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);  // JSON 데이터를 파싱
  } else {
    throw Exception('Failed to load hospital data');
  }
}