import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/Phonelogin.dart';
import 'package:optimind/SignUp.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


    body:Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,

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
                    child: Image.asset("assets/Group1.png"),
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

                      onPressed: (){},
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

                      onPressed: (){},
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
    );
  }
}
