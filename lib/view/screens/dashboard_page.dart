import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/models/case_model.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/view/screens/add_case_page.dart';
import 'package:major_project/view/screens/case_details_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final CasesController casesController = Get.put(CasesController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome Rohit ',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaseStatusCard(title: 'Ongoing'),
                SizedBox(
                  width: 10,
                ),
                CaseStatusCard(title: 'In Review'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaseStatusCard(title: 'Pending'),
                SizedBox(
                  width: 10,
                ),
                CaseStatusCard(title: 'Closed'),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 159, 193, 243),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Color.fromARGB(255, 118, 168, 243),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    casesController.summary['Total']!.toString(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => const AddCasePage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add Case',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
            if (casesController.topCases.isNotEmpty)
              const Text(
                'Top Priority Cases',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 10),
            if (casesController.topCases.isNotEmpty)
              ...List.generate(casesController.topCases.length, (index) {
                return TopCaseCard(
                    caseDetails: casesController.topCases[index]);
              }),
          ],
        ),
      ),
    );
  }
}

class CaseStatusCard extends StatelessWidget {
  final String title;

  CaseStatusCard({
    super.key,
    required this.title,
  });

  final CasesController casesController = Get.put(CasesController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Constants.statusColorMap[title]!.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Constants.statusColorMap[title]!,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              casesController.summary[title]!.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCaseCard extends StatelessWidget {
  final CaseModel caseDetails;

  TopCaseCard({super.key, required this.caseDetails});

  final CasesController casesController = Get.put(CasesController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        casesController.setCurrentCaseDetails(caseDetails);
        Get.to(() => CaseDetailsPage());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
        color: Colors.transparent,
        child: Row(
          children: [
            const Icon(Icons.calendar_today,
                size: 30, color: Color.fromARGB(255, 159, 193, 243)),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caseDetails.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Case Type: ${caseDetails.category}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 94, 94, 94),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 0, 0, 0)),
          ],
        ),
      ),
    );
  }
}
