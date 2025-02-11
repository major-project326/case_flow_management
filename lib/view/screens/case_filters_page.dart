import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/res/constants/constants.dart';

class CaseFiltersPage extends StatefulWidget {
  const CaseFiltersPage({super.key});

  @override
  State<CaseFiltersPage> createState() => _CaseFiltersPageState();
}

class _CaseFiltersPageState extends State<CaseFiltersPage> {
  List<String> categories = ["Category", "Status", "Priority"];
  int selectedCategory = 0;

  Map<String, Set<String>> selectedFilters = {
    "Category": {},
    "Status": {},
    "Priority": {}
  };

  bool isAllSelectedEnabled() {
    if (selectedCategory == 0 &&
        selectedFilters["Category"]!.length ==
            Constants.caseCategoriesMap.keys.length) {
      return true;
    } else if (selectedCategory == 1 &&
        selectedFilters["Status"]!.length ==
            Constants.statusColorMap.keys.length) {
      return true;
    } else if (selectedCategory == 2 &&
        selectedFilters["Priority"]!.length ==
            Constants.priorityFilters.length) {
      return true;
    }
    return false;
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
        body: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .4,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color(0xFFBABABA), width: .5),
                      right: BorderSide(color: Color(0xFFBABABA), width: .5))),
              child: Column(
                children: [
                  ...List.generate(categories.length, (index) {
                    return ListTile(
                      selected: selectedCategory == index,
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                      title: Text(categories[index]),
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
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(color: Color(0xFFBABABA), width: .5),
              )),
              child: Column(
                children: [
                  CheckboxListTile(
                    contentPadding: const EdgeInsets.all(0),
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    title: Text('Select All', style: TextStyle(fontSize: 14)),
                    value: isAllSelectedEnabled(),
                    onChanged: (val) {
                      if (val != null && val) {
                        switch (selectedCategory) {
                          case 0:
                            for (String item
                                in Constants.caseCategoriesMap.keys) {
                              selectedFilters["Category"]!.add(item);
                            }
                            break;
                          case 1:
                            for (String item in Constants.statusColorMap.keys) {
                              selectedFilters["Status"]!.add(item);
                            }
                            break;
                          case 2:
                            for (String item in Constants.priorityFilters) {
                              selectedFilters["Priority"]!.add(item);
                            }
                            break;
                        }
                      } else if (val != null && !val) {
                        switch (selectedCategory) {
                          case 0:
                            for (String item
                                in Constants.caseCategoriesMap.keys) {
                              selectedFilters["Category"]!.remove(item);
                            }
                            break;
                          case 1:
                            for (String item in Constants.statusColorMap.keys) {
                              selectedFilters["Status"]!.remove(item);
                            }
                            break;
                          case 2:
                            for (String item in Constants.priorityFilters) {
                              selectedFilters["Priority"]!.remove(item);
                            }
                            break;
                        }
                      }
                      setState(() {});
                    },
                  ),
                  if (selectedCategory == 0)
                    ...List.generate(
                      Constants.caseCategoriesMap.keys.length,
                      (index) => CheckboxListTile(
                        contentPadding: const EdgeInsets.all(0),
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        title: Text(
                            Constants.caseCategoriesMap.keys.toList()[index],
                            style: TextStyle(fontSize: 14)),
                        value: selectedFilters["Category"]!.contains(
                            Constants.caseCategoriesMap.keys.toList()[index]),
                        onChanged: (val) {
                          if (selectedFilters["Category"]!.contains(Constants
                              .caseCategoriesMap.keys
                              .toList()[index])) {
                            selectedFilters["Category"]!.remove(Constants
                                .caseCategoriesMap.keys
                                .toList()[index]);
                          } else {
                            selectedFilters["Category"]!.add(Constants
                                .caseCategoriesMap.keys
                                .toList()[index]);
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  if (selectedCategory == 1)
                    ...List.generate(
                      Constants.statusColorMap.keys.length,
                      (index) => CheckboxListTile(
                        contentPadding: const EdgeInsets.all(0),
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        title: Text(
                            Constants.statusColorMap.keys.toList()[index],
                            style: TextStyle(fontSize: 14)),
                        value: selectedFilters["Status"]!.contains(
                            Constants.statusColorMap.keys.toList()[index]),
                        onChanged: (val) {
                          if (selectedFilters["Status"]!.contains(
                              Constants.statusColorMap.keys.toList()[index])) {
                            selectedFilters["Status"]!.remove(
                                Constants.statusColorMap.keys.toList()[index]);
                          } else {
                            selectedFilters["Status"]!.add(
                                Constants.statusColorMap.keys.toList()[index]);
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  if (selectedCategory == 2)
                    ...List.generate(
                      Constants.priorityFilters.length,
                      (index) => CheckboxListTile(
                        contentPadding: const EdgeInsets.all(0),
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        title: Text(Constants.priorityFilters[index],
                            style: TextStyle(fontSize: 14)),
                        value: selectedFilters["Priority"]!
                            .contains(Constants.priorityFilters[index]),
                        onChanged: (val) {
                          if (selectedFilters["Priority"]!
                              .contains(Constants.priorityFilters[index])) {
                            selectedFilters["Priority"]!
                                .remove(Constants.priorityFilters[index]);
                          } else {
                            selectedFilters["Priority"]!
                                .add(Constants.priorityFilters[index]);
                          }
                          setState(() {});
                        },
                      ),
                    )
                ],
              ),
            )
          ],
        ),
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
                      onTap: () {
                        selectedFilters = {
                          "Category": {},
                          "Status": {},
                          "Priority": {}
                        };
                        setState(() {});
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
                    onTap: () {},
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
