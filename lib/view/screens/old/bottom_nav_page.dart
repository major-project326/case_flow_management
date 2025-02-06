import 'package:flutter/material.dart';
import 'package:major_project/view/screens/old/case_status_page.dart';
import 'package:major_project/view/screens/old/home_page.dart';
import 'package:major_project/view/screens/old/profile_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int myIndex = 0;
  List<Widget> body = [Homepage(), CaseStatusPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 27, 27, 27),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Case Management system",
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
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
