import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/presentation/widgets/expertise_cell.dart';
import 'package:portifolio/presentation/widgets/project_card.dart';
import 'package:portifolio/utils.dart';

import '../container/localization.dart';
import '../design_system.dart';
import '../model/project.dart';
import 'widgets/build_drawer.dart';
import 'widgets/build_experience_card.dart';
import 'widgets/build_language_tool.dart';

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

    List<Widget> expertiseList = [
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

    return LayoutBuilder(
      builder: (context, constraints) {
        print("width: ${constraints.maxWidth} ${constraints.maxHeight}");
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: design.secondary500,
          endDrawer: const BuildDrawer(),
          body: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
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
                                  BuildLanguageTool(
                                    onTap: (String locale) => setState(
                                      () {
                                        context
                                            .read<CurrentLocaleCubit>()
                                            .emit(locale);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 35),
                                  IconButton(
                                    icon: Icon(Icons.menu,
                                        size: 40, color: design.white),
                                    onPressed: () => _scaffoldKey.currentState!
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
                            children: expertiseList,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: expertiseList,
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
                  SizedBox(height: 0.1 * screenSize.height),
                  GridView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.05 * screenSize.width,
                    ),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenSize.width < 850 ? 1 : 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      childAspectRatio:
                          screenSize.width < 500 || screenSize.width > 1100
                              ? 1
                              : screenSize.width < 850
                                  ? 1.3
                                  : 0.8,
                    ),
                    children: projects
                        .map((project) => ProjectCard(project: project))
                        .toList(),
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
                  BuildExperienceCard(
                    title: i18n.softwareAnalystAndDeveloper,
                    description: i18n.softwareAnalystAndDeveloperDesc,
                    date: "2024",
                    skills: i18n.analystSkills,
                    isExpanded: analystExpanded,
                    onTap: () => setState(
                      () => analystExpanded = !analystExpanded,
                    ),
                  ),
                  BuildExperienceCard(
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
                  Container(
                    height: 0.5 * screenSize.height,
                    padding: getPadding(
                      0.2 * screenSize.width,
                      0.05 * screenSize.width,
                    ),
                    color: design.terciary500,
                    child: Column(
                      children: [
                        if (screenSize.width < 700) ...[
                          AutoSizeText(
                            i18n.contactMeDesc,
                            style:
                                design.h3().copyWith(fontSize: 24, height: 1.7),
                          ),
                          SizedBox(height: 0.05 * screenSize.height),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (screenSize.width > 700) ...[
                              SizedBox(
                                width: 0.5 * screenSize.width,
                                child: AutoSizeText(
                                  i18n.contactMeDesc,
                                  style: design
                                      .h3()
                                      .copyWith(fontSize: 24, height: 1.7),
                                ),
                              ),
                              SizedBox(width: 0.05 * screenSize.width),
                            ],
                            TextButton.icon(
                              icon: const Icon(Icons.email),
                              onPressed: () {
                                launchURL("mailto:llimafreitas@gmail.com");
                              },
                              label: const Text('Email'),
                            ),
                            TextButton.icon(
                              icon: const FaIcon(FontAwesomeIcons.linkedin),
                              onPressed: () {
                                launchURL(
                                    "https://www.linkedin.com/in/lavinia-lima-de-freitas/");
                              },
                              label: const Text('Linkedin'),
                            ),
                            TextButton.icon(
                              icon: const FaIcon(FontAwesomeIcons.linkedin),
                              onPressed: () {
                                launchURL("https://github.com/lavfreits");
                              },
                              label: const Text('Github'),
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.location_on),
                              onPressed: () {},
                              label: const Text('Localização'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
