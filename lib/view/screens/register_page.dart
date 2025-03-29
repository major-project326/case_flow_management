import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/view/components/custom_input_field.dart';
import 'package:major_project/view/screens/bottom_nav.dart';
import 'package:major_project/view/screens/login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                CustomInputField(
                  controller: emailController,
                  hintText: "Enter Full Name",
                  labelText: "Full Name",
                ),
                const SizedBox(height: 8),
                CustomInputField(
                  controller: emailController,
                  hintText: "Enter Email",
                  labelText: "Email",
                ),
                const SizedBox(height: 8),
                CustomInputField(
                  controller: emailController,
                  hintText: "Enter Password",
                  labelText: "Password",
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavPage()));
                      String name = nameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      if (name.isNotEmpty &&
                          email.isNotEmpty &&
                          password.isNotEmpty) {
                        print('Sign Up successful');
                      } else {
                        print('Please fill in all fields');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                    ),
                    child: const Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Get.off(() => LoginPage());
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 89, 127, 183),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
