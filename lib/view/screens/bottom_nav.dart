import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/view/screens/add_case_page.dart';
import 'package:major_project/view/screens/cases_list_page.dart';
import 'package:major_project/view/screens/dashboard_page.dart';
import 'package:major_project/view/screens/profile_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> screens = [
    DashboardPage(),
    CaseListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Container(
        color: Color(0xFFEFEFEF),
        child: PageView.builder(
          controller: _pageController,
          itemCount: screens.length,
          onPageChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return IndexedStack(
              index: index,
              children: screens,
            );
          },
        ),
      ),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                Get.to(() => const AddCasePage());
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Center(
                child: Icon(Icons.add),
              ),
            )
          : null,
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          border: Border(
              top: BorderSide(color: Colors.grey, width: 1),
              left: BorderSide(color: Colors.grey, width: 1),
              right: BorderSide(color: Colors.grey, width: 1)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home,
                        color: _currentIndex == 0 ? Colors.black : Colors.grey),
                    Text("Home",
                        style: TextStyle(
                            fontSize: 12,
                            color: _currentIndex == 0
                                ? Colors.black
                                : Colors.grey)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list,
                        color: _currentIndex == 1 ? Colors.black : Colors.grey),
                    Text("Cases",
                        style: TextStyle(
                            fontSize: 12,
                            color: _currentIndex == 1
                                ? Colors.black
                                : Colors.grey)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person,
                        color: _currentIndex == 2 ? Colors.black : Colors.grey),
                    Text("Profile",
                        style: TextStyle(
                            fontSize: 12,
                            color: _currentIndex == 2
                                ? Colors.black
                                : Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
