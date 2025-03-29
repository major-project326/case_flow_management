import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';

class DetailsConfirmation extends StatefulWidget {
  DetailsConfirmation({super.key});

  @override
  State<DetailsConfirmation> createState() => _DetailsConfirmationState();
}

class _DetailsConfirmationState extends State<DetailsConfirmation> {
  final CasesController casesController = Get.put(CasesController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Confirm Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Obx(() {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Title: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        casesController.titleController.text,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Category: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        casesController.caseCategory.value,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Case ID: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        casesController.caseIdController.text,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Description:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    casesController.descriptionController.text.trim(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
