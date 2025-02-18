import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controllers/cases_controller.dart';
import 'package:major_project/res/constants/constants.dart';

class CaseFiltersPage extends StatefulWidget {
  const CaseFiltersPage({super.key});

  @override
  State<CaseFiltersPage> createState() => _CaseFiltersPageState();
}

class _CaseFiltersPageState extends State<CaseFiltersPage> {
  final CasesController casesController = Get.put(CasesController());

  @override
  void initState() {
    super.initState();
    casesController.generateDates();
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
          title: Text(
            'FILTERS',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          centerTitle: true,
          scrolledUnderElevation: 0,
          backgroundColor: const Color(0xFFEFEFEF),
        ),
        body: Obx(() {
          return Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .4,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Color(0xFFBABABA), width: .5),
                        right:
                            BorderSide(color: Color(0xFFBABABA), width: .5))),
                child: Column(
                  children: [
                    ...List.generate(casesController.categories.length,
                        (index) {
                      return ListTile(
                        selected:
                            casesController.selectedCategory.value == index,
                        onTap: () {
                          casesController.setSelectedCategory(index);
                        },
                        title: Text(casesController.categories[index]),
                        splashColor: Colors.transparent,
                        selectedColor: Colors.white,
                        selectedTileColor: Colors.black,
                      );
                    })
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6,
                height: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Color(0xFFBABABA), width: .5),
                )),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        contentPadding: const EdgeInsets.all(0),
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        title:
                            Text('Select All', style: TextStyle(fontSize: 14)),
                        value: casesController.isAllSelectedEnabled(),
                        onChanged: (val) {
                          casesController.handleSelectAll(val);
                        },
                      ),
                      if (casesController.selectedCategory.value == 0)
                        ...List.generate(
                          Constants.caseCategories.length,
                          (index) => CheckboxListTile(
                            contentPadding: const EdgeInsets.all(0),
                            checkColor: Colors.white,
                            activeColor: Colors.black,
                            title: Text(Constants.caseCategories[index],
                                style: TextStyle(fontSize: 14)),
                            value: casesController.selectedFilters["Category"]!
                                .contains(Constants.caseCategories[index]),
                            onChanged: (val) {
                              casesController.handleFilterPressed(
                                  "Category", Constants.caseCategories[index]);
                            },
                          ),
                        ),
                      if (casesController.selectedCategory.value == 1)
                        ...List.generate(
                          Constants.caseStatus.length,
                          (index) => CheckboxListTile(
                            contentPadding: const EdgeInsets.all(0),
                            checkColor: Colors.white,
                            activeColor: Colors.black,
                            title: Text(Constants.caseStatus[index],
                                style: TextStyle(fontSize: 14)),
                            value: casesController.selectedFilters["Status"]!
                                .contains(Constants.caseStatus[index]),
                            onChanged: (val) {
                              casesController.handleFilterPressed(
                                  "Status", Constants.caseStatus[index]);
                            },
                          ),
                        ),
                      if (casesController.selectedCategory.value == 2)
                        ...List.generate(casesController.dates.length, (index) {
                          return CheckboxListTile(
                            contentPadding: const EdgeInsets.all(0),
                            checkColor: Colors.white,
                            activeColor: Colors.black,
                            title: Text(casesController.dates[index],
                                style: TextStyle(fontSize: 14)),
                            value: casesController.selectedFilters["Date"]!
                                .contains(casesController.dates[index]),
                            onChanged: (val) {
                              casesController.handleFilterPressed(
                                  "Date", casesController.dates[index]);
                            },
                          );
                        })
                    ],
                  ),
                ),
              )
            ],
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: true,
                  child: Expanded(
                    child: GestureDetector(
                      onTap: casesController.clearAllFilters,
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
                                'Clear All',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: casesController.handleFilterCases,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              'Apply',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
