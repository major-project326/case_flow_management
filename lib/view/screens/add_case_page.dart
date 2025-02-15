import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/view/components/forms/add_case_description.dart';
import 'package:major_project/view/components/forms/add_case_details.dart';
import 'package:major_project/view/components/forms/details_confirmation.dart';

class AddCasePage extends StatefulWidget {
  const AddCasePage({super.key});

  @override
  _AddCasePageState createState() => _AddCasePageState();
}

class _AddCasePageState extends State<AddCasePage> {
  final CasesController casesController = Get.put(CasesController());
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    casesController.generateDefaultCaseId();
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
            'ADD CASE',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Theme(
                  data: ThemeData(canvasColor: Colors.transparent),
                  child: Stepper(
                      connectorColor:
                          const WidgetStatePropertyAll(Color(0xFFD1D1D1)),
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      type: StepperType.horizontal,
                      stepIconMargin: const EdgeInsets.all(0),
                      currentStep: _currentPage,
                      steps: [
                        _buildStep(0),
                        _buildStep(1),
                        _buildStep(2),
                      ]),
                ),
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                children: [
                  AddCaseDetailsForm(),
                  AddCaseDescriptionForm(),
                  DetailsConfirmation()
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: _currentPage != 0,
                        child: Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (_currentPage > 0) {
                                setState(() {
                                  _currentPage = _currentPage - 1;
                                });
                                _pageController.animateToPage(_currentPage,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              height: 50,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _currentPage != 0 ? 10 : 0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            if (!casesController.isFormValid(
                                context, _currentPage)) {
                              return;
                            }
                            if (_currentPage == 2) {
                              log('message');
                              await casesController.addCase(context);
                            }
                            if (_currentPage < 2) {
                              _currentPage = _currentPage + 1;

                              _pageController.animateToPage(_currentPage,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            }
                          },
                          child: Obx(() {
                            return Container(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: casesController.isCaseAdding.value
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            _currentPage == 2
                                                ? 'Confirm'
                                                : 'Next',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Step _buildStep(int step) {
    return Step(
        stepStyle: StepStyle(
            indexStyle: const TextStyle(color: Colors.white),
            color: _currentPage >= step
                ? const Color(0xFF007F00).withOpacity(.5)
                : const Color(0xFF000000).withOpacity(.4)),
        state: _currentPage > step ? StepState.complete : StepState.indexed,
        title: const Text(''),
        content: const Text(
          '',
          style: TextStyle(fontSize: 0),
        ),
        isActive: _currentPage >= step);
  }
}
