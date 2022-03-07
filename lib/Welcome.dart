import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/Facebookhome.dart';
import 'package:optimind/Googlesignin.dart';
import 'package:optimind/Phonelogin.dart';
import 'package:optimind/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:optimind/user/user_main.dart';
import 'package:provider/provider.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();


}



Future main() async {
  WidgetsFlutterBinding.ensureInitialized ();
  await Firebase.initializeApp();
  runApp (Welcome());
}


class _WelcomeState extends State<Welcome> {

  Map? _userData ;
  @override
  Widget build(BuildContext context) {


    // var width = MediaQuery.of(context).size.width;
    // var height =
    //     MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    Future<bool> onWillPop() async {
      final shouldPop = await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(

              title: Text(
                'Are You Sure Exit?',
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


    body:Padding(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Container(
          // height: double.infinity,
          // width: double.infinity,

              child: Column(
                children: [
                  Container(

                    height: 369.6,
                  width: double.infinity,


                  decoration: BoxDecoration(

                      image: DecorationImage(
                        image: AssetImage('assets/Mask1.png'),
                        fit: BoxFit.fill,
                      ),
                  ),

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(139.25, 166.49, 81.33, 51.55),
                      child: Container(child: Image.asset("assets/Group1.png")),
                    ),
                  ),

                  SizedBox(height: 36.04,),

                  Text('Welcome to Optimind', style: TextStyle(fontSize:18.0, fontFamily: "Gilmer Bold", color: Color(0xFF3F4553)),),


                  SizedBox(height: 12.55,),

                  Text('Continue with',style: TextStyle(fontSize:16,fontFamily: 'Gilmer Medium', color: Color(0xFF3F4553) ),),



                  SizedBox(height: 27.53,),



                  Container(

                    width: 284,
                    height: 48,

                    child: OutlineButton.icon(
                      padding: EdgeInsets.fromLTRB(.0,0.0,70.0,0.0),


                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),


                        onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Emaillogin())));
                        },
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                          child: Icon(Icons.mail),

                        ),
                        label:Text('Log in with Email',style: TextStyle(fontSize: 14, fontFamily: 'Gilmer Medium',color: Color(0xFF0F2851)),
                        ),

                    ),
                  ),



                  SizedBox(height: 15.0,),



                  Container(
                    width: 284,
                    height: 48,

                    child: OutlineButton.icon(
                        padding: EdgeInsets.fromLTRB(.0,0.0,70.0,0.0),


                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        color: Color(0xFF0F2851),
                        onPressed: (){

                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Phonelogin())));

                        },
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                          child: Icon(Icons.phone_android),
                        ),
                        label:Text('Log in with Phone',style: TextStyle(fontSize: 14, fontFamily: 'Gilmer Medium',color: Color(0xFF0F2851)),)
                    ),
                  ),



                  SizedBox(height: 15,),



                  Container(
                    width: 284,
                    height: 48,

                    child: OutlineButton.icon(
                        padding: EdgeInsets.fromLTRB(.0,0.0,50.0,0.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                        onPressed: (){
                          facebook();
                        },
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                          child: Icon(Icons.facebook_rounded),
                        ),
                        label:Text('Log in with Facebook',style: TextStyle(fontSize: 14, fontFamily: 'Gilmer Medium',color: Color(0xFF0F2851)),)
                    ),
                  ),

                  SizedBox(height: 15,),


                  Container(

                    width: 284,
                    height: 48,

                    child: OutlineButton.icon(
                        padding: EdgeInsets.fromLTRB(0.0,0.0,65.0,0.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12) ),

                        onPressed: (){







                          signup(context);







                        },
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                          child: Icon(MdiIcons.google,size: 20,),
                        ),
                        label:Text('Log in with Google',style: TextStyle(fontSize: 14, fontFamily: 'Gilmer Medium',color: Color(0xFF0F2851)),)

                    ),
                  ),

                  SizedBox(height: 5.0,),

                  TextButton(onPressed: (){

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => SignUp())));


                  },
                      child: const Text('Don’t have account ?    Sign up',style: TextStyle(fontFamily: "Gilmer Bold",fontSize: 16.0,color: Color(0xFF3F4553)),))







          ],
        ),
    ),
      ),
    ),
    ));
  }

  facebook() async {
    try {
      final result = await FacebookAuth.i.login(permissions: [
        "public_profile",
        "email",
        "user_birthday",
        "user_gender",
        "user_photos",
        "user_friends"
      ]);
      if (result.status == LoginStatus.success) {

        final requestData = await FacebookAuth.i
            .getUserData(fields: "email,name,picture,gender,birthday,friends");
        print('request $requestData');

        final facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

        final dattaa = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        setState(() {
         _userData = requestData;


          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => FaceBookHome(
                    data: _userData,
                  )));
        });
      } else {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(0xFF0F2851),
            content: Text("Result Failed",
              style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white))));
      }
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF0F2851),
          content: Text("Error",
          style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white))));
    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(e.code,
              style: TextStyle(fontSize: 18, color: Colors.black))));
    }
  }





  Future<void> signup(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        var auth = FirebaseAuth.instance;
        UserCredential result = await auth.signInWithCredential(authCredential);
        User? user = result.user;
        print('user deatils ${user}');

        if (result != null) {

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => UserMain()));
        }
      } else {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(0xFF0F2851),
            content: Text('something went wrong',
                style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white))));
        print('else is printing');
      }
    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF0F2851),
          content: Text(e.code,
              style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white))));
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF0F2851),
          content: Text('${e}',
              style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white))));
    }
  }
}
//
// class _userData {
// }

