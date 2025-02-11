import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/res/constants/constants.dart';

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back(result: "Select Category");
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Select Category",
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFEFEFEF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:
              List.generate(Constants.caseCategoriesMap.keys.length, (index) {
            String item = Constants.caseCategoriesMap.keys.toList()[index];
            return GestureDetector(
              onTap: () {
                Get.back(result: item);
              },
              child: Column(
                children: [
                  Divider(),
                  ListTile(
                    title: Text(item),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
