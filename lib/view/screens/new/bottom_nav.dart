import 'package:flutter/material.dart';
import 'package:major_project/view/screens/new/cases.dart';
import 'package:major_project/view/screens/new/dashboard.dart';
import 'package:major_project/view/screens/new/profile.dart';


class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int myIndex = 0;
  List<Widget> body = [Dashboard(), CaseList(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Case Management',
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 26),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      body: body[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        iconSize: 30,
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: myIndex == 0
                  ? Color.fromARGB(255, 224, 139, 157)
                  : Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: myIndex == 1
                  ? Color.fromARGB(255, 224, 139, 157)
                  : Colors.white,
            ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: myIndex == 2
                  ? Color.fromARGB(255, 224, 139, 157)
                  : Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
