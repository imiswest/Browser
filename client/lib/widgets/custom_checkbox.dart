import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          Padding(padding: EdgeInsets.only(left: 25, top: 10)),
            Row(
              children: [
                Text(
                  'CT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                  activeColor: const Color.fromARGB(255, 212, 96, 107),
                  checkColor: Colors.white,
                ),
              ],
            ),],
            ),
        ),
    );
  }
}