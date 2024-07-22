import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portifolio/presentation/widgets/expertise_cell.dart';
import 'package:portifolio/presentation/widgets/project_card.dart';

import '../container/localization.dart';
import '../design_system.dart';
import '../model/project.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool developerExpanded = false;
  bool analystExpanded = false;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;
    final i18n = HomeViewI18n(context);

    double getFontSize(double ratio) => ratio * screenSize.width;
    EdgeInsets getPadding(double horizontal, double vertical) =>
        EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

    Widget buildDrawer() {
      return Drawer(
        backgroundColor: design.secondary500,
        child: ListView(
          padding: EdgeInsets.only(top: screenSize.height * 0.25),
          children: i18n.items
              .map((item) => Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListTile(
                      title: AutoSizeText(item, style: design.h3()),
                    ),
                  ))
              .toList(),
        ),
      );
    }

    Widget buildLanguageToggle() {
      return BlocBuilder<CurrentLocaleCubit, String>(
        builder: (context, locale) {
          return ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            isSelected: [locale == 'pt-br', locale == 'en'],
            onPressed: (index) {
              final newLocale = index == 0 ? 'pt-br' : 'en';
              setState(() {
                context.read<CurrentLocaleCubit>().emit(newLocale);
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'PT-BR',
                  style: TextStyle(
                    color: locale == 'pt-br' ? design.primary500 : design.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'EN',
                  style: TextStyle(
                    color: locale == 'en' ? design.primary500 : design.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    List<Widget> expertiseList() {
      return [
        ExpertiseCell(
          screenSize: screenSize,
          title: "Software",
          subtitle: "Development",
          color: design.primary300,
          description: i18n.softwareDevDesc, //todo
          icon: Icons.computer,
        ),
        const SizedBox(height: 20),
        ExpertiseCell(
          screenSize: screenSize,
          color: design.secondary300,
          title: "Flutter Dev",
          subtitle: "Android, iOS",
          description: i18n.flutterDevDesc,
          icon: Icons.phone_android,
        ),
        const SizedBox(height: 20),
        ExpertiseCell(
          screenSize: screenSize,
          color: design.secondary700,
          title: "Android Dev",
          subtitle: "Kotlin",
          description: i18n.androidDevDesc,
          icon: Icons.android,
        ),
      ];
    }

    Widget buildExperienceCard({
      required String title,
      required String description,
      required String date,
      required bool isExpanded,
      required Function onTap,
      required String skills,
    }) {
      return Padding(
        padding: getPadding(0.1 * screenSize.width, 0.02 * screenSize.width),
        child: Container(
          width: screenSize.width * 0.8,
          decoration: BoxDecoration(
            color: design.primary500,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => onTap(),
                child: Container(
                  padding: getPadding(
                    screenSize.width < 800
                        ? 0.035 * screenSize.width
                        : 0.015 * screenSize.width,
                    screenSize.width < 800
                        ? 0.035 * screenSize.width
                        : 0.015 * screenSize.width,
                  ),
                  height: screenSize.width < 800
                      ? 0.1 * screenSize.width
                      : 0.05 * screenSize.width,
                  width: screenSize.width * 0.85,
                  decoration: BoxDecoration(
                    color: design.primary300,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AutoSizeText(
                            title,
                            style: design.h3().copyWith(
                                  fontSize: getFontSize(
                                      screenSize.width < 800 ? 0.04 : 0.035),
                                ),
                          ),
                          const SizedBox(width: 20),
                          AutoSizeText(
                            date,
                            style: design.paragraphS().copyWith(
                                  fontSize: getFontSize(0.02),
                                ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          size: getFontSize(0.013),
                          color: Colors.white,
                        ),
                        onPressed: () => onTap(),
                      ),
                    ],
                  ),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: getPadding(
                    screenSize.width < 800
                        ? 0.05 * screenSize.width
                        : 0.04 * screenSize.width,
                    screenSize.width < 800
                        ? 0.03 * screenSize.width
                        : 0.025 * screenSize.width,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        "Macaw Technology",
                        style: design.h3().copyWith(
                              fontSize: getFontSize(
                                screenSize.width < 800 ? 0.03 : 0.015,
                              ),
                            ),
                      ),
                      SizedBox(
                        height: getFontSize(
                          screenSize.width < 800 ? 0.025 : 0.02,
                        ),
                      ),
                      AutoSizeText(
                        description,
                        style: design.paragraphS().copyWith(
                              fontSize: getFontSize(
                                screenSize.width < 800 ? 0.025 : 0.015,
                              ),
                            ),
                      ),
                      AutoSizeText(
                        skills,
                        style: design.labelM().copyWith(
                              fontSize: getFontSize(
                                screenSize.width < 800 ? 0.03 : 0.015,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: design.secondary500,
          endDrawer: buildDrawer(),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        Container(
                          width: screenSize.width,
                          height: screenSize.height,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('background-1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: screenSize.width,
                          height: screenSize.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(1),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    buildLanguageToggle(),
                                    const SizedBox(width: 35),
                                    IconButton(
                                      icon: Icon(Icons.menu,
                                          size: 40, color: design.white),
                                      onPressed: () => _scaffoldKey
                                          .currentState!
                                          .openEndDrawer(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.25),
                            Padding(
                              padding: getPadding(30, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  AutoSizeText(
                                    i18n.nameIntroduction,
                                    style: design
                                        .h1()
                                        .copyWith(fontSize: getFontSize(0.06))
                                        .fontHeight(getFontSize(0.065)),
                                  ),
                                  const SizedBox(height: 10),
                                  AutoSizeText(
                                    i18n.introduction,
                                    style: design
                                        .h3()
                                        .copyWith(fontSize: getFontSize(0.035))
                                        .fontHeight(getFontSize(0.04)),
                                  ),
                                  SizedBox(height: screenSize.height * 0.15),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.1),
                    Center(
                      child: AutoSizeText(
                        i18n.expertise,
                        style: design
                            .h2()
                            .copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: getFontSize(0.05))
                            .fontHeight(getFontSize(0.05)),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.1),
                    Padding(
                      padding: getPadding(0.1 * screenSize.width, 0),
                      child: screenSize.width < 800
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: expertiseList(),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: expertiseList(),
                            ),
                    ),
                    SizedBox(height: screenSize.height * 0.1),
                    Center(
                      child: Text(
                        i18n.myWork,
                        style: design
                            .h1()
                            .copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 0.06 * screenSize.width,
                            )
                            .fontHeight(0.05 * screenSize.width),
                      ),
                    ),
                    SizedBox(height: 0.1 * screenSize.height),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.1 * screenSize.width,
                      ),
                      child: AutoSizeText(
                        i18n.myWorkDesc,
                        style: design.paragraphS().copyWith(
                              fontSize: screenSize.width < 800
                                  ? 0.035 * screenSize.width
                                  : 0.02 * screenSize.width,
                            ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenSize.width < 800 ? 1 : 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ProjectCard(project: projects[index]);
                        },
                        childCount: projects.length,
                      ),
                    ),
                    SizedBox(height: 0.1 * screenSize.height),
                    Center(
                      child: Text(
                        i18n.professionalExperience,
                        style: design
                            .h1()
                            .copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 0.06 * screenSize.width,
                            )
                            .fontHeight(0.05 * screenSize.width),
                      ),
                    ),
                    SizedBox(height: 0.1 * screenSize.height),
                    buildExperienceCard(
                      title: i18n.softwareAnalystAndDeveloper,
                      description: i18n.softwareAnalystAndDeveloperDesc,
                      date: "2024",
                      skills: i18n.analystSkills,
                      isExpanded: analystExpanded,
                      onTap: () => setState(
                        () => analystExpanded = !analystExpanded,
                      ),
                    ),
                    buildExperienceCard(
                      title: i18n.mobileDeveloper,
                      description: i18n.mobileDeveloperDesc,
                      date: "2023 - 2024",
                      skills: i18n.mobileDeveloperSkills,
                      isExpanded: developerExpanded,
                      onTap: () => setState(
                        () => developerExpanded = !developerExpanded,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.1),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
