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
    required this.id,
    required this.caseId,
    required this.title,
    required this.category,
    required this.uploadDateTime,
    required this.description,
    required this.status,
    required this.priority,
    required this.judgeId,
  });
}
