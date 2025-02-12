import 'dart:io';
import 'dart:math';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class CasesController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController caseIdController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<String> caseCategory = "".obs;

  generateDefaultCaseId() {
    const String prefix = "#";
    const String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    Random random = Random();

    String randomPart =
        List.generate(4, (index) => chars[random.nextInt(chars.length)]).join();

    caseIdController.text = "$prefix$randomPart";
  }

  clearControllers() {
    titleController.clear();
    caseIdController.clear();
    descriptionController.clear();
    caseCategory.value = "";
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
}
