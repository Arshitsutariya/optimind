import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/ForgetPassword.dart';
import 'package:optimind/Homescreen.dart';
import 'package:optimind/Homescreen1.dart';
import 'package:optimind/Verification.dart';
import 'package:optimind/Welcome.dart';
import 'package:optimind/user%201/usermain1.dart';
import 'package:optimind/user/user_main.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'Model/user_model.dart';




enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}


class Phonelogin extends StatefulWidget {
  const Phonelogin({Key? key}) : super(key: key);
  @override
  _PhoneloginState createState() => _PhoneloginState();
}
class _PhoneloginState extends State<Phonelogin> {



  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;


   String ?verificationId;

   bool showLoading = false;

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential)async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      print('checking $authCredential');


      setState(() {
        showLoading = false;
      });


      if(authCredential.user != null){
        Navigator.of(context).push(MaterialPageRoute(builder:(( context) => UserMain1())));
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.code.runtimeType);


      setState(() {
          showLoading = false;
      });

      _scaffoldKey.currentState!.showSnackBar(SnackBar(content:(e.code.toString()=='invalid-verification-code')? Text('Invalid OTP'):Text(e.message!)
      ));
    }
    
  }



  getMobileFromWidget(context){

    return SingleChildScrollView(
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
                            child: OutlinedButton.icon(

                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.white,
                                onSurface: Colors.black,
                                side: BorderSide(color: Colors.black12, width: 0),
                                elevation: 3,
                                shadowColor: Colors.black,
                                shape: CircleBorder(),
                              ),
                              onPressed:() {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Welcome())));

                              },
                              icon: Padding(
                                padding: const EdgeInsets.fromLTRB(5.5, 0, 0, 0),
                                child: Icon(Icons.arrow_back,color: Color(0xFF3F414E),),
                              ),
                              label: Text(''),
                            ),
                          ),
                          // child: Padding(
                          // padding: const EdgeInsets.fromLTRB(139.25, 166.49, 81.33, 51.55),
                          // child: Image.asset("assets/Group1.png"),
                          // ),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.fromLTRB(130, 75, 55, 55),
                                child: Container(child: Image.asset("assets/Group1.png"),height: 137.6,width: 157.42,),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),














                    SizedBox(height: 15 ,),

                    Padding(

                      padding: const EdgeInsets.fromLTRB(32.0, 0.0, 80.0, 0.0),
                      child: Text("Continue with Phone",style: TextStyle(fontSize: 24,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851),),),
                    ),


                    SizedBox(height: 15,),



                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 0.0, 88, 0.0),
                      child: Text("Enter Your Current Phone Number.",style: TextStyle(fontSize: 14,fontFamily: "Gilmer Medium", color: Color(0xFF0F2851)),),
                    ),




                    SizedBox(height: 20,),




                    SingleChildScrollView(
                      child: Container(
                        width: 301.94,
                        height: 68,
                        child: TextField(
                          maxLength: 10,
                          keyboardType: TextInputType.number,

                          controller: phoneController,
                          decoration: InputDecoration(
                              enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFC3C1C1)),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(),
                              labelText: 'Enter your Phone no.',
                              labelStyle: TextStyle(fontFamily: 'Gilmer Medium', fontSize: 14.0, color: Color(0xFF6f7d93))
                          ),

                        ),
                      ),
                    ),




                    SizedBox(height: 20,),




                    Container(
                      width: 301.94,
                      height: 48,

                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: RaisedButton.icon(
                          onPressed: ()   async{

                            setState(() {
                              showLoading = true;
                            });

                          await _auth.verifyPhoneNumber(

                                phoneNumber: '+91${phoneController.text}'.toString(),
                                verificationCompleted: (phoneAuthCredential) async{

                                 setState(() {
                                   showLoading = false;
                                 });
                              //  signInWithPhoneAuthCredential(phoneAuthCredential)
                                },


                                verificationFailed: (verificationFailed) async{
                                  setState(() {
                                    showLoading = false;
                                  });

                                  _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(verificationFailed.message!)));

                                },


                                codeSent: (verificationId,resendingToken) async{
                                  setState(() {
                                    showLoading = false;
                                    currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                                    this.verificationId = verificationId;
                                  });


                                },



                                codeAutoRetrievalTimeout: (verificationId,) async{

                                }
                            );



                            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Verification())));
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                          color: Color(0xFF3F4553),
                          icon:
                          Icon(
                            Icons.arrow_back, color: Colors.white,),

                          label: Text('SEND  ',style: TextStyle(fontSize: 16,fontFamily: 'Gilmer Bold', color: Color(0xFFFFFFFF)),),

                        ),
                      ),
                    ),

                  ],
      ),
    );
  }

  getOtpFormWidget(context){
    return SingleChildScrollView(
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
                  child: OutlinedButton.icon(

                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.white,
                      onSurface: Colors.black,
                      side: BorderSide(color: Colors.black12, width: 0),
                      elevation: 3,
                      shadowColor: Colors.black,
                      shape: CircleBorder(),
                    ),
                    onPressed:() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Phonelogin())));

                    },
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(5.5, 0, 0, 0),
                      child: Icon(Icons.arrow_back,color: Color(0xFF3F414E),),
                    ),
                    label: Text(''),
                  ),
                ),
                // child: Padding(
                // padding: const EdgeInsets.fromLTRB(139.25, 166.49, 81.33, 51.55),
                // child: Image.asset("assets/Group1.png"),
                // ),
                Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(130, 75, 55, 55),
                      child: Container(child: Image.asset("assets/Group1.png"),height: 137.6,width: 157.42,),
                    ),

                  ],
                )
              ],
            ),
          ),














          SizedBox(height: 15 ,),

          Padding(

            padding: const EdgeInsets.fromLTRB(32.0, 0.0, 80.0, 0.0),
            child: Text("Continue with Phone",style: TextStyle(fontSize: 24,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851),),),
          ),


          SizedBox(height: 15,),



          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0.0, 10, 0.0),
            child: Text("You will receive 6 digit code for phone number verification.",style: TextStyle(fontSize: 14,fontFamily: "Gilmer Medium", color: Color(0xFF0F2851)),),
          ),




          SizedBox(height: 20,),




          SingleChildScrollView(
            child: Container(
              width: 301.94,
              height: 68,
              child: TextField(

                keyboardType: TextInputType.number,
                maxLength: 6,

                controller: otpController,
                decoration: InputDecoration(
                    enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC3C1C1)),
                        borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your OTP',
                    labelStyle: TextStyle(fontFamily: 'Gilmer Medium', fontSize: 14.0, color: Color(0xFF6f7d93))
                ),
              ),
            ),
          ),




          SizedBox(height: 20,),




          Container(
            width: 301.94,
            height: 48,

            child: Directionality(
              textDirection: TextDirection.rtl,
              child: RaisedButton.icon(
                onPressed: () async{

                  PhoneAuthCredential phoneAuthCredential =  PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: otpController.text);

                  signInWithPhoneAuthCredential(phoneAuthCredential);
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Verification())));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                color: Color(0xFF3F4553),
                icon:
                Icon(
                  Icons.arrow_back, color: Colors.white,),

                label: Text('Verify  ',style: TextStyle(fontSize: 16,fontFamily: 'Gilmer Bold', color: Color(0xFFFFFFFF)),),

              ),
            ),
          ),

        ],
      ),
    );





  }


final GlobalKey<ScaffoldState>  _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        print('Backbutton pressed');
        final shouldPop = await Navigator.pushReplacement(context, (MaterialPageRoute(builder:(( context) => Welcome()))));

        return true;
      },




      child: GestureDetector(
        onTap: () => FocusScope.of (context).unfocus (),





        child: Scaffold(
          key: _scaffoldKey,
          body:  Container(
             child: showLoading ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6E700A)),),) : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
              ? getMobileFromWidget(context)
              : getOtpFormWidget(context)

          )
        ),
      ),
    );
  }
}



