import 'package:flutter/material.dart';
import 'package:major_project/home.dart';
import 'package:major_project/list.dart';
import 'package:major_project/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Case Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 254, 109, 140)),
      ),
      debugShowCheckedModeBanner: false,
      home: First(title: 'Case Management System'),
    );
  }
}

class First extends StatefulWidget {
  const First({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<First> {
  int myIndex = 0;
  List<Widget> body = [Homepage(), CaseStatusPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 27, 27, 27),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
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
