import 'package:flutter/material.dart';
import 'package:major_project/view/screens/new/case_upload.dart';
import 'package:major_project/view/screens/old/case_upload_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPage = 0;


  @override
  Widget build(BuildContext context) {
    const b = 0;
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CaseStatusCard(title: 'Open', count: 12),
                  CaseStatusCard(title: 'Closed', count: 32),
                  CaseStatusCard(title: 'Total', count: 44),
                ],
              ),
              SizedBox(height: 20),
              SectionTitle(title: 'Upcoming Hearings'),
              SizedBox(height: 10),
              HearingTile(caseNumber: '22', date: 'Wed, Mar 16, 10:00am'),
              HearingTile(caseNumber: '34', date: 'Fri, Mar 18, 11:00am'),
              HearingTile(caseNumber: '45', date: 'Mon, Mar 21, 9:00am'),
              SizedBox(height: 20),
              SectionTitle(title: 'Recent Activities'),
              SizedBox(height: 10),
              ActivityTile(activity: 'New case added', timeAgo: '2d ago'),
              ActivityTile(activity: 'Hearing scheduled', timeAgo: '2d ago'),
              ActivityTile(activity: 'Document uploaded', timeAgo: '2d ago'),
            ],
          ),
        ),
      );
  }
}

class CaseStatusCard extends StatelessWidget {
  final String title;
  final int count;

  const CaseStatusCard({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 159, 193, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            '$count',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: const Color.fromARGB(255, 0, 0, 0),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HearingTile extends StatelessWidget {
  final String caseNumber;
  final String date;

  const HearingTile({super.key, required this.caseNumber, required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.calendar_today,
          color: const Color.fromARGB(255, 159, 193, 243)),
      title: Text(
        'Hearing for case $caseNumber',
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
      subtitle: Text(
        date,
        style: TextStyle(color: const Color.fromARGB(255, 106, 106, 106)),
      ),
      trailing:
          Icon(Icons.arrow_forward, color: const Color.fromARGB(255, 0, 0, 0)),
      onTap: () {},
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String activity;
  final String timeAgo;

  const ActivityTile(
      {super.key, required this.activity, required this.timeAgo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.circle,
          color: const Color.fromARGB(255, 0, 0, 0), size: 15),
      title: Text(
        activity,
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
      subtitle: Text(
        timeAgo,
        style: TextStyle(color: const Color.fromARGB(255, 94, 94, 94)),
      ),
      onTap: () {},
    );
  }
}
