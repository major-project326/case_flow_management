import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:major_project/view/screens/bottom_nav.dart';
import 'package:major_project/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _authService = AuthService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController issuedIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false; // Loading state

  void signUp() async {
    setState(() {
      isLoading = true;
    });

    String name = nameController.text.trim();
    String phone = phoneNumController.text.trim();
    String idNumber = issuedIdController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isNotEmpty &&
        phone.isNotEmpty &&
        idNumber.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      User? user = await _authService.signUpWithEmail(
        name: name,
        phone: phone,
        idNumber: idNumber,
        email: email,
        password: password,
      );

      if (user != null) {
        print('Sign Up successful');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavPage()),
        );
      } else {
        print('Sign Up failed');
      }
    } else {
      print('Please fill in all fields');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneNumController,
                keyboardType:
                    TextInputType.number, 
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, 
                  LengthLimitingTextInputFormatter(
                      10), 
                ],
                decoration: const InputDecoration(
                  labelText: 'Phone No',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: issuedIdController,
                decoration: const InputDecoration(
                  labelText: 'Id No',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                 keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: isLoading ? null : signUp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Color.fromARGB(255, 159, 193, 243),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Sign Up',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
