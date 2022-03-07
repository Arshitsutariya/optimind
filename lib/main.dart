



import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/ForgetPassword.dart';
import 'package:optimind/Homescreen.dart';
import 'package:optimind/Phonelogin.dart';
import 'package:optimind/SignUp.dart';
import 'package:optimind/Splash.dart';
import 'package:optimind/Verification.dart';
import 'package:optimind/Welcome.dart';

import 'package:optimind/user/ChangePassword.dart';
import 'package:optimind/user/Dashboard.dart';
import 'package:optimind/user/Profile.dart';
import 'package:optimind/user/user_main.dart';
import 'package:provider/provider.dart';




Future <void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(



    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',

    routes: {

      'splash': (context) => Splash(),
      'welcome': (context) => Welcome(),
      'emaillogin': (context) => Emaillogin(),
      'signup': (context) => SignUp(),
      'forgetpassword': (context) => ForgetPassword(),
      'phonelogin': (context) => Phonelogin(),
      'verification': (context) => Verification(),
      'homescreen': (context) => Homescreen(),
      'usermain': (context) => UserMain(),
     // 'loginwithfacebook': (context) => LoginWithFacebook(),
      






    },
  ));
}


class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if(snapshot.hasError){
          print("Something Went Wrong");
        }
        if (snapshot.connectionState == ConnectionState.
        waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return MaterialApp(
            title: 'Flutter Firebase EMail Password Auth',
            theme: ThemeData(

        ),
        );// ThemeData
      },



    );
  }
}

// class IntializerWidget extends StatefulWidget {
//
//   @override
//   _IntializerWidgetState createState() => _IntializerWidgetState();
// }
//
// class _IntializerWidgetState extends State<IntializerWidget> {
//
//   late FirebaseAuth _auth;
//   late User _user;
//
//
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser!;
//     isLoading = false;
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return isLoading ? Scaffold(
//       body: Center(
//         child: CircularProgressIndicator()
//         ,
//       ),
//
//     ) : _user == null ? Phonelogin() : Homescreen();
//   }
// }

