import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portifolio/container/bloc_container.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../design_system.dart';
import '../model/localization.dart';
import '../service/localization_service.dart';
import '../utils.dart';
import 'widgets/build_drawer.dart';
import 'widgets/build_experience_card.dart';
import 'widgets/contact_section.dart';
import 'widgets/expertise_cell.dart';
import 'widgets/header_section.dart';
import 'widgets/project_card.dart';
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
  late AutoScrollController controller;
  String locale = "pt-br";

  late Future<Localization> _localizationFuture;
  final _localizationService = LocalizationService();

  @override
  void initState() {
    super.initState();
    _localizationFuture = _localizationService.fetchLocalizationData(locale);

    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
  }

  void _updateLocalization(String locale) {
    setState(() {
      this.locale = locale;
      _localizationFuture = _localizationService.fetchLocalizationData(locale);
      context.read<CurrentLocaleCubit>().changeLanguage(locale);
    });
  }

  void scrollToSection(String section) {
    switch (section) {
      case "expertise" || "especialidade":
        scrollTo(1);
        break;
      case "work" || "trabalho":
        scrollTo(2);
        break;
      case "experience" || "experiência":
        scrollTo(3);
        break;
      case "contact" || "contato":
        scrollTo(4);
        break;
    }
  }

  void scrollTo(int index) async {
    await controller.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
    controller.highlight(index);
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        print("Screen width: ${screenSize.width}");
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: design.secondary500,
          endDrawer: FutureBuilder<Localization>(
            future: _localizationFuture,
            builder: (context, localizationSnapshot) {
              if (localizationSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (localizationSnapshot.hasError) {
                return Center(
                  child: Text('Error: ${localizationSnapshot.error}'),
                );
              } else if (!localizationSnapshot.hasData) {
                return const Center(
                  child: Text('No localization data available'),
                );
              }

              final i18n = localizationSnapshot.data!;
              return BuildDrawer(
                onItemTap: (section) {
                  Navigator.pop(context);
                  scrollToSection(section);
                },
                i18n: i18n,
              );
            },
          ),
          body: FutureBuilder<Localization>(
            future: _localizationFuture,
            builder: (context, localizationSnapshot) {
              if (localizationSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (localizationSnapshot.hasError) {
                return Center(
                  child: Text('Error: ${localizationSnapshot.error}'),
                );
              } else if (!localizationSnapshot.hasData) {
                return const Center(
                  child: Text('No localization data available'),
                );
              }

              final i18n = localizationSnapshot.data!;

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

              return CustomScrollView(
                controller: controller,
                shrinkWrap: true,
                slivers: [
                  SliverList.list(
                    children: [
                      HeaderSection(
                        i18n: i18n,
                        onChangeLanguage: _updateLocalization,
                      ),
                      SizedBox(height: screenSize.height * 0.1),
                      _wrapScrollTag(
                        child: SectionTitle(
                          screenSize: screenSize,
                          title: i18n.expertise,
                          style: design.h2(),
                        ),
                        index: 1,
                      ),
                      SizedBox(height: screenSize.height * 0.1),
                      Padding(
                        padding: getPadding(0.1 * screenSize.width, 0),
                        child: screenSize.width < 800
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: expertiseList,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: expertiseList,
                              ),
                      ),
                      SizedBox(height: screenSize.height * 0.1),
                      _wrapScrollTag(
                        index: 2,
                        child: SectionTitle(
                          screenSize: screenSize,
                          title: i18n.myWork,
                          style: design.h1(),
                        ),
                      ),
                      SizedBox(height: 0.1 * screenSize.height),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.1 * screenSize.width,
                        ),
                        child: AutoSizeText(
                          i18n.myWorkDesc,
                          minFontSize: 10,
                          maxFontSize: 30,
                          style: design.paragraphS().copyWith(
                                fontSize: screenSize.width < 800
                                    ? 0.035 * screenSize.width
                                    : 0.02 * screenSize.width,
                              ),
                        ),
                      ),
                      SizedBox(height: 0.1 * screenSize.height),
                      GridView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width > 1100
                              ? 0.1 * screenSize.width
                              : 0.05 * screenSize.width,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenSize.width < 850 ? 1 : 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                          childAspectRatio: screenSize.width < 850
                              ? screenSize.width < 500
                                  ? screenSize.width <= 400
                                      ? screenSize.width <= 300
                                          ? 0.4
                                          : 0.5
                                      : 1.1
                                  : 1.2
                              : screenSize.width > 1030
                                  ? 1
                                  : 0.8,
                        ),
                        itemBuilder: (context, index) {
                          return ProjectCard(
                            project: i18n.projects[index],
                            locale: locale,
                          );
                        },
                        itemCount: i18n.projects.length,
                      ),
                      SizedBox(height: 0.1 * screenSize.height),
                      _wrapScrollTag(
                        index: 3,
                        child: SectionTitle(
                          screenSize: screenSize,
                          title: i18n.professionalExperience,
                          style: design.h1(),
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
                      _wrapScrollTag(
                        index: 4,
                        child: ContactSection(
                          i18n: i18n,
                          locale: locale,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _wrapScrollTag({
    required int index,
    required Widget child,
  }) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
      );
}
