import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/models/case_model.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/view/screens/case_details_page.dart';

class CaseCard extends StatelessWidget {
  final CaseModel caseDetails;

  const CaseCard({super.key, required this.caseDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(() => CaseDetailsPage(
                caseDetails: caseDetails,
              ));
        },
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caseDetails.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Case Type: ${caseDetails.category}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Priority: ${caseDetails.priority.toString()} %',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Constants.statusColorMap[caseDetails.status]!
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        caseDetails.status,
                        style: TextStyle(
                            color: Constants.statusColorMap[caseDetails.status],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  caseDetails.caseId,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
