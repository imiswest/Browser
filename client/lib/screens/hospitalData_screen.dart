import 'package:flutter/material.dart';
import 'package:flutter_browser/widgets/custom_appbar.dart';
import 'package:flutter_browser/widgets/map.dart';

class HospitaldataScreen extends StatefulWidget{
  @override
  _HospitaldataScreen createState() => _HospitaldataScreen();
}

class _HospitaldataScreen extends State<HospitaldataScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 70)),
          Center(
            child: Text("해운대 백병원",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) )
          ),
    
          Container( //네모 박스
            margin: EdgeInsets.only(top: 10),
            width: 450,
            height: 460,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 247, 201, 201), // Container의배경색
              borderRadius: BorderRadius.circular(15)
            ),
            
            padding: EdgeInsets.fromLTRB(25, 30, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("기관 ID : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  width: 400, height: 1, color: Color.fromARGB(255, 61, 61, 61),
                ),
              
                Text("예상 진료과목",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            )
            
          )
        ],
        
      )
    );
  }
}