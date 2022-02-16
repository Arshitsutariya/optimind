

import 'package:flutter/material.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/ForgetPassword.dart';
import 'package:optimind/Phonelogin.dart';
import 'package:optimind/SignUp.dart';
import 'package:optimind/Splash.dart';
import 'package:optimind/Verification.dart';
import 'package:optimind/Welcome.dart';

void main() => runApp( MaterialApp(

   initialRoute: 'splash',

routes: {

  'splash': (context) =>  Splash(),
  'welcome': (context) => Welcome(),
  'emaillogin': (context) => Emaillogin(),
  'signup': (context) => SignUp(),
  'forgetpassword': (context) => ForgetPassword(),
  'phonelogin': (context) => Phonelogin(),
  'verification': (context) => Verification()




},
));












