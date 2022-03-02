import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:optimind/Emaillogin.dart';

class ChangePassword1 extends StatefulWidget {
  ChangePassword1({Key? key}) : super(key: key);

  @override
  _ChangePassword1State createState() => _ChangePassword1State();
}

class _ChangePassword1State extends State<ChangePassword1> {
  final _formKey = GlobalKey<FormState>();

  var newPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Emaillogin()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF0F2851),
          content: Text(
            'Your Password has been Changed. Login again !',
            style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white),
          ),
        ),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   key: _formKey,
    //   child: Padding(
    //     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    //     child: ListView(
    //       children: [
    //         SizedBox(height: 150,),
    //         Container(
    //           margin: EdgeInsets.symmetric(vertical: 10.0),
    //           child: TextFormField(
    //             autofocus: false,
    //             obscureText: true,
    //             decoration: InputDecoration(
    //               enabledBorder: OutlineInputBorder(
    //                   borderSide:
    //                   BorderSide(color: Color(0xFFC3C1C1)),
    //                   borderRadius: BorderRadius.circular(12)),
    //               labelText: 'New Password ',
    //
    //               hintText: 'Enter New Password',
    //               hintStyle: TextStyle(
    //                   fontFamily: 'Gilmer Medium',
    //                   fontSize: 14.0,
    //                   color: Color(0xFF6f7d93)),
    //               labelStyle: TextStyle(
    //                   fontFamily: 'Gilmer Medium',
    //                   fontSize: 16.0,
    //                   color: Color(0xFF6f7d93)),
    //               border: OutlineInputBorder(),
    //               errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
    //             ),
    //             controller: newPasswordController,
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please Enter Password';
    //               }
    //               return null;
    //             },
    //           ),
    //         ),
    //         SizedBox(height: 10,),
    //         SizedBox(
    //           height: 60,width: 301.94,
    //           child: RaisedButton(
    //             color: Color(0xFF3F4553),
    //
    //             onPressed: () {
    //               // Validate returns true if the form is valid, otherwise false.
    //               if (_formKey.currentState!.validate()) {
    //                 setState(() {
    //                   newPassword = newPasswordController.text;
    //                 });
    //                 changePassword();
    //               }
    //
    //             },
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10)),
    //
    //
    //             child: Text(
    //               'Change Password',
    //               style: TextStyle(fontSize: 18.0,color: Color(0xFFFFFFFF),fontFamily: "Gilmer Bold"),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
     );
  }
}