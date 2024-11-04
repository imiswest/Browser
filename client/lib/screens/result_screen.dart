
import 'package:flutter/material.dart';
import 'package:flutter_browser/screens/hospitalData_screen.dart';
import 'package:flutter_browser/widgets/custom_appbar.dart';
import 'package:flutter_browser/widgets/map.dart';
import 'package:flutter_browser/Http_file.dart';
import 'package:flutter_browser/screens/loding_screen.dart';
import 'dart:core';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreen createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  final firstApi = FirstApi();
  List<Hospital>? hospitalData; // Hospital 타입으로 선언

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await firstApi.fetchHospitalData();
      setState(() {
        hospitalData = data.cast<Hospital>(); // 데이터를 List<Hospital>로 변환
      });
    } catch (error) {
      print('Error loading data: $error');
      setState(() {
        hospitalData = []; // 오류 발생 시 빈 리스트로 설정
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 데이터를 성공적으로 불러왔는지 여부와 상관없이 HospitalListScreen을 바로 표시
    return HospitalListScreen(hospitalData: hospitalData ?? []);
  }
}

class HospitalListScreen extends StatelessWidget {
  final List<Hospital> hospitalData;

  HospitalListScreen({required this.hospitalData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 70)),
            Center(
              child: Text(
                "병원 매칭이 완료되었습니다!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 176, 113, 113),
              width: 315,
              height: 6,
            ),
            Padding(padding: EdgeInsets.only(top: 35)),
            Text("환자 이송 장소", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 450,
              height: 470,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 201, 201),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text(
                    hospitalData.isNotEmpty ? hospitalData[0].dutyName : "병원 이름 없음",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 350,
                    height: 1,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 140)),
                      Icon(Icons.call),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "051-1234-5678",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "분류 : 지역응급의료센터",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 400,
                    height: 220,
                    child: MapScreen(),
                  ),
                  Container(
                    width: 360,
                    height: 55,
                    child: Text(
                      "주소주소",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    margin: EdgeInsets.only(left: 48),
                    child: Row(
                      children: [
                        Text(
                          "거리 : 00km",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "소요시간 : 00분",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        SizedBox(
                          width: 130,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 255, 236, 236),
                            ),
                            onPressed: () {
                              if (hospitalData.isNotEmpty) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => HospitaldataScreen(
                                      hospitalName: hospitalData[0].dutyName,
                                      hospitalId: hospitalData[0].hpid,
                                      hvec: hospitalData[0].hvec,
                                      hvccc: hospitalData[0].hvccc,
                                      hv2: hospitalData[0].hv2,
                                      hv3: hospitalData[0].hv3,
                                      hv6: hospitalData[0].hv6,
                                      hv34: hospitalData[0].hv34,
                                      hvctayn: hospitalData[0].hvctayn,
                                      hvmriayn: hospitalData[0].hvmriayn,
                                      hvangioayn: hospitalData[0].hvangioayn,
                                      hvventiayn: hospitalData[0].hvventiayn,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              '정보 더보기',
                              style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class ResultScreen extends StatefulWidget{
//   @override
//   _ResultScreen createState() => _ResultScreen();
// }

// class _ResultScreen extends State<ResultScreen> {
//   final firstApi = FirstApi();

//   @override
//   void initState(){
//     super.initState();
//     _loadData();
//   }

//   Future<void>_loadData() async{
//     try {
//       final hospitalData = await firstApi.fetchHospitalData();
//       //데이터가 성공적으로 불러와지면 ResultScreen으로 전환
//       Navigator.pushReplacement(
//         context, 
//         MaterialPageRoute(
//           builder: (context) => HospitalListScreen(hospitalData: hospitalData), //보여지는 화면
//         ),
//       );
//     } catch(error){
//       //에러 발생하면 에러 메세지
//       print('Error loading data: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context){
//     //로딩 중일 때 LodingScreen();
//     return LodingScreen();
//   }
// }

//보여지는 화면
// class HospitalListScreen extends StatelessWidget{
//   final List<Hospital> hospitalData;

//   HospitalListScreen({required this.hospitalData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: ListView.builder(
//           itemCount: hospitalData.length,
//           itemBuilder: (context, index) {
//           final hospital = hospitalData[index];
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(padding: EdgeInsets.only(top: 70)),
//                   Center(
//                     child: Text("병원 매칭이 완료되었습니다!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
//                   ),
//                   Container(
//                     color: Color.fromARGB(255, 176, 113, 113),
//                     width: 315,
//                     height: 6,
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 35)),
//                   Text("환자 이송 장소",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                  
//                   Container(//병원 위치 정보 박스
//                       margin: EdgeInsets.only(top: 8),
//                       width: 450,
//                       height: 470,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 247, 201, 201), // Container의배경색
//                         borderRadius: BorderRadius.circular(15)
//                       ),
//                       child: Column(//내용
//                         children: [//병원명
//                           Padding(padding: EdgeInsets.only(top: 30)),
//                           Text(hospital.dutyName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
//                           Container(
//                             margin: EdgeInsets.all(10),
//                             width: 350, height: 1, color: Colors.black,
//                           ),
//                           Row(//전화번호
//                             children: [
//                               Padding(padding: EdgeInsets.only(left: 140)),
//                               Icon(Icons.call),
//                               Padding(padding: EdgeInsets.only(left: 10)),
//                               Text("051-1234-5678",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
//                             ],
//                           ),
//                           Padding(padding: EdgeInsets.only(top: 10)),
//                           Text("분류 : 지역응급의료센터",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17)),
//                           Container(
//                             padding: EdgeInsets.all(10),
//                             width: 400, height: 220,
//                             child: MapScreen(),
//                           ),
//                           Container(
//                             width: 360,
//                             height: 55,
//                             child: Text("주소주소",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
//                           ),
//                           Padding(padding: EdgeInsets.only(top: 10)),
//                           Container(
//                             margin: EdgeInsets.only(left: 48),
//                             child: Row(
//                               children: [      
//                                 Text("거리 : 00km", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
//                                 Padding(padding: EdgeInsets.all(10)),
//                                 Text("소요시간 : 00분", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
//                                 Padding(padding: EdgeInsets.all(10)),
//                                 SizedBox(
//                                   width: 130,
//                                   height: 30,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 236, 236),),
//                                     onPressed: () {
          
//                                     Navigator.of(context).push( 
//                                       MaterialPageRoute(  
//                                         builder: (BuildContext context) => HospitaldataScreen(
//                                           hospitalName: hospital.dutyName,
//                                           hospitalId: hospital.hpid,
//                                           hvec: hospital.hvec,
//                                           hvccc: hospital.hvccc,
//                                           hv2: hospital.hv2,
//                                           hv3: hospital.hv3,
//                                           hv6: hospital.hv6,
//                                           hv34: hospital.hv34,
//                                           hvctayn: hospital.hvctayn,
//                                           hvmriayn: hospital.hvmriayn,
//                                           hvangioayn: hospital.hvangioayn,
//                                           hvventiayn: hospital.hvventiayn,
//                                         )
//                                       )
//                                     );},
//                                     child: Text('정보 더보기', style: TextStyle(fontSize: 13 ,color: Colors.black, fontWeight: FontWeight.bold))
//                                   ),
//                                 )
//                               ],
//                           )
//                           )
                          
//                       ],
//                     ),
//                   )

//                 ],
                  
//               )
//             );
//           },
//         ) 
//       );
//     }
// }