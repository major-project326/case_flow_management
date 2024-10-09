import 'package:flutter/material.dart';
import 'package:major_project/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 254, 109, 140)),
      ),
      home: const Register(title: 'Flutter Demo Home Page'),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key, required this.title});

  final String title;

  @override
  State<Register> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 27, 27, 27), 
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
          //      const Image(
           //       image: AssetImage('assets/images/scale.png'),height: 150, ),
                const SizedBox(height: 20),
                const Text(
                  'CASE MANAGEMENT SYSTEM',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 252, 140, 178)
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                         style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                         style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'Email Id',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'Identity card number',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'OTP',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => First(title: 'Case Management System',) ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 210, 210, 210),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ), 
                        ),
                        child: const Text('REGISTER',style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
