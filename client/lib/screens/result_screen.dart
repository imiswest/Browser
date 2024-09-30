
import 'package:flutter/material.dart';
import 'package:flutter_browser/widgets/custom_appbar.dart';
import 'package:flutter_browser/widgets/map.dart';
import 'package:flutter_browser/screens/hospitalData_screen.dart';


class ResultScreen extends StatefulWidget{
  @override
  _ResultScreen createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Column( //전체
        children: [
          Padding(padding: EdgeInsets.only(top: 70)),
          Center(
            child: Text("병원 매칭이 완료되었습니다!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
          ),
          Container(
            color: Color.fromARGB(255, 176, 113, 113),
            width: 315,
            height: 6,
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Text("환자 이송 장소",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
          
          Container(//병원 위치 정보 박스
              margin: EdgeInsets.only(top: 8),
              width: 450,
              height: 470,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 201, 201), // Container의배경색
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(//내용
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text("인제대학교 해운대백병원",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 350, height: 1, color: Colors.black,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 140)),
                      Icon(Icons.call),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text("051-1234-5678",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text("분류 : 지역응급의료센터",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17)),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 400, height: 240,
                    child: MapScreen(),
                  ),
                  Container(
                    width: 360,
                    child: Text("부산광역시 해운대구 해운대로 875",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                  ),
                   Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      margin: EdgeInsets.only(left: 48),
                      child: Row(
                        children: [      
                          Text("거리 : 00km", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          Padding(padding: EdgeInsets.all(10)),
                          Text("소요시간 : 00분", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            width: 130,
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 236, 236),),
                              onPressed: () {
      
                              Navigator.of(context).push( 
                              MaterialPageRoute(  
                              builder: (BuildContext context) => HospitaldataScreen()
                              ));
                              },
                              child: Text('정보 더보기', style: TextStyle(fontSize: 13 ,color: Colors.black, fontWeight: FontWeight.bold))
                            ),
                          )
                        ],
                    )
                    )
                  
              ],
            ),
          )

        ],
           
      )
    );
  }
}