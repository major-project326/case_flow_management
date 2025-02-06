import 'package:flutter/material.dart';



class CaseList extends StatelessWidget {
  final List<Map<String, String>> cases = [
    {'title': 'Williams v. Martinez', 'date': 'Filed on 12/3/2022'},
    {'title': 'Smith v. Jones', 'date': 'Filed on 11/9/2022'},
    {'title': 'Garcia v. Wang', 'date': 'Filed on 10/2/2022'},
  ];

   CaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Cases',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(label: 'Status'),
                FilterButton(label: 'Date'),
                FilterButton(label: 'Sort by'),
                FilterButton(label: 'View'),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cases.length,
                itemBuilder: (context, index) {
                  return CaseTile(
                    title: cases[index]['title']!,
                    date: cases[index]['date']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;

  const FilterButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 159, 193, 243),
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(label),
    );
  }
}

class CaseTile extends StatelessWidget {
  final String title;
  final String date;

  const CaseTile({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(Icons.folder, color: Colors.blue),
        title: Text(title),
        subtitle: Text(date),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
           
          },
        ),
      ),
    );
  }
}
