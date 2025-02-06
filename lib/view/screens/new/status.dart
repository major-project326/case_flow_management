import 'package:flutter/material.dart';

 

class CaseDetailsPage extends StatefulWidget {
  const CaseDetailsPage({super.key});

  @override
  _CaseDetailsPageState createState() => _CaseDetailsPageState();
}

class _CaseDetailsPageState extends State<CaseDetailsPage> {
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Draft Pretrial Statement', 'completed': true},
    {'title': 'File Trial Brief', 'completed': false},
  ];

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void downloadDocument(String documentName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$documentName downloaded!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinder v. Alpha, Inc.',style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Case Number: 21-12345',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Filed on 12/12/2021'),
              SizedBox(height: 16),
              Text(
                'Client: Cinder',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Cinder is a software company that specializes in cloud-based services.'),
              SizedBox(height: 16),
              Text(
                'Opponent: Alpha, Inc.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Alpha is a large corporation that provides online services.'),
              SizedBox(height: 16),
              Text(
                'Assigned Judge: John Smith',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Judge John Smith'),
              SizedBox(height: 16),
              Text(
                'Status: Pending',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Awaiting trial'),
              SizedBox(height: 16),
              Text(
                'Description:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Cinder, the plaintiff, is suing Alpha for infringement of its patent. The case has been assigned to Judge John Smith.'),
              SizedBox(height: 24),
              Text(
                'Hearing Dates',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Pretrial Conference'),
                trailing: Text('3/20/23'),
              ),
              ListTile(
                title: Text('Trial'),
                trailing: Text('5/10/23'),
              ),
              ListTile(
                title: Text('Posttrial Conference'),
                trailing: Text('6/20/23'),
              ),
              SizedBox(height: 24),
              Text(
                'Documents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Complaint'),
                trailing: IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () => downloadDocument('Complaint'),
                ),
              ),
              ListTile(
                title: Text('Answer'),
                trailing: IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () => downloadDocument('Answer'),
                ),
              ),
              ListTile(
                title: Text('Patent'),
                trailing: IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () => downloadDocument('Patent'),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...tasks.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> task = entry.value;
                return CheckboxListTile(
                  title: Text(task['title']),
                  value: task['completed'],
                  onChanged: (value) => toggleTaskCompletion(index),
                );
              }),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('+ Add Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
