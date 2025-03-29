import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/view/components/custom_dropdown_field.dart';
import 'package:major_project/view/components/custom_input_field.dart';
import 'package:major_project/view/screens/category_selection_page.dart';

class UpdateCasePage extends StatefulWidget {
  const UpdateCasePage({
    super.key,
  });

  @override
  _UpdateCasePageState createState() => _UpdateCasePageState();
}

class _UpdateCasePageState extends State<UpdateCasePage> {
  final CasesController casesController = Get.put(CasesController());

  @override
  void initState() {
    casesController.fillUpdateForm();
    super.initState();
  }

  @override
  void dispose() {
    casesController.clearControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'UPDATE DETAILS',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFEFEFEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  },
                  labelText: "Case Category:",
                );
              }),
              SizedBox(
                height: 15,
              ),
              CustomInputField(
                controller: casesController.descriptionController,
                hintText: "Enter Case Description",
                labelText: "Case Description:",
                maxLines: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GestureDetector(
                    onTap: () async {
                      await casesController.updateCaseDetails(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(.25))
                          ],
                          color: Colors.black),
                      height: 50,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Obx(() {
                              return casesController.isCaseDetailsUpdating.value
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
