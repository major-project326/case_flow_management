import 'package:flutter/material.dart';
import 'package:major_project/view/screens/bottom_nav_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Case Management system"),
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
                      color: Color.fromARGB(255, 252, 140, 178)),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'Email Id',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'Identity card number',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: const InputDecoration(
                          labelText: 'OTP',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 200, 200, 200)),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 210, 210, 210),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 16),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text(
                          'RegisterPage',
                          style: TextStyle(color: Colors.black),
                        ),
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
