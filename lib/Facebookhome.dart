import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'Welcome.dart';

class FaceBookHome extends StatefulWidget {
  FaceBookHome({Key? key, this.data}) : super(key: key);
  var data; //details of the facebook user if availble

  @override
  State<FaceBookHome> createState() => _FaceBookHomeState();
}

class _FaceBookHomeState extends State<FaceBookHome> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Welcome()),
                (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('FaceBook page'),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () async {
                FacebookAuth.i.logOut();
                // await FacebookAuth.instance.logOut();

                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                        (route) => false);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text(
                'Logout',
                  style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Color(0xFF0F2851)),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                  (widget.data["picture"]["data"]["url"] != null)
                      ? Image.network(
                      widget.data["picture"]["data"]["url"] ?? '')
                      .image
                      : AssetImage('assets/user.png'),
                  radius: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Name : ${widget.data["name"]}',
                    style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Color(0xFF0F2851))),
                SizedBox(
                  height: 10,
                ),
                Text('Email : ${widget.data["email"]}',
                    style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Color(0xFF0F2851))),
                SizedBox(
                  height: 10,
                ),
                Text('gender : ${widget.data["gender"]}',
                    style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Color(0xFF0F2851))),
                SizedBox(
                  height: 10,
                ),
                Text('birthday : ${widget.data["birthday"]}',
                    style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Color(0xFF0F2851))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}