import 'package:flutter/material.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Profile',style: TextStyle(fontWeight: FontWeight.w900),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Information Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 159, 193, 243),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/avatar.png'), // Replace with your asset
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Jay Ghodvinde',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'jayghodvinde@gmail.com',
                          style: TextStyle(color: Color.fromARGB(255, 106, 106, 106)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
             
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'We are a team dedicated to providing the best case management solutions. Our mission is to streamline legal processes and enhance productivity.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              // Contact Us Section
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.email, color: Color.fromARGB(255, 159, 193, 243)),
                        SizedBox(width: 8),
                        Text('majorproject@exmple.com'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(Icons.phone, color: Color.fromARGB(255, 159, 193, 243)),
                        SizedBox(width: 8),
                        Text('+91 99205 91904'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Color.fromARGB(255, 159, 193, 243)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text('302, shivshakti apt.,hansnagar,khopat,thane.400601. '),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Additional Actions (Optional)
              ElevatedButton(
                onPressed: () {
                  // Action for editing profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Text('Edit Profile',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
