import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/view/screens/bottom_nav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final CasesController casesController = Get.put(CasesController());
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async {
      await casesController.getCaseSummary();
      await casesController.getTop3Cases();
      Get.off(() => BottomNavPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Center(
        child: Text(
          'Case Flow App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
