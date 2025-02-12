import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/view/components/custom_input_field.dart';

class AddCaseDescriptionForm extends StatefulWidget {
  const AddCaseDescriptionForm({super.key});

  @override
  State<AddCaseDescriptionForm> createState() => _AddCaseDescriptionFormState();
}

class _AddCaseDescriptionFormState extends State<AddCaseDescriptionForm> {
  final CasesController casesController = Get.put(CasesController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Case Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: casesController.scanDescriptionByImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              icon: Icon(
                Icons.camera,
                size: 30,
                color: Colors.white,
              ),
              label: Text(
                'Scan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 1,
                width: 70,
                color: Colors.grey,
              ),
              Text(
                'OR',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 1,
                width: 70,
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          CustomInputField(
            controller: casesController.descriptionController,
            hintText: "Enter Case Description",
            maxLines: 20,
          ),
        ],
      ),
    );
  }
}
