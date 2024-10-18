// import 'package:flutter/material.dart';
// import 'package:major_project/first.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Case Management System',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 254, 109, 140)),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Login1(title: 'Case Management System'),
//     );
//   }
// }

// class Login1 extends StatefulWidget {
//   const Login1({super.key, required this.title});

//   final String title;

//   @override
//   _Login1State createState() => _Login1State();
// }

// class _Login1State extends State<Login1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title,style: TextStyle(color: Colors.white),),
//          backgroundColor: Colors.transparent,
//       ),backgroundColor:   Color.fromARGB(255, 27, 27, 27),
//       body:  Center(
//         child: SingleChildScrollView(
//           child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//            //   Image.asset('assets/images/logo1.png'),
//               Padding(
//                 padding: const EdgeInsets.only(top: 0),
//                 child: Text(
//                     'CASE MANAGEMENT SYSTEM',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: const Color.fromARGB(255, 252, 140, 178),

//                     ),
//                   ),
//               ),

//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),

//                  child:  TextField(
//                   style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
//                       decoration: const InputDecoration(
//                         labelText: 'Email or Phone number',
//                         labelStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),

//                       ),
//                   ),
//               ),

//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: TextField(
//                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
//                       decoration: const InputDecoration(
//                         labelText: 'PASSWORD',
//                         labelStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),

//                     ),
//                   obscureText: true,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child:TextField(
//                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
//                       decoration: const InputDecoration(
//                         labelText: 'OTP',
//                         labelStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
//                       ),
//                       keyboardType: TextInputType.numberWithOptions(),
//                 ),
//               ),

//               SizedBox(height: 40),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => First(title: 'Case Management System',) ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 210, 210, 210),
//                     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                     textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: Text('LOGIN',style: TextStyle(color: Colors.black),),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:major_project/first.dart';
import 'package:major_project/otp.dart';

class Login1 extends StatefulWidget {
  const Login1({
    super.key,
    required String title,
  }); //required this.title

  // final String title;

  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  sendcode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + phonenumber.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error Occured', e.code);
        },
        codeSent: (String vid, int? token) {
          Get.to(
            OtpPage(
              vid: vid,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String vid) {},
      );
    } on FirebaseAuthException catch (e) {
      print('Error Occurred: ${e.code}');
    } catch (e) {
      print('Error Occurred: $e');
    }
  }
  // void _login() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //     if (userCredential.user != null) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => First(title: 'Case Management System')),
  //       );
  //     }
  //   } catch (e) {
  //     print('Login failed: $e');
  //     // Show a login failure message here
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset('assets/images/logo.jpg'),
          Center(child: Text("Your Phone !")),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
              child: Text(
                  "we will send you an one time password on this mobile number")),
          SizedBox(
            height: 20,
          ),
          phonetext(phonenumber),
          SizedBox(
            height: 50,
          ),
          button(),
        ],
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title, style: TextStyle(color: Colors.white)),
  //       backgroundColor: Colors.transparent,
  //     ),
  //     backgroundColor: Color.fromARGB(255, 27, 27, 27),
  //     body: Center(
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             const Text(
  //               'CASE MANAGEMENT SYSTEM',
  //               style: TextStyle(
  //                 fontSize: 25,
  //                 fontWeight: FontWeight.bold,
  //                 color: const Color.fromARGB(255, 252, 140, 178),
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 20),
  //               child: TextField(
  //                 controller: emailController,
  //                 style: const TextStyle(color: Colors.white),
  //                 decoration: const InputDecoration(
  //                   labelText: 'Email',
  //                   labelStyle:
  //                       TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 20),
  //               child: TextField(
  //                 controller: passwordController,
  //                 obscureText: true,
  //                 style: const TextStyle(color: Colors.white),
  //                 decoration: const InputDecoration(
  //                   labelText: 'Password',
  //                   labelStyle:
  //                       TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 40),
  //             ElevatedButton(
  //               onPressed: _login,
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: const Color.fromARGB(255, 210, 210, 210),
  //                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  //                 textStyle:
  //                     TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //               ),
  //               child:
  //                   const Text('LOGIN', style: TextStyle(color: Colors.black)),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget phonetext(TextEditingController phonenumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: phonenumber,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefix: Text('+91'),
          icon: Icon(Icons.phone),
          labelText: 'Enter Phone Number',
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget button() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          sendcode();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(90, 208, 248, 1.0),
          padding: const EdgeInsets.all(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            'Receive OTP',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), // TextStyle
          ), // Text
        ), // Padding
      ), // ElevatedButton
    ); // Center
  }
}
