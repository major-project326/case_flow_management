import 'dart:io';
import 'dart:math';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:major_project/models/case_model.dart';
import 'package:major_project/repository/cases_repository.dart';
import 'package:major_project/res/constants/constants.dart';
import 'package:major_project/utils/snackbar_utils.dart';

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

        descriptionController.text = recognizedText.text;
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

  TextEditingController searchController = TextEditingController();

  List<String> categories = ["Category", "Status", "Priority"];
  Rx<int> selectedCategory = 0.obs;

  RxMap<String, Set<String>> selectedFilters =
      <String, Set<String>>{"Category": {}, "Status": {}, "Priority": {}}.obs;

  void setSelectedCategory(int value) {
    selectedCategory.value = value;
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
        selectedFilters["Priority"]!.length ==
            Constants.priorityFilters.length) {
      return true;
    }
    return false;
  }

  clearAllFilters() {
    selectedFilters.value = <String, Set<String>>{
      "Category": {},
      "Status": {},
      "Priority": {}
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
          for (String item in Constants.priorityFilters) {
            selectedFilters["Priority"]!.add(item);
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
          for (String item in Constants.priorityFilters) {
            selectedFilters["Priority"]!.remove(item);
          }
          break;
      }
    }
    selectedFilters.refresh();
  }

  // CASES DISPLAY -------------------------------------------------------

  final CasesRepository _casesRepository = CasesRepository();
  RxList<CaseModel> cases = <CaseModel>[].obs;
  RxList<CaseModel> topCases = <CaseModel>[].obs;
  RxMap<String, int> summary = <String, int>{}.obs;
  Rx<bool> isDescriptionOpen = false.obs;
  Rx<bool> isCasesLoading = false.obs;
  Rx<bool> isCasesAdding = false.obs;

  setIsCasesLoading(bool value) {
    isCasesLoading.value = value;
  }

  setIsCasesAdding(bool value) {
    isCasesAdding.value = value;
  }

  setIsDescriptionOpen(bool value) {
    isDescriptionOpen.value = value;
  }

  Future<void> getAllCases() async {
    isCasesLoading = true.obs;
    try {
      cases.value = await _casesRepository.getAllCases();
      cases.refresh();
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
    setIsCasesAdding(true);
    try {
      double priority = await _casesRepository.getCasePriority({
        "text": descriptionController.text,
        "case_type": Constants.caseCategoriesMap[caseCategory.value]!
      });

      CaseModel newCase = CaseModel(
          caseId: caseIdController.text,
          title: titleController.text,
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
      await getAllCases();
    } catch (e) {
      print(e);
    } finally {
      setIsCasesAdding(false);
    }
  }
}
