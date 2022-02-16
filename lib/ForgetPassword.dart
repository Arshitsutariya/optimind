import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/SignUp.dart';
import 'package:optimind/Welcome.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);




  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();



}

class _ForgetPasswordState extends State<ForgetPassword> {






  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        print('Backbutton pressed');
        final shouldPop = await Navigator.pushReplacement(context, (MaterialPageRoute(builder:(( context) => Emaillogin()))));

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
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Emaillogin())));

                                },
                                icon: Padding(
                                  padding: const EdgeInsets.fromLTRB(5.5, 0, 0, 0),
                                  child: Icon(Icons.arrow_back,color: Color(0xFF3F414E),),
                                ),
                                label: Text(''),
                              ),
                            ),

                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(150, 67, 81.33, 51.55),
                                  child: Image.asset("assets/Group1.png"),
                                ),
                              ],
                            )
                          ]
                        ),
                      ),














                      SizedBox(height: 39.98,),

                      Container(

                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 130.0, 0.0),
                        child: Text("Forgot Password",style: TextStyle(fontSize: 24,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851),),),
                      ),



                      SizedBox(height: 26.98,),



                      SingleChildScrollView(
                        child: Container(
                          width: 301.94,
                          height: 48,
                          child: TextField(

                            decoration: InputDecoration(
                                enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFC3C1C1)),
                                    borderRadius: BorderRadius.circular(12)),



                                border: OutlineInputBorder(),
                                labelText: 'Enter your email',
                                hintText: 'Enter valid mail id Ex: abc@gmail.com',
                                hintStyle: TextStyle(fontFamily: 'Gilmer Medium', fontSize: 14.0, color: Color(0xFF6f7d93)),
                                labelStyle: TextStyle(fontFamily: 'Gilmer Medium', fontSize: 14.0, color: Color(0xFF6f7d93))
                            ),
                          ),
                        ),
                      ),





                      SizedBox(height:20,),


                      Container(
                          width: 301.94,
                          height: 48,
                          child: RaisedButton( onPressed: (){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Text('Submit',style: TextStyle(fontSize: 16,fontFamily: 'Gilmer Bold', color: Color(0xFFFFFFFF)),),
                            color: Color(0xFF3F4553),
                          )

                      ),


                      SizedBox(height: 10),

                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Emaillogin())));

                      },
                          child: const Text('Back To Login',style: TextStyle(fontFamily: "Gilmer Bold",fontSize: 16.0,color: Color(0xFF3F4553)),))









                    ],

                  ),
                ),
              )


          ),
        ),



      ),

    );

  }

}


