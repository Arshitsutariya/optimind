import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:optimind/Emaillogin.dart';
import 'package:optimind/ForgetPassword.dart';
import 'package:optimind/Homescreen.dart';
import 'package:optimind/Model/user_model.dart';
import 'package:optimind/Welcome.dart';
import 'package:optimind/user/user_main.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);




  @override
  _SignUpState createState() => _SignUpState();

}
class _SignUpState extends State<SignUp> {
  //Our form key
  final _fromkey = GlobalKey<FormState>();


  var firstName = '';
  var secondName = '';
  var email = '';
  var password = '';










  //firebase
  final _auth = FirebaseAuth.instance;


  //editing controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();


  User? user ;
  int count=1;

  final currentUser = FirebaseAuth.instance.currentUser;


   verifyEmail() async {
    print('checking signed ${!user!.emailVerified}');
    print('count is $count');
    print('user $user');
    if (user != null && !user!.emailVerified ) {
      print('again checking');
      //await FirebaseAuth.instance.currentUser.sendEmailVerification();
      await user!.sendEmailVerification();
      print('Verification Email has been sent');
      setState(() {
        count = 0;
      });
      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF0F2851),
          content: Text(
            'Verification Email has been sent Check your Mail and SignIn',
            style: TextStyle(fontSize: 14.0,fontFamily: "Gilmer Medium",color: Colors.white),
          ),
        ),
      );
    }
    return "message";
  }

  @override
  void dispose() {
    firstNameEditingController.dispose();
    secondNameEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  bool isHiddenPassword = true;



  @override
  Widget build(BuildContext context) {



   //Firstnamedfield

    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.text,

      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value)
      {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xFFC3C1C1)),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(),
          labelText: 'Enter your Firstname',

          labelStyle: TextStyle(
              fontFamily: 'Gilmer Medium',
              fontSize: 14.0,
              color: Color(0xFF6f7d93))
      ),
    );

    //Secondnamedfield

    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.text,


      validator: (value) {

        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }

      },
      onSaved: (value)
      {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xFFC3C1C1)),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(),
          labelText: 'Enter your Secondname',

          labelStyle: TextStyle(
              fontFamily: 'Gilmer Medium',
              fontSize: 14.0,
              color: Color(0xFF6f7d93))
      ),
    );

    //Email field

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,

      validator: (value){
        if (value == null ||value.isEmpty)
        {
          return ("Please Enter Your Email");
        }
        //reg expression for email Validation
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z]").hasMatch(value))
        {
          return ("Please Enter Valid Emailaddress");
        }
        return null;
      },
      onSaved: (value)
      {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xFFC3C1C1)),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(),
          labelText: 'Enter your email',
          hintText: 'Enter valid mail id Ex: abc@gmail.com',
          hintStyle: TextStyle(fontFamily: 'Gilmer Medium', fontSize: 14.0, color: Color(0xFF6f7d93)),

          labelStyle: TextStyle(
              fontFamily: 'Gilmer Medium',
              fontSize: 14.0,
              color: Color(0xFF6f7d93))
      ),
    );

    //passwordfield

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,



      validator: (value) {
        RegExp regex = new RegExp(r'^. {6,}$');
        if ( value == null ||value.isEmpty) {
          return ("Password is required for Signup");
        }
        if (regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color(0xFFC3C1C1)),
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(),
        labelText: 'Enter your password',
        hintText: 'Enter a valid Password Ex: Alex@4738 ',
        hintStyle: TextStyle(
            fontFamily: 'Gilmer Medium',
            fontSize: 14.0,
            color: Color(0xFF6f7d93)),
        labelStyle: TextStyle(
            fontFamily: 'Gilmer Medium',
            fontSize: 14.0,
            color: Color(0xFF6f7d93)),
        suffixIcon: InkWell(
          onTap: _togglePasswordView,
          child: Icon(Icons.visibility_off),
        ),
      ),
    );

    // SignUpbutton

    final SignUpButton = RaisedButton(
      onPressed: () async{



       if(_fromkey.currentState!.validate()) {
         setState(() {
           signup(emailEditingController.text.replaceAll(' ', ''), passwordEditingController.text);
         });

         user = await FirebaseAuth.instance.currentUser;
           setState(()  {

           });

         print('before');
          await verifyEmail();
          print('after');

         await Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Emaillogin())));






      }
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Sign Up',
        style: TextStyle(
            fontSize: 16,
            fontFamily: 'Gilmer Bold',
            color: Color(0xFFFFFFFF)),
      ),
      color:  Color(0xFF3F4553),
    );










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

                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 180.0, 0.0),
                        child: Text("Welcome Back,",style: TextStyle(fontSize: 16,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851),),),
                      ),

                      SizedBox(height: 3,),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 220, 0.0),
                        child: Text("Sign Up",style: TextStyle(fontSize: 20,fontFamily: "Gilmer Bold", color: Color(0xFF0F2851)),),
                      ),


                      SizedBox(height: 20,),



                      SingleChildScrollView(
                        child: Container(
                          width: 301.94,
                          // height: 48,

                          child: Form(
                            key: _fromkey,
                            child: Column(
                              children: [
                                SizedBox(child: firstNameField,),
                                SizedBox(height: 12,),
                                SizedBox(child: secondNameField,),
                                SizedBox(height:12,),
                                SizedBox(child: emailField,),
                                SizedBox(height:12,),
                                SizedBox(child: passwordField,),
                                SizedBox(height:12,),
                                SizedBox(child: SignUpButton,height: 60,width: 301.94,)
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 1,),
                      TextButton(onPressed: (){

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Emaillogin())));


                      },
                          child: const Text('Already have an account ?    Log In',style: TextStyle(fontFamily: "Gilmer Bold",fontSize: 16.0,color: Color(0xFF3F4553)),))

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



  signup(String email, String password) async
  {
     if(_fromkey.currentState!.validate());
     {
        await _auth.createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
              postDetailsToFirestore()

        }).catchError((e)
            {

              // Fluttertoast.showToast(msg: e!.message);
            });
     }
  }


  postDetailsToFirestore() async {
    //calling our firestore
    //calling our Usermodel
    //sending these values

    FirebaseFirestore   firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    print('just for check');


    UserModel userModel = UserModel();


    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;





    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
    .set(userModel.toMap());

    // Fluttertoast.showToast(msg: "Account created successfully ");

    //
    // Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Emaillogin()),
    //         (route) => false);






  }




}


