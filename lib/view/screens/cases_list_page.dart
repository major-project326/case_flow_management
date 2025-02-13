import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/view/components/case_status_card.dart';
import 'package:major_project/view/components/custom_input_field.dart';
import 'package:major_project/view/screens/case_filters_page.dart';

class CaseListPage extends StatefulWidget {
  CaseListPage({super.key});

  @override
  State<CaseListPage> createState() => _CaseListPageState();
}

class _CaseListPageState extends State<CaseListPage> {
  final CasesController casesController = Get.put(CasesController());

  @override
  void initState() {
    casesController.getAllCases();
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
                controller: casesController.searchController,
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
              child: Obx(() {
                if (casesController.isCasesLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else {
                  if (casesController.cases.isEmpty) {
                    return Center(
                      child: Text(
                        'No Cases',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: casesController.cases.length,
                      itemBuilder: (context, index) => CaseCard(
                        caseDetails: casesController.cases[index],
                      ),
                    );
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
