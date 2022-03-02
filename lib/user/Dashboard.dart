import 'package:flutter/material.dart';

class Dashboard1 extends StatefulWidget {
  Dashboard1({Key? key}) : super(key: key);

  @override
  _Dashboard1State createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Text(
            'Optimind',
              style: TextStyle(fontSize: 48, fontFamily: 'GrandHotel', color: Color(0xFF3F4553)),
          )),
    );
  }
}