import 'package:flutter/material.dart';

class CaseStatusPage extends StatelessWidget {
  CaseStatusPage({super.key});

  final List<Map<String, dynamic>> cases = [
    {
      "title": "Property Dispute Resolution",
      "type": "Civil",
      "id": "#CD1024",
      "status": "Ongoing",
      "rating": 3.5,
      "statusColor": Colors.green,
    },
    {
      "title": "Employment Contract Review",
      "type": "Labor",
      "id": "#EC3039",
      "status": "Pending",
      "rating": 3.0,
      "statusColor": Colors.yellow,
    },
    {
      "title": "Corporate Fraud Investigation",
      "type": "Criminal",
      "id": "#CF2048",
      "status": "Closed",
      "rating": 4.7,
      "statusColor": Colors.red,
    },
    {
      "title": "Family Estate Settlement",
      "type": "Probate",
      "id": "#FE5012",
      "status": "In Review",
      "rating": 2.5,
      "statusColor": Colors.orange,
    },
    {
      "title": "Corporate Fraud Investigation",
      "type": "Criminal",
      "id": "#CF2048",
      "status": "Closed",
      "rating": 4.7,
      "statusColor": Colors.red,
    },
    {
      "title": "Family Estate Settlement",
      "type": "Probate",
      "id": "#FE5012",
      "status": "In Review",
      "rating": 2.5,
      "statusColor": Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: CaseCard(
              title: cases[index]['title'],
              type: cases[index]['type'],
              caseId: cases[index]['id'],
              status: cases[index]['status'],
              rating: cases[index]['rating'],
              statusColor: cases[index]['statusColor'],
            ),
          );
        },
      ),
    );
  }
}

class CaseCard extends StatelessWidget {
  final String title;
  final String type;
  final String caseId;
  final String status;
  final double rating;
  final Color statusColor;

  const CaseCard({super.key, 
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
                      'Priority: ${rating.toString()}',
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
