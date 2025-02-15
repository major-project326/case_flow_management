import 'package:flutter/material.dart';

class Constants {
  static final Map<String, Color> statusColorMap = {
    'Ongoing': Colors.green,
    'Closed': Colors.red,
    'Pending': Colors.amber,
    'In Review': Colors.orange
  };

  static final Map<String, String> caseCategoriesMap = {
    "Criminal": "Criminal",
    "Constitutional": "Constitutional",
    "Civil": "Civil",
    "Tax": "Tax",
    "Labour": "Labour",
    "Corporate": "Corporate",
    "Family": "Family",
    "Intellectual Property": "Intellectual_property",
    "Other": "Other",
  };

  static final List<String> caseCategories = [
    "Criminal",
    "Constitutional",
    "Civil",
    "Tax",
    "Labour",
    "Corporate",
    "Family",
    "Intellectual Property",
    "Other",
  ];

  static final List<String> caseStatus = [
    "Pending",
    "In Review",
    "Ongoing",
    "Closed",
  ];

  static final List<String> priorityFilters = [
    "0% - 10%",
    "10% - 20%",
    "20% - 30%",
    "30% - 40%",
    "40% - 50%",
    "50% - 60%",
    "60% - 70%",
    "70% - 80%",
    "80% - 90%",
    "90% - 100%",
  ];
}
