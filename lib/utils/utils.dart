import 'package:intl/intl.dart';

class Utils {
  static List<String> generateMonthYearList() {
    List<String> monthYearList = [];
    DateTime now = DateTime.now();
    DateTime start = DateTime(now.year - 1, now.month);

    for (DateTime date = start;
        date.isBefore(now) || date.isAtSameMomentAs(now);
        date = DateTime(date.year, date.month + 1)) {
      monthYearList.add(DateFormat("MMMM yyyy").format(date));
    }

    return monthYearList;
  }

  static String identifyCaseType(String text) {
    text = text.toLowerCase();

    final Map<String, List<String>> caseTypes = {
      "criminal": [
        "criminal",
        "section",
        "accused",
        "trial court",
        "crpc",
        "f.i.r",
        "arrest",
        "charge",
        "offense",
        "bail",
        "conviction",
        "prosecution",
        "defense",
        "sentence",
        "punishment",
        "police",
        "investigation",
        "murder",
        "theft",
        "fraud",
        "assault"
      ],
      "civil": [
        "civil",
        "plaintiff",
        "defendant",
        "injunction",
        "property",
        "contract",
        "dispute",
        "suit",
        "compensation",
        "damages",
        "agreement",
        "breach",
        "ownership",
        "possession",
        "partition",
        "liability",
        "negligence",
        "tort"
      ],
      "corporate": [
        "corporate",
        "company",
        "shareholder",
        "merger",
        "acquisition",
        "insolvency",
        "bankruptcy",
        "business",
        "director",
        "stakeholder",
        "corporate governance",
        "stock",
        "securities",
        "investment",
        "partnership",
        "liquidation"
      ],
      "family": [
        "family",
        "divorce",
        "child custody",
        "marriage",
        "alimony",
        "maintenance",
        "domestic violence",
        "adoption",
        "guardianship",
        "inheritance",
        "succession",
        "spousal support",
        "family court"
      ],
      "labour": [
        "labour",
        "employment",
        "worker",
        "wage",
        "strike",
        "union",
        "industrial dispute",
        "termination",
        "retrenchment",
        "labour court",
        "employment contract",
        "compensation",
        "gratuity",
        "pension"
      ],
      "constitutional": [
        "constitutional",
        "fundamental rights",
        "writ petition",
        "government",
        "legislation",
        "constitution",
        "public interest",
        "judicial review",
        "supreme court",
        "high court",
        "statutory",
        "mandamus",
        "habeas corpus",
        "article"
      ],
      "intellectual_property": [
        "intellectual property",
        "patent",
        "trademark",
        "copyright",
        "infringement",
        "licensing",
        "trade secret",
        "ipr",
        "design rights",
        "intellectual",
        "innovation",
        "patent office",
        "registration",
        "counterfeit"
      ],
      "tax": [
        "tax",
        "income tax",
        "gst",
        "tax evasion",
        "taxation",
        "revenue",
        "assessment",
        "customs",
        "excise",
        "audit",
        "refund",
        "deduction",
        "compliance",
        "tax liability",
        "taxpayer",
        "tax code"
      ]
    };

    final Map<String, int> matchCount = {
      for (var key in caseTypes.keys) key: 0,
    };

    for (var caseType in caseTypes.keys) {
      for (var keyword in caseTypes[caseType]!) {
        final regex = RegExp(r'\b' + RegExp.escape(keyword) + r'\b');
        matchCount[caseType] =
            matchCount[caseType]! + regex.allMatches(text).length;
      }
    }

    // Identify the case type with the highest match count
    String identifiedCaseType =
        matchCount.entries.reduce((a, b) => a.value >= b.value ? a : b).key;

    if (matchCount[identifiedCaseType]! > 0) {
      return identifiedCaseType
          .replaceAll('_', ' ')
          .split(' ')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ');
    } else {
      return "Other";
    }
  }
}
