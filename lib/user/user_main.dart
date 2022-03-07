import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:optimind/Welcome.dart';
import 'package:optimind/user%201/Dashboard1.dart';


import '../user/Dashboard.dart';
import '../user/ChangePassword.dart';
import '../user/Profile.dart';

import 'package:optimind/Homescreen.dart';

class UserMain extends StatefulWidget {
  UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Profile(),
    ChangePassword(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      final shouldPop = await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(
                'Do you want to Exit?',
                style: TextStyle(
                    fontFamily: 'Gilmer Bold', color: Color(0xFF3F4553)),
              ),
              //content: Text('Do you want to Exit'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'No',
                    style: TextStyle(fontFamily:"Gilmer Medium",fontSize: 15, color: Color(0xFF3F4553)),
                  ),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Yes',
                    style: TextStyle(fontFamily:"Gilmer Medium",fontSize: 15, color: Color(0xFF3F4553)),
                  ),
                ),
              ],
            ),
      );
      return shouldPop??false;
    }



    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCACB68),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Welcome",style: TextStyle(color: Color(0xFF0F2851),fontFamily: "Gilmer Bold",fontSize: 26),),

              ElevatedButton(
                onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 5000),
                    backgroundColor: Color(0xFF0F2851),
                content: Text('Logout is processing...',
                  style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white),)));
                GoogleSignIn googleSignIn = GoogleSignIn();
                await googleSignIn.disconnect();

                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Welcome(),
                      ),
                          (route) => false);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Text('Logout',style: TextStyle(fontFamily: "Gilmer Bold")),
                style: ElevatedButton.styleFrom(primary: Color(0xFF3F4553)),
              )
            ],
          ),

        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',



            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Profile',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Change Password',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF0F2851),
          onTap: _onItemTapped,
          selectedLabelStyle: TextStyle(fontFamily: "Gilmer Medium",color: Color(0xFF0F2851)),
          unselectedLabelStyle: TextStyle(fontFamily: "Gilmer Medium",color: Color(0xFF0F2851)),
        ),
      ),
    );
  }
}