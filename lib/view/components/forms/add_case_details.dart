import 'package:flutter/material.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/view/components/custom_dropdown_field.dart';
import 'package:major_project/view/components/custom_input_field.dart';
import 'package:major_project/view/screens/category_selection_page.dart';

class AddCaseDetailsForm extends StatefulWidget {
  const AddCaseDetailsForm({super.key});

  @override
  State<AddCaseDetailsForm> createState() => _AddCaseDetailsFormState();
}

class _AddCaseDetailsFormState extends State<AddCaseDetailsForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _caseIdController = TextEditingController();
  String _caseCategoryLabel = 'Select Category';
  String _caseCategoryValue = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Case Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          CustomInputField(
            controller: _caseIdController,
            hintText: "Enter Case ID",
            labelText: "Case ID:",
          ),
          SizedBox(
            height: 15,
          ),
          CustomInputField(
            controller: _titleController,
            hintText: "Enter Case Title",
            labelText: "Case Title:",
          ),
          SizedBox(
            height: 15,
          ),
          CustomDropdownField(
            value: _caseCategoryLabel,
            selectionScreen: CategorySelectionPage(),
            onChange: (val) {
              setState(() {
                _caseCategoryLabel = val;
                if (Constants.caseCategoriesMap[val] != null) {
                  _caseCategoryValue = Constants.caseCategoriesMap[val]!;
                }
              });
            },
            labelText: "Case Category:",
          )
        ],
      ),
    );
  }
}
