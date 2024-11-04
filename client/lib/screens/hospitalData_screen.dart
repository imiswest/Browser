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
            child: Text("<  해운대 백병원  >",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) )
          ),
    
          Container( //네모 박스
            margin: EdgeInsets.only(top: 25),
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
                  margin: EdgeInsets.only(top: 10,bottom: 20),
                  width: 400, height: 1, color: Color.fromARGB(255, 61, 61, 61),
                ),
              
                Text("진료 과목별 가용 병상 수",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Padding(padding: EdgeInsets.only(top: 7)),
                Text("• 일반(판단 어려움) : 0 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• 흉부외과 : 0 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• 내과 : 0 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• 외과 : 0 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• 신경외과 : 0 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• 심장내과 : 0 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),

                Padding(padding: EdgeInsets.only(top: 25)),
                Text("필수 의료장비 가용 여부",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Padding(padding: EdgeInsets.only(top: 7)),
                Text("• CT 가용 ( O )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• MRI 가용 ( X )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• 혈관촬영기 가용 ( X )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("• 인공호흡기 가용 ( O )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                
              ],
            )
            
          )
        ],
        
      )
    );
  }
}

// class HospitaldataScreen extends StatefulWidget{
//   final String hospitalName;
//   final String hospitalId;
//   final int hvec;
//   final int hvccc;
//   final int hv2;
//   final int hv3;
//   final int hv6;
//   final int hv34;
//   final bool hvctayn;
//   final bool hvmriayn;
//   final bool hvangioayn;
//   final bool hvventiayn;

//   HospitaldataScreen({
//     required this.hospitalName,
//     required this.hospitalId,
//     required this.hvec,
//     required this.hvccc,
//     required this.hv2,
//     required this.hv3,
//     required this.hv6,
//     required this.hv34,
//     required this.hvctayn,
//     required this.hvmriayn,
//     required this.hvangioayn,
//     required this.hvventiayn,
//   });

//   @override
//   _HospitaldataScreen createState() => _HospitaldataScreen();
// }

// class _HospitaldataScreen extends State<HospitaldataScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),

//       body: Column(
//         children: [
//           Padding(padding: EdgeInsets.only(top: 70)),
//           Center(
//             child: Text("<  ${widget.hospitalName}  >",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) )
//           ),
    
//           Container( //네모 박스
//             margin: EdgeInsets.only(top: 25),
//             width: 450,
//             height: 460,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 247, 201, 201), // Container의배경색
//               borderRadius: BorderRadius.circular(15)
//             ),
            
//             padding: EdgeInsets.fromLTRB(25, 30, 30, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("기관 ID : ${widget.hospitalId}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
//                 Container(
//                   margin: EdgeInsets.only(top: 10,bottom: 20),
//                   width: 400, height: 1, color: Color.fromARGB(255, 61, 61, 61),
//                 ),
              
//                 Text("진료 과목별 가용 병상 수",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                 Padding(padding: EdgeInsets.only(top: 7)),
//                 Text("• 일반(판단 어려움) : ${widget.hvec} 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• 흉부외과 : ${widget.hvccc} 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• 내과 : ${widget.hv2} 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• 외과 : ${widget.hv3} 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• 신경외과 : ${widget.hv6} 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• 심장내과 : ${widget.hv34} 개", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),

//                 Padding(padding: EdgeInsets.only(top: 25)),
//                 Text("필수 의료장비 가용 여부",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                 Padding(padding: EdgeInsets.only(top: 7)),
//                 Text("• CT 가용 ( ${widget.hvctayn ? "O" : "X"} )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• MRI 가용 ( ${widget.hvmriayn ? "O" : "X"} )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• 혈관촬영기 가용 ( ${widget.hvangioayn ? "O" : "X"} )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//                 Text("• 인공호흡기 가용 ( ${widget.hvventiayn ? "O" : "X"} )", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                
//               ],
//             )
            
//           )
//         ],
        
//       )
//     );
//   }
// }

/* 
- 일반(판단 어려움) `hvec`
- 흉부외과 `hvccc`
- 내과 `hv2`
- 외과 `hv3`
- 신경외과 `hv6`
- 심장내과 `hv34`
- 필수 의료장비 [4 응급실 실시간 가용병상정보 조회]
    1. CT 가용 `hvctayn`
    2. MRI 가용 `hvmriayn`
    3. 혈관촬영기 가용 `hvangioayn`
    4. 인공호흡기 가용 `hvventiayn`
*/