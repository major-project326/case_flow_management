import 'package:flutter/material.dart';
import 'package:major_project/view/screens/old/bottom_nav_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Case Management system",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //   Image.asset('assets/images/logo1.png'),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  'CASE MANAGEMENT SYSTEM',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 252, 140, 178),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  decoration: const InputDecoration(
                    labelText: 'Email or Phone number',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  decoration: const InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  decoration: const InputDecoration(
                    labelText: 'OTP',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              ),

              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 210, 210, 210),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
