import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/models/case_model.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/res/constants/dummy_data.dart';
import 'package:major_project/view/screens/add_case_page.dart';
import 'package:major_project/view/screens/case_details_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    data.sort((a, b) => b['priority'].compareTo(a['priority']));
    super.initState();
  }

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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaseStatusCard(title: 'Ongoing', count: 12),
                SizedBox(
                  width: 10,
                ),
                CaseStatusCard(title: 'In Review', count: 32),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaseStatusCard(title: 'Pending', count: 26),
                SizedBox(
                  width: 10,
                ),
                CaseStatusCard(title: 'Closed', count: 42),
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
              child: const Column(
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
                    '55',
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
            const Text(
              'Top Priority Cases',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(3, (index) {
              return TopCaseCard(
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
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CaseStatusCard extends StatelessWidget {
  final String title;
  final int count;

  const CaseStatusCard({
    super.key,
    required this.title,
    required this.count,
  });

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
              '$count',
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CaseDetailsPage(
              caseDetails: caseDetails,
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
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
