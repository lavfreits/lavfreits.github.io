import 'project.dart';

class Localization {
  final String nameIntroduction;
  final String introduction;
  final String expertise;
  final String softwareDevDesc;
  final String flutterDevDesc;
  final String androidDevDesc;
  final String myWork;
  final String myWorkDesc;
  final String professionalExperience;
  final List<String> items;
  final String softwareAnalystAndDeveloper;
  final String softwareAnalystAndDeveloperDesc;
  final String analystSkills;
  final String mobileDeveloper;
  final String mobileDeveloperDesc;
  final String mobileDeveloperSkills;
  final String contactMeDesc;
  final List<Project> projects;

  Localization({
    required this.projects,
    required this.nameIntroduction,
    required this.introduction,
    required this.expertise,
    required this.softwareDevDesc,
    required this.flutterDevDesc,
    required this.androidDevDesc,
    required this.myWork,
    required this.myWorkDesc,
    required this.professionalExperience,
    required this.items,
    required this.softwareAnalystAndDeveloper,
    required this.softwareAnalystAndDeveloperDesc,
    required this.analystSkills,
    required this.mobileDeveloper,
    required this.mobileDeveloperDesc,
    required this.mobileDeveloperSkills,
    required this.contactMeDesc,
  });

  factory Localization.fromJson(
          Map<String, dynamic> json, String localization) =>
      Localization(
        nameIntroduction: json['home'][localization],
        introduction: json['introduction'][localization],
        expertise: json['expertise'][localization],
        softwareDevDesc: json['softwareDevDesc'][localization],
        flutterDevDesc: json['flutterDevDesc'][localization],
        androidDevDesc: json['androidDevDesc'][localization],
        myWork: json['myWork'][localization],
        myWorkDesc: json['myWorkDesc'][localization],
        professionalExperience: json['professionalExperience'][localization],
        items: List<String>.from(json['items'][localization]),
        softwareAnalystAndDeveloper: json['softwareAnalystAndDeveloper']
            [localization],
        softwareAnalystAndDeveloperDesc: json['softwareAnalystAndDeveloperDesc']
            [localization],
        analystSkills: json['analystSkills'][localization],
        mobileDeveloper: json['mobileDeveloper'][localization],
        mobileDeveloperDesc: json['mobileDeveloperDesc'][localization],
        mobileDeveloperSkills: json['mobileDeveloperSkills'][localization],
        contactMeDesc: json['contactMeDesc'][localization],
        projects: (json['projects'] as List)
            .map((proj) => Project.fromJson(proj, localization))
            .toList(),
      );
}
