import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portifolio/presentation/widgets/contact_section.dart';
import 'package:portifolio/presentation/widgets/expertise_cell.dart';
import 'package:portifolio/presentation/widgets/project_card.dart';
import 'package:portifolio/utils.dart';

import '../container/localization.dart';
import '../design_system.dart';
import '../model/project.dart';
import 'widgets/build_drawer.dart';
import 'widgets/build_experience_card.dart';
import 'widgets/header_section.dart';
import 'widgets/section_title.dart';

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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(String section) {
    switch (section) {
      case "expertise" || "especialidade":
        scrollTo(28);
        break;
      case "work" || "trabalho":
        scrollTo(39);
        break;
      case "experience" || "experiência":
        scrollTo(99);
        break;
      case "contact" || "contato":
        scrollTo(120);
        break;
    }
  }

  final ScrollController scrollController = ScrollController();

  void scrollTo(int index) {
    const double h = 50.0;
    final double sh = MediaQuery.of(context).size.height;
    final double middlePosition = (sh / 2) - (h / 2);

    final double position = (index * h) - middlePosition;
    scrollController.animateTo(
      position,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;
    final i18n = HomeViewI18n(context);

    List<Widget> expertiseList = [
      ExpertiseCell(
        screenSize: screenSize,
        title: "Software",
        subtitle: "Development",
        color: design.primary300,
        description: i18n.softwareDevDesc,
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
          endDrawer: BuildDrawer(
            onItemTap: (section) {
              Navigator.pop(context);

              scrollToSection(section);
            },
          ),
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverList.list(
                children: [
                  HeaderSection(
                    i18n: i18n,
                    onChangeLanguage: (String locale) {
                      setState(
                        () {
                          context.read<CurrentLocaleCubit>().emit(locale);
                        },
                      );
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.1),
                  SectionTitle(
                    screenSize: screenSize,
                    title: i18n.expertise,
                    style: design.h2(),
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
                  SectionTitle(
                    screenSize: screenSize,
                    title: i18n.myWork,
                    style: design.h1(),
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
                      horizontal: screenSize.width > 1100
                          ? 0.1 * screenSize.width
                          : 0.05 * screenSize.width,
                    ),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenSize.width < 850 ? 1 : 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      childAspectRatio: screenSize.width < 850
                          ? screenSize.width < 500
                              ? 1.1
                              : 1.2
                          : screenSize.width > 1030
                              ? 1
                              : 0.8,
                    ),
                    children: projects
                        .map((project) => ProjectCard(project: project))
                        .toList(),
                  ),
                  SizedBox(height: 0.1 * screenSize.height),
                  SectionTitle(
                    screenSize: screenSize,
                    title: i18n.professionalExperience,
                    style: design.h1(),
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
                  const ContactSection(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
