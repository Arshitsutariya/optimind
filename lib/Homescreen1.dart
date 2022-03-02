import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/ForgetPassword.dart';
import 'package:optimind/Verification.dart';
import 'package:optimind/Welcome.dart';

import 'Model/user_model.dart';


class Homescreen1 extends StatefulWidget {
  const Homescreen1({Key? key}) : super(key: key);



  @override
  _Homescreen1State createState() => _Homescreen1State();
}


class _Homescreen1State extends State<Homescreen1> {



  bool isHiddenPassword = true;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        print('Backbutton pressed');
        final shouldPop = await Navigator.pushReplacement(
            context, (MaterialPageRoute(builder: ((context) => Welcome()))));

        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),

        child: Scaffold(
          body: Padding(
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


                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(5, 50, 0, 0),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 50, 0, 0),
                              // child: OutlinedButton.icon(
                              //
                              //   style: OutlinedButton.styleFrom(
                              //     primary: Colors.white,
                              //     backgroundColor: Colors.white,
                              //     onSurface: Colors.black,
                              //     side: BorderSide(color: Colors.black12, width: 0),
                              //     elevation: 3,
                              //     shadowColor: Colors.black,
                              //     shape: CircleBorder(),
                              //   ),
                              //   onPressed:() {
                              //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Welcome())));
                              //
                              //   },
                              //   icon: Padding(
                              //     padding: const EdgeInsets.fromLTRB(5.5, 0, 0, 0),
                              //     child: Icon(Icons.arrow_back,color: Color(0xFF3F414E),),
                              //   ),
                              //   label: Text(''),
                              // ),
                            ),
                            // child: Padding(
                            // padding: const EdgeInsets.fromLTRB(139.25, 166.49, 81.33, 51.55),
                            // child: Image.asset("assets/Group1.png"),
                            // ),
                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(130, 120, 55, 55),
                                  child: Container(child: Image.asset("assets/Group1.png"),height: 137.6,width: 157.42,),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),


                      SizedBox(height: 15,),

                      SingleChildScrollView(
                        child: Container(

                          padding: const EdgeInsets.fromLTRB(
                              0.0, 0.0, 0.0, 0.0),
                          child: Text("Welcome Back", style: TextStyle(
                            fontSize: 28,
                            fontFamily: "Gilmer Bold",
                            color: Color(0xFF0F2851),),),
                        ),
                      ),

                      SizedBox(height: 150,),




                      Container(
                        width: 301.94,
                        height: 48,



                          child: RaisedButton.icon(
                            onPressed: () {

                              Navigator.of(context).push(MaterialPageRoute(builder:(( context) => Welcome())));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),

                            color: Color(0xFF3F4553),
                            icon:
                            Icon(
                              Icons.logout, color: Colors.white,),

                            label: Text('Logout  ', style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Gilmer Bold',
                                color: Color(0xFFFFFFFF)),),

                          ),
                        ),



                      SizedBox(height: 1,),


                    ],

                  ),
                ),
              )


          ),
        ),


      ),

    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }


  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => Emaillogin())));
  }

}
