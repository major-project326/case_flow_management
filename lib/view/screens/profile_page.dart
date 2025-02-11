import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/view/screens/about_page.dart';
import 'package:major_project/view/screens/login_page.dart';
import 'package:major_project/services/firebase_auth_services.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final AuthService _authService = AuthService(); // Create an instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFEFEFEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(162, 159, 193, 243),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rohit Uday Baing',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '9920591904',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Thane',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Icons.badge),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '1872-9328-8763',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Get.to(AboutPage());
              },
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "About Us",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await _authService.signOut(); // Call sign-out function
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()), // Navigate to login
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Signed out successfully")),
                );
              },
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.logout, color: Colors.red),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
