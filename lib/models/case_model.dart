import 'package:cloud_firestore/cloud_firestore.dart';

class CaseModel {
  final String id;
  final String caseId;
  final String title;
  final String category;
  final DateTime uploadDateTime;
  final String description;
  final String status;
  final double priority;
  final String judgeId;

  CaseModel({
    this.id = '',
    required this.caseId,
    required this.title,
    required this.category,
    required this.uploadDateTime,
    required this.description,
    required this.status,
    required this.priority,
    required this.judgeId,
  });

  /// Converts Firestore document to a CaseModel object
  factory CaseModel.fromJson(Map<String, dynamic> json, String documentId) {
    return CaseModel(
      id: documentId,
      caseId: json['caseId'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      uploadDateTime: (json['uploadDateTime'] as Timestamp).toDate(),
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      priority: (json['priority'] as num).toDouble(),
      judgeId: json['judgeId'] ?? '',
    );
  }

  /// Converts CaseModel object to a Firestore-compatible JSON map
  Map<String, dynamic> toJson() {
    return {
      "caseId": caseId,
      "title": title,
      "category": category,
      "uploadDateTime": Timestamp.fromDate(uploadDateTime),
      "description": description,
      "status": status,
      "priority": priority,
      "judgeId": judgeId,
    };
  }
}
