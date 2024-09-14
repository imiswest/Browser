import 'package:flutter/material.dart';
import 'package:flutter_browser/widgets/custom_appbar.dart';


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
          Padding(padding: EdgeInsets.only(top: 100)),
          Center(
            child: Text("병원 매칭이 완료되었습니다!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
          ),
          Container(
            color: Color.fromARGB(255, 171, 110, 110),
            width: 300,
            height: 5,
            )
          
          
        ],
           
      )
    );
  }
}