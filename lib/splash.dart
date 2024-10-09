
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:major_project/main.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
   
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    
    super.initState();

    Timer(Duration(seconds: 2),(){
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MyHomePage(title: 'Case Management system',)  ));
    
    });
  }

@override

Widget build(BuildContext context){
  return Scaffold(

  body: Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
    color: Colors.black,

     child: Center(
        child: Image.asset('assets/images/logo.jpg'),
     )

  )



);

 }
}
