import 'package:flutter/material.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/res/constants/dummy_data.dart';
import 'package:major_project/view/components/case_status_caard.dart';

class CaseStatusPage extends StatefulWidget {
  const CaseStatusPage({super.key});

  @override
  State<CaseStatusPage> createState() => _CaseStatusPageState();
}

class _CaseStatusPageState extends State<CaseStatusPage> {
  @override
  void initState() {
    data.sort((a, b) => b['priority'].compareTo(a['priority']));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: CaseCard(
              title: data[index]['title'],
              type: data[index]['type'],
              caseId: data[index]['id'],
              status: data[index]['status'],
              rating: double.parse(
                  ((data[index]['priority'] / 21) * 100).toStringAsFixed(2)),
              statusColor: Constants.statusColorMap[data[index]['status']]!,
            ),
          );
        },
      ),
    );
  }
}
