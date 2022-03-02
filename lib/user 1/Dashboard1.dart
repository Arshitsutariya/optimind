import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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