import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/view/screens/update_case_page.dart';

class CaseDetailsPage extends StatefulWidget {
  const CaseDetailsPage({super.key});

  @override
  _CaseDetailsPageState createState() => _CaseDetailsPageState();
}

class _CaseDetailsPageState extends State<CaseDetailsPage> {
  final CasesController casesController = Get.put(CasesController());

  @override
  void dispose() {
    casesController.setIsDescriptionOpen(false);
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
          'CASE DETAILS',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(UpdateCasePage());
              },
              icon: const Icon(Icons.edit)),
        ],
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFEFEFEF),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          casesController.caseDetails.value!.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Category: ${casesController.caseDetails.value!.category}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Judge: Rohit Baing',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: Constants.statusColorMap[casesController
                                        .caseDetails.value!.status]!
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                casesController.caseDetails.value!.status,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Constants.statusColorMap[
                                        casesController
                                            .caseDetails.value!.status],
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            casesController.caseDetails.value!.caseId,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      Constants.caseStatus.length,
                      (index) => Expanded(
                        child: Text(Constants.caseStatus[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    return Obx(() {
                      return ConstrainedBox(
                        constraints:
                            const BoxConstraints.tightFor(height: 180.0),
                        child: Theme(
                          data: ThemeData(canvasColor: Colors.transparent),
                          child: Stepper(
                              connectorColor: const WidgetStatePropertyAll(
                                  Color(0xFFD1D1D1)),
                              margin: const EdgeInsets.all(0),
                              elevation: 0,
                              type: StepperType.horizontal,
                              stepIconMargin: const EdgeInsets.all(0),
                              currentStep: Constants.caseStatus.indexOf(
                                  casesController.caseDetails.value!.status),
                              controlsBuilder: (context, details) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            await casesController
                                                .updateCaseStatus(
                                                    context, false);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white),
                                            height: 50,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Center(
                                                  child: casesController
                                                          .isCaseStatusUndoing
                                                          .value
                                                      ? CircularProgressIndicator(
                                                          color: Colors.black,
                                                        )
                                                      : Text(
                                                          'Undo Status',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            await casesController
                                                .updateCaseStatus(
                                                    context, true);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 2),
                                                      blurRadius: 4,
                                                      color: Colors.black
                                                          .withOpacity(.25))
                                                ],
                                                color: Colors.black),
                                            height: 50,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Center(
                                                    child: casesController
                                                            .isCaseStatusUpdating
                                                            .value
                                                        ? CircularProgressIndicator(
                                                            color: Colors.white,
                                                          )
                                                        : Text(
                                                            "Update Status",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              steps: [
                                ...List.generate(Constants.caseStatus.length,
                                    (index) => _buildStep(index))
                              ]),
                        ),
                      );
                    });
                  }),
                  Obx(() {
                    return Container(
                      width: double.infinity,
                      height:
                          casesController.isDescriptionOpen.value ? null : 310,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            casesController.caseDetails.value!.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(height: 1.5),
                            maxLines: casesController.isDescriptionOpen.value
                                ? null
                                : 8,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Visibility(
                            visible: !casesController.isDescriptionOpen.value,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  onPressed: () {
                                    casesController.setIsDescriptionOpen(true);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 20),
                                  ),
                                  child: const Text('Read More')),
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ]),
          ),
        );
      }),
    );
  }

  Step _buildStep(int step) {
    int currentIndex =
        Constants.caseStatus.indexOf(casesController.caseDetails.value!.status);
    return Step(
        stepStyle: StepStyle(
            indexStyle: const TextStyle(color: Colors.white),
            color: currentIndex >= step
                ? const Color(0xFF007F00).withOpacity(.5)
                : const Color(0xFF000000).withOpacity(.4)),
        state: currentIndex > step ? StepState.complete : StepState.indexed,
        title: const Text(''),
        content: const Text(
          '',
          style: TextStyle(fontSize: 0),
        ),
        isActive: currentIndex >= step);
  }
}
