import 'package:flutter/material.dart';


class AddCasePage extends StatefulWidget {
  const AddCasePage({super.key});

  @override
  _AddCasePageState createState() => _AddCasePageState();
}

class _AddCasePageState extends State<AddCasePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _courtIdController = TextEditingController();
  final _caseIdController = TextEditingController();
  final _detailsController = TextEditingController();
  String? _selectedCaseType;

  final List<String> _caseTypes = ['Civil', 'Criminal', 'Family', 'robbary' ,'Others'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newCase = {
        'name': _nameController.text,
        'courtId': _courtIdController.text,
        'caseId': _caseIdController.text,
        'caseType': _selectedCaseType,
        'details': _detailsController.text,
      };

      
      print('New Case: $newCase');

      // Clear the form after submission
      _nameController.clear();
      _courtIdController.clear();
      _caseIdController.clear();
      _detailsController.clear();
      setState(() {
        _selectedCaseType = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Case added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var b = 243;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Court Case'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
                ),
                TextFormField(
                  controller: _courtIdController,
                  decoration: InputDecoration(labelText: 'Court ID'),
                  validator: (value) => value!.isEmpty ? 'Please enter a court ID' : null,
                ),
                TextFormField(
                  controller: _caseIdController,
                  decoration: InputDecoration(labelText: 'Case ID'),
                  validator: (value) => value!.isEmpty ? 'Please enter a case ID' : null,
                ),
                DropdownButtonFormField<String>(
                  value: _selectedCaseType,
                  decoration: InputDecoration(labelText: 'Type of Case'),
                  items: _caseTypes.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCaseType = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a case type' : null,
                ),
                TextFormField(
                  controller: _detailsController,
                  decoration: InputDecoration(labelText: 'Details of Case'),
                  maxLines: 4,
                  validator: (value) => value!.isEmpty ? 'Please enter case details' : null,
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                                        
                   style:ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 159, 193, 243)),
                    child: Text('Add Case',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),)
                     
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
