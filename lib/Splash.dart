import 'package:flutter/material.dart';
import 'package:optimind/Welcome.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


@override
  void initState() {

    super.initState();
    _navigatetohome();
  }


  _navigatetohome()async{
     await Future.delayed(Duration(milliseconds: 3500),  (){});
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(



      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage('assets/Mask Group.png'),
                fit: BoxFit.fill,
              )
          ),


            child: Column(

              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.start,


              children: [
                 SizedBox(height: 98 ),
                
                Image.asset("assets/Group.png"),


                SizedBox(height:13.04),

                TextButton(
                    onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Welcome())));
                  },
                    child: Text('Optimind',style: TextStyle(fontSize: 48, fontFamily: 'GrandHotel', color: Color(0xFF3F4553)),))


                

              ],
            ),
          ),

        ),





    );
  }
}
