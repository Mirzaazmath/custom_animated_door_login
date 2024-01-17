import 'dart:math';
import 'package:animated_switch_login/components/wave_clipper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/triangle_clipper.dart';
import '../widgets/feild.dart';
import '../widgets/login_door_widget.dart';
import '../widgets/signin_door_widget.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  // animation controller to  controller the door  animation of login container
  late final AnimationController loginController=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
  // animation controller to  controller door  the animation of Sign Up container
  late final AnimationController signUpController2=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
  // animation controller to  controller flip  the animation of Text
  late final AnimationController textController=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
// bool to check condition
  bool isLogin=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUpController2.forward();
  }


  @override
  // dispose every controller to prevent memory leak
  void dispose() {
    loginController.dispose();
    signUpController2.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const   Color(0xffEDE9FE),
      body: Column(

        children: [
         const  Spacer(),
         /////////////********* Greeting ******************///////////////
         const   Text("Welcome!",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
          const Spacer(),
          Stack(
            children: [
              /////////////********* Login Animation builder ******************///////////////
              AnimatedBuilder(
                animation: loginController,
               builder: (_, child) {
                 return Transform(
                   transform: Matrix4.identity()
                     ..setEntry(3, 2, 0.001)
                     ..rotateY(loginController.value*2),
                   alignment: Alignment.centerLeft,
                   child: const LoginDoorWidget()
                 );
               }),
              /////////////********* SignUP Animation builder ******************///////////////
              Align(alignment: Alignment.centerRight,
                child: AnimatedBuilder(
                    animation: signUpController2,
                  builder: (_,child) {
                    return Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-(signUpController2.value*2)),
                      child: const SignInDoorWidget(),
                    );
                  }
                ),
              ),
              /////////////********* Form Section ******************///////////////
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      /////////////********* Sliding Arrow Section ******************///////////////
                      child: AnimatedAlign(
                        alignment:isLogin? Alignment.topLeft: Alignment.topRight,
                        duration:const  Duration(milliseconds: 200),
                        child: ClipPath(
                          // Triangle Clipper Class
                          clipper: MyClipper(),
                          child: Container(
                            height: 40,
                            width: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    /////////////********* Stack For Form ******************///////////////
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        /////////////********* Input Fields Section ******************///////////////
                        Column(
                          children: [
                            Container(
                              height: 250,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow:const  [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset:  Offset(1,1),
                                    blurRadius: 5
                                  ),

                                ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),

                              child: Column(
                                children: [
                                  Container(
                                    padding:const  EdgeInsets.all(15),
                                    child: const Column(
                                      children: [
                                          SizedBox(height: 10,),
                                           Field(hintText: 'Email',icon: Icons.mail,),
                                           SizedBox(height: 10,),
                                           Field(hintText: 'Password',icon: Icons.key,),
                                           SizedBox(height: 10,),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("Forgot password?"),
                                        )
                                      ],
                                    ),
                                  ),
                                 const  Spacer(),
                                  /////////////********* Wave Section  ******************///////////////
                                  RotatedBox(
                                    quarterTurns: 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: ClipPath(
                                        clipper: BezierClipper(),
                                        child: Container(
                                          height: 70,
                                          width: double.infinity,
                                         decoration:const  BoxDecoration(
                                           gradient: LinearGradient(
                                               begin: Alignment.topCenter,
                                               end:Alignment.bottomCenter,
                                               colors:  [
                                                 Color(0xff59a0fd),
                                                 Color(0xffe65d9d)
                                               ]),
                                         ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                           const  SizedBox(height: 25,),
                          ],
                        ),
                        /////////////********* Login Btn Section ******************///////////////
                        Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient:const  LinearGradient(
                                begin: Alignment.centerLeft,
                                end:Alignment.centerRight,
                                colors:  [
                                  Colors.blue,
                                  Colors.cyanAccent
                                ]),),
                          alignment: Alignment.center,
                          child: AnimatedBuilder(
                              animation: textController,
                              builder: (BuildContext context, Widget? child) {
                                return Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()..setEntry(3,2, 0.001)..rotateY((textController.value<0.5)?pi*textController.value:(pi*(1+textController.value))),
                                  child: (textController.value<0.5)?const Text( "Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),):const Text( "Sign-Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                );}
                          ),
                          //Text(isLogin? "Login":"Sign-Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        ),
                      ],
                    ),

                  ],
                ),

              ),
            ],
          ),
          const  SizedBox(height: 80,),
          /////////////********* Confirmation Section  ******************///////////////
          RichText(
            text: TextSpan(
                text:isLogin? "Don't have an account? ": "Already have account?  ",
                style:const  TextStyle(color: Colors.grey,fontSize: 17),
                children: [
              TextSpan(
                text: isLogin?'SIGN UP':"LOG IN",
                  style:const  TextStyle(color: Colors.purpleAccent,fontSize: 17,fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = (){
                  setState(() {

                    if(isLogin){
                      loginController.forward();
                      signUpController2.reverse();
                      textController.forward();
                    }else{
                      loginController.reverse();
                      signUpController2.forward();
                      textController.reverse();
                    }

                    isLogin=!isLogin;
                  });
                }),

            ]),
          ),
         const Spacer(),

        ],
      ),

    );
  }
}
