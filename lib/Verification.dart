import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/ForgetPassword.dart';
import 'package:optimind/Phonelogin.dart';
import 'package:optimind/Welcome.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';


class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);




  @override
  _VerificationState createState() => _VerificationState();



}



class _VerificationState extends State<Verification> {


  bool isHiddenPassword = true;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        print('Backbutton pressed');
        final shouldPop = await Navigator.pushReplacement(context, (MaterialPageRoute(builder:(( context) => Phonelogin()))));

        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of (context).unfocus (),

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

                      Container(

                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 157.0, 0.0),
                        child: Text("Verify Phone",style: TextStyle(fontSize: 24,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851),),),
                      ),

                      SizedBox(height: 10,),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 100, 0.0),
                        child: Text("Code is sent to your Phone no",style: TextStyle(fontSize: 14,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851)),),
                      ),


                      SizedBox(height: 20,),

                      




                      SingleChildScrollView(
                        child: Container(
                          child: OTPTextField(
                            length: 4,
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: 50,
                            style: TextStyle(
                                fontSize: 17
                            ),
                            textFieldAlignment: MainAxisAlignment.spaceEvenly,
                            fieldStyle: FieldStyle.box,
                            // onCompleted: (pin) {
                            //   print("Completed: " + pin);
                            // },
                          ),
                        ),
                      ),


                      TextButton(onPressed: (){

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Phonelogin())));


                      },
                          child: const Text('Didn\'t recieve code ? Request again Enter phone no. ',style: TextStyle(fontFamily: "Gilmer Bold",fontSize: 12.0,color: Color(0xFF3F4553)),)),



                    SizedBox(height: 10,),










                      Container(
                        width: 301.94,
                        height: 48,


                          child: RaisedButton(
                            onPressed: (){
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                            color: Color(0xFF3F4553),


                            child: Text('Verify and Create Account',style: TextStyle(fontSize: 16,fontFamily: 'Gilmer Bold', color: Color(0xFFFFFFFF)),),

                          ),
                        ),
















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
}


