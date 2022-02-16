import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/ForgetPassword.dart';
import 'package:optimind/Verification.dart';
import 'package:optimind/Welcome.dart';


class Phonelogin extends StatefulWidget {
  const Phonelogin({Key? key}) : super(key: key);




  @override
  _PhoneloginState createState() => _PhoneloginState();



}



class _PhoneloginState extends State<Phonelogin> {


  bool isHiddenPassword = true;



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
                                  padding: const EdgeInsets.fromLTRB(150, 67, 81.33, 51.55),
                                  child: Image.asset("assets/Group1.png"),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),














                      SizedBox(height: 15 ,),

                      Container(

                        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 100.0, 0.0),
                        child: Text("Continue with Phone",style: TextStyle(fontSize: 24,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851),),),
                      ),

                      SizedBox(height: 15,),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0.0, 10, 0.0),
                        child: Text("You will receive 4 digit code for phone number verification.",style: TextStyle(fontSize: 14,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851)),),
                      ),


                      SizedBox(height: 20,),



                      SingleChildScrollView(
                        child: Container(
                          width: 301.94,
                          height: 68,
                          child: TextField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,

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
                                onPressed: (){


                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Verification())));
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                                color: Color(0xFF3F4553),
                              icon:
                                Icon(
                                    Icons.arrow_back, color: Colors.white,),

                              label: Text('Continue  ',style: TextStyle(fontSize: 16,fontFamily: 'Gilmer Bold', color: Color(0xFFFFFFFF)),),

                                ),
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
}


