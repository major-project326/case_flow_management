import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:major_project/models/case_model.dart';
import 'package:major_project/services/firestore_service.dart';
import 'package:major_project/services/http_services.dart';

class CasesRepository {
  final FirestoreService _fireStoreServices = FirestoreService();
  final HttpService _httpService = HttpService();

  Future<List<CaseModel>> getAllCases() async {
    try {
      QuerySnapshot snapshot = await _fireStoreServices.getAllCases();
      List<CaseModel> cases = snapshot.docs
          .map((doc) =>
              CaseModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();

      return cases;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CaseModel>> getTop3Cases() async {
    try {
      QuerySnapshot snapshot = await _fireStoreServices.getAllCases();

      List<CaseModel> allCases = snapshot.docs
          .map((doc) =>
              CaseModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList();

      return allCases.take(3).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, int>> getCaseSummary() async {
    try {
      QuerySnapshot snapshot = await _fireStoreServices.getAllCases();

      int ongoingCount = 0;
      int pendingCount = 0;
      int inReviewCount = 0;
      int closedCount = 0;

      for (var doc in snapshot.docs) {
        Map<String, dynamic> document = doc.data() as Map<String, dynamic>;
        String status = document['status'] ?? '';

        if (status == "Ongoing") {
          ongoingCount++;
        } else if (status == "Pending") {
          pendingCount++;
        } else if (status == "In Review") {
          inReviewCount++;
        } else if (status == "Closed") {
          closedCount++;
        }
      }

      return {
        "Ongoing": ongoingCount,
        "Pending": pendingCount,
        "In Review": inReviewCount,
        "Closed": closedCount,
        "Total": ongoingCount + pendingCount + inReviewCount + closedCount
      };
    } catch (e) {
      rethrow;
    }
  }

  Future<double> getCasePriority(Map<String, String> data) async {
    try {
      dynamic response = await _httpService.postRequest(data);
      log(response.toString());
      return response['priority'];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> addCase(CaseModel caseData) async {
    try {
      Map<String, dynamic> caseDataJson = caseData.toJson();

      _fireStoreServices.addCase(caseDataJson);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCase(
      String caseId, Map<String, dynamic> caseDetails) async {
    try {
      _fireStoreServices.updateCase(caseId, caseDetails);
    } catch (e) {
      rethrow;
    }
  }
}
