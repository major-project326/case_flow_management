import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
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
  final CasesController casesController = Get.put(CasesController());
  @override
  void initState() {
    casesController.generateDefaultCaseId();
    super.initState();
  }

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
            controller: casesController.caseIdController,
            hintText: "Enter Case ID",
            labelText: "Case ID:",
          ),
          SizedBox(
            height: 15,
          ),
          CustomInputField(
            controller: casesController.titleController,
            hintText: "Enter Case Title",
            labelText: "Case Title:",
          ),
          SizedBox(
            height: 15,
          ),
          Obx(() {
            return CustomDropdownField(
              value: casesController.caseCategory.value,
              selectionScreen: CategorySelectionPage(),
              onChange: (val) {
                casesController.caseCategory.value = val;
                // if (Constants.caseCategoriesMap[val] != null) {
                //   _caseCategoryValue = Constants.caseCategoriesMap[val]!;
                // }
              },
              labelText: "Case Category:",
            );
          })
        ],
      ),
    );
  }
}
