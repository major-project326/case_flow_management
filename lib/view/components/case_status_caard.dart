import 'package:flutter/material.dart';

class CaseCard extends StatelessWidget {
  final String title;
  final String type;
  final String caseId;
  final String status;
  final double rating;
  final Color statusColor;

  const CaseCard({
    super.key,
    required this.title,
    required this.type,
    required this.caseId,
    required this.status,
    required this.rating,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 50, 50, 50),
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(0),
        child: Card(
          color: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Case Type: $type',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Priority: ${rating.toString()} %',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                            color: statusColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  caseId,
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
