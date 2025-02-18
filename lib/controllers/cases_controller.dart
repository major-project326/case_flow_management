import 'dart:io';
import 'dart:math';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:intl/intl.dart';
import 'package:major_project/models/case_model.dart';
import 'package:major_project/repository/cases_repository.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/utils/snackbar_utils.dart';
import 'package:major_project/utils/utils.dart';

class CasesController extends GetxController {
  //ADD CASES ----------------------------------------------------------

  TextEditingController titleController = TextEditingController();
  TextEditingController caseIdController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<String> caseCategory = "Select Category".obs;

  generateDefaultCaseId() {
    const String prefix = "#";
    const String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const String ints = "0123456789";
    Random random = Random();

    String randomChar1 =
        List.generate(2, (index) => chars[random.nextInt(chars.length)]).join();
    String randomNum =
        List.generate(3, (index) => ints[random.nextInt(ints.length)]).join();
    String randomChar2 =
        List.generate(1, (index) => chars[random.nextInt(chars.length)]).join();

    caseIdController.text = "$prefix$randomChar1$randomNum$randomChar2";
  }

  clearControllers() {
    titleController.clear();
    caseIdController.clear();
    descriptionController.clear();
    caseCategory.value = "Select Category";
  }

  scanDescriptionByImage() async {
    final imagesPath = await CunningDocumentScanner.getPictures(
      noOfPages: 1,
      isGalleryImportAllowed: true,
    );

    if (imagesPath != null && imagesPath.isNotEmpty) {
      final InputImage inputImage = InputImage.fromFile(File(imagesPath[0]));
      final textRecognizer = TextRecognizer();
      try {
        final RecognizedText recognizedText =
            await textRecognizer.processImage(inputImage);

        descriptionController.text =
            recognizedText.text.replaceAll("\n", " ").trim();
      } catch (e) {
        print("Error processing image: $e");
      } finally {
        textRecognizer.close();
      }
    } else {
      print("Please select image");
    }
  }

  bool isFormValid(BuildContext context, int currentPage) {
    if (currentPage == 0 && caseIdController.text.isEmpty) {
      SnackBarUtils.showSnackBar(context, "Please enter Case ID");
      return false;
    }
    if (currentPage == 0 && titleController.text.isEmpty) {
      SnackBarUtils.showSnackBar(context, "Please enter Case Title");
      return false;
    }
    if (currentPage == 0 && caseCategory.value == "Select Category") {
      SnackBarUtils.showSnackBar(context, "Please enter Case Category");
      return false;
    }
    if (currentPage == 1 && descriptionController.text.isEmpty) {
      SnackBarUtils.showSnackBar(context, "Please enter Case Description");
      return false;
    }
    return true;
  }

  // FILTER & SEARCH CASES --------------------------------------------------------

  List<String> categories = ["Category", "Status", "Date"];
  Rx<int> selectedCategory = 0.obs;
  RxList<String> dates = <String>[].obs;

  RxMap<String, Set<String>> selectedFilters =
      <String, Set<String>>{"Category": {}, "Status": {}, "Date": {}}.obs;

  void setSelectedCategory(int value) {
    selectedCategory.value = value;
  }

  void generateDates() {
    dates.value = Utils.generateMonthYearList();
    dates.refresh();
  }

  bool areFiltersApplied() {
    return selectedFilters.values.any((filterSet) => filterSet.isNotEmpty);
  }

  int getFiltersCount() {
    return selectedFilters.values.fold(0, (sum, set) => sum + set.length);
  }

  handleSearchChange(String query) {
    if (query.isEmpty) {
      filteredCases.value = cases;
    } else {
      filteredCases.value = cases.where((item) {
        return item.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    filteredCases.refresh();
  }

  bool isAllSelectedEnabled() {
    if (selectedCategory.value == 0 &&
        selectedFilters["Category"]!.length ==
            Constants.caseCategoriesMap.keys.length) {
      return true;
    } else if (selectedCategory.value == 1 &&
        selectedFilters["Status"]!.length ==
            Constants.statusColorMap.keys.length) {
      return true;
    } else if (selectedCategory.value == 2 &&
        selectedFilters["Date"]!.length == dates.length) {
      return true;
    }
    return false;
  }

  clearAllFilters() {
    selectedFilters.value = <String, Set<String>>{
      "Category": {},
      "Status": {},
      "Date": {}
    };
    selectedFilters.refresh();
  }

  void handleFilterPressed(String key, String value) {
    if (selectedFilters[key]!.contains(value)) {
      selectedFilters[key]!.remove(value);
    } else {
      selectedFilters[key]!.add(value);
    }
    selectedFilters.refresh();
  }

  void handleSelectAll(bool? value) {
    if (value == null) {
      return;
    } else if (value) {
      switch (selectedCategory.value) {
        case 0:
          for (String item in Constants.caseCategoriesMap.keys) {
            selectedFilters["Category"]!.add(item);
          }
          break;
        case 1:
          for (String item in Constants.statusColorMap.keys) {
            selectedFilters["Status"]!.add(item);
          }
          break;

        case 2:
          for (String item in dates) {
            selectedFilters["Date"]!.add(item);
          }
          break;
      }
    } else if (!value) {
      switch (selectedCategory.value) {
        case 0:
          for (String item in Constants.caseCategoriesMap.keys) {
            selectedFilters["Category"]!.remove(item);
          }
          break;
        case 1:
          for (String item in Constants.statusColorMap.keys) {
            selectedFilters["Status"]!.remove(item);
          }
          break;

        case 2:
          for (String item in dates) {
            selectedFilters["Date"]!.remove(item);
          }
          break;
      }
    }
    selectedFilters.refresh();
  }

  void handleFilterCases() {
    filteredCases.value = cases.where((caseItem) {
      bool categoryMatch = selectedFilters["Category"] == null ||
          selectedFilters["Category"]!.isEmpty ||
          selectedFilters["Category"]!.contains(caseItem.category);
      bool statusMatch = selectedFilters["Status"] == null ||
          selectedFilters["Status"]!.isEmpty ||
          selectedFilters["Status"]!.contains(caseItem.status);

      String caseMonth =
          DateFormat("MMMM yyyy").format(caseItem.uploadDateTime);
      bool monthMatch = selectedFilters["Date"] == null ||
          selectedFilters["Date"]!.isEmpty ||
          selectedFilters["Date"]!.contains(caseMonth);

      return categoryMatch && statusMatch && monthMatch;
    }).toList();

    Get.back();
  }

  // CASES DISPLAY -------------------------------------------------------

  final CasesRepository _casesRepository = CasesRepository();
  RxList<CaseModel> cases = <CaseModel>[].obs;
  RxList<CaseModel> filteredCases = <CaseModel>[].obs;
  RxList<CaseModel> topCases = <CaseModel>[].obs;
  RxMap<String, int> summary = <String, int>{}.obs;
  Rx<CaseModel?> caseDetails = null.obs;
  Rx<bool> isDescriptionOpen = false.obs;
  Rx<bool> isCasesLoading = false.obs;
  Rx<bool> isCaseAdding = false.obs;
  Rx<bool> isCaseUpdating = false.obs;
  Rx<bool> isCaseUndoing = false.obs;

  setIsCasesLoading(bool value) {
    isCasesLoading.value = value;
  }

  setIsCaseAdding(bool value) {
    isCaseAdding.value = value;
  }

  setIsCaseUpdating(bool value) {
    isCaseUpdating.value = value;
  }

  setIsCaseUndoing(bool value) {
    isCaseUndoing.value = value;
  }

  setIsDescriptionOpen(bool value) {
    isDescriptionOpen.value = value;
  }

  setCurrentCaseDetails(CaseModel value) {
    if (caseDetails.value == null) {
      caseDetails = value.obs;
    } else {
      caseDetails.value = value;
    }
  }

  Future<void> getAllCases() async {
    isCasesLoading = true.obs;
    try {
      cases.value = await _casesRepository.getAllCases();
      filteredCases.value = cases;
      filteredCases.refresh();
    } catch (e) {
      print(e);
    } finally {
      setIsCasesLoading(false);
    }
  }

  Future<void> getTop3Cases() async {
    try {
      topCases.value = await _casesRepository.getTop3Cases();
      topCases.refresh();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCaseSummary() async {
    try {
      summary.value = await _casesRepository.getCaseSummary();
      summary.refresh();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addCase(BuildContext context) async {
    setIsCaseAdding(true);
    try {
      double priority = await _casesRepository.getCasePriority({
        "text": descriptionController.text,
        "case_type": Constants.caseCategoriesMap[caseCategory.value]!
      });

      CaseModel newCase = CaseModel(
          caseId: caseIdController.text.trim(),
          title: titleController.text.trim(),
          category: caseCategory.value,
          uploadDateTime: DateTime.now(),
          description: descriptionController.text,
          status: "Pending",
          priority: priority,
          judgeId: "");
      await _casesRepository.addCase(newCase);
      SnackBarUtils.showSnackBar(context, "Case added successfully");
      Get.back();
      clearControllers();
      getAllCases();
      getTop3Cases();
      getCaseSummary();
    } catch (e) {
      print(e);
    } finally {
      setIsCaseAdding(false);
    }
  }

  Future<void> updateCaseStatus(BuildContext context, bool isUpdating) async {
    try {
      if (isUpdating) {
        setIsCaseUpdating(true);
        if (Constants.caseStatus.indexOf(caseDetails.value!.status) < 3) {
          String nextStatus = Constants.caseStatus[
              Constants.caseStatus.indexOf(caseDetails.value!.status) + 1];
          await _casesRepository.updateCaseStatus(
              caseDetails.value!.id, nextStatus);
          setCurrentCaseDetails(
              caseDetails.value!.copyWith(status: nextStatus));
          SnackBarUtils.showSnackBar(
              context, "Case status updated successfully");
        }
      } else {
        setIsCaseUndoing(true);
        if (Constants.caseStatus.indexOf(caseDetails.value!.status) > 0) {
          String previousStatus = Constants.caseStatus[
              Constants.caseStatus.indexOf(caseDetails.value!.status) - 1];
          await _casesRepository.updateCaseStatus(
              caseDetails.value!.id, previousStatus);
          setCurrentCaseDetails(
              caseDetails.value!.copyWith(status: previousStatus));
          SnackBarUtils.showSnackBar(
              context, "Case status updated successfully");
        }
      }
      getAllCases();
      getCaseSummary();
    } catch (e) {
      print(e);
    } finally {
      setIsCaseUpdating(false);
      setIsCaseUndoing(false);
    }
  }
}
