import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/models/case_model.dart';
import 'package:major_project/res/constants/dummy_data.dart';
import 'package:major_project/view/components/case_status_card.dart';
import 'package:major_project/view/components/custom_input_field.dart';
import 'package:major_project/view/screens/case_filters_page.dart';

class CaseListPage extends StatefulWidget {
  CaseListPage({super.key});

  @override
  State<CaseListPage> createState() => _CaseListPageState();
}

class _CaseListPageState extends State<CaseListPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    data.sort((a, b) => b['priority'].compareTo(a['priority']));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(
          'CASES',
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFEFEFEF),
      ),
      body: Container(
        color: Color(0xFFEFEFEF),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: CustomInputField(
                controller: _searchController,
                hintText: 'Search for a case...',
                prefixIcon: Icons.search,
              )),
              IconButton(
                  onPressed: () {
                    Get.to(() => CaseFiltersPage());
                  },
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    size: 35,
                  ))
            ]),
            const SizedBox(height: 16),
            Divider(
              height: 1,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => CaseCard(
                  caseDetails: CaseModel(
                      id: data[index]['id'],
                      caseId: data[index]['id'],
                      title: data[index]['title'],
                      category: data[index]['type'],
                      uploadDateTime: DateTime.now(),
                      description: data[index]['text'],
                      status: data[index]['status'],
                      priority: data[index]['priority'],
                      judgeId: ''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
