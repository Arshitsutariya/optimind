import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:optimind/Model/user_model.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  //final firstname = FirebaseAuth.instance.currentUser!.;
  final email = FirebaseAuth.instance.currentUser!.email;



  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  // verifyEmail() async {
  //   // if (user != null && !user!.emailVerified) {
  //     await user!.sendEmailVerification();
  //     print('Verification Email has benn sent');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Color(0xFF0F2851),
  //         content: Text(
  //           'Verification Email has been sent',
  //           style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white),
  //         ),
  //       ),
  //     );
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
              children: [

             Row(
               mainAxisAlignment:MainAxisAlignment.center ,
               children: [

                 Text(
                   "${loggedInUser.firstName} ${loggedInUser.secondName}",
                   style: TextStyle(
                       fontSize: 20,
                       fontFamily: "Gilmer Medium",
                       color: Color(0xFF0F2851)),
                 ),



               ],
             ),
                SizedBox(height: 10,),
                Text(
                  'Email: $email',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Gilmer Medium",
                      color: Color(0xFF3F4553)),
                ),
          //       user!.emailVerified
          //           ? Text(
          //         'verified',
          //         style: TextStyle(
          //             fontSize: 15,
          //             fontFamily: "Gilmer Bold",
          //             color: Color(0xFF0F2851)),
          //       )
          //        :    TextButton(
          //           onPressed: () => {
          //             // verifyEmail()
          //           },
          //           child: Text('Verify Email',style: TextStyle(
          // fontSize: 15,
          // fontFamily: "Gilmer Bold",
          // color: Color(0xFF0F2851)),))
              ],
            ),

          ],
        ),
      ),
    );
  }
}