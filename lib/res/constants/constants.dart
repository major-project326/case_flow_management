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
}
