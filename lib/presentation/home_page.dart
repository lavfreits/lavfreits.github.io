import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/presentation/widgets/expertise_cell.dart';

import '../container/localization.dart';
import '../design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;
    final i18n = HomeViewI18n(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        print(
            "maxheight: ${constraints.maxHeight} maxwidth: ${constraints.maxWidth}");
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: design.secondary500,
          endDrawer: Drawer(
            backgroundColor: design.secondary500,
            child: ListView(
              padding: EdgeInsets.only(top: screenSize.height * 0.25),
              children: i18n.items
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        title: AutoSizeText(
                          item,
                          style: design.h3(),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
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
                              child: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 40,
                                  color: design.white,
                                ),
                                onPressed: () =>
                                    _scaffoldKey.currentState!.openEndDrawer(),
                              ),
                            ),
                          ),
                          SizedBox(height: 1 / 4 * screenSize.height),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                AutoSizeText(
                                  i18n.nameIntroduction,
                                  style: design
                                      .h1()
                                      .copyWith(
                                        fontSize: 0.06 * screenSize.width,
                                      )
                                      .fontHeight(0.065 * screenSize.width),
                                ),
                                const SizedBox(height: 10),
                                AutoSizeText(
                                  i18n.introduction,
                                  style: design
                                      .h3()
                                      .copyWith(
                                        fontSize: 0.035 * screenSize.width,
                                      )
                                      .fontHeight(0.04 * screenSize.width),
                                ),
                                SizedBox(height: 0.15 * screenSize.height),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(
                        screenSize.width < 800
                            ? screenSize.width * 0.10
                            : screenSize.width * 0.03,
                      ),
                      child: AutoSizeText(
                        i18n.expertise,
                        style: design
                            .h2()
                            .copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 0.05 * screenSize.width,
                            )
                            .fontHeight(0.05 * screenSize.width),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0.10 * screenSize.width,
                    ),
                    child: screenSize.width < 800
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                subtitle: "Android, iOS, Web",
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
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ExpertiseCell(
                                screenSize: screenSize,
                                title: "Software",
                                subtitle: "Development",
                                color: design.primary300,
                                description: i18n.softwareDevDesc, //todo
                                icon: Icons.computer,
                              ),
                              ExpertiseCell(
                                screenSize: screenSize,
                                color: design.secondary300,
                                title: "Flutter Dev",
                                subtitle: "Android, iOS, Web",
                                description: i18n.flutterDevDesc,
                                icon: Icons.phone_android,
                              ),
                              ExpertiseCell(
                                screenSize: screenSize,
                                color: design.secondary700,
                                title: "Android Dev",
                                subtitle: "Kotlin",
                                description: i18n.androidDevDesc,
                                icon: Icons.android,
                              ),
                            ],
                          ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenSize.width * 0.4,
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
                            SizedBox(height: 0.03 * screenSize.width),
                            SizedBox(
                              width: screenSize.width * 0.4,
                              child: AutoSizeText(
                                i18n.myWorkDesc,
                                style: design.paragraphS().copyWith(
                                      fontSize: screenSize.width < 800
                                          ? 0.035 * screenSize.width
                                          : 0.02 * screenSize.width,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.45,
                        height: screenSize.height * 0.75,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('celular-flutter.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.02 * screenSize.width,
                      horizontal: screenSize.width < 800 ? 40 : 150,
                    ),
                    child: Container(
                      width: screenSize.width * 0.8,
                      decoration: expanded
                          ? BoxDecoration(
                              color: design.primary500,
                              borderRadius: BorderRadius.circular(10.0),
                            )
                          : null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                expanded = !expanded;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                screenSize.width < 800
                                    ? 0.035 * screenSize.width
                                    : 0.015 * screenSize.width,
                              ),
                              width: screenSize.width * 0.8,
                              decoration: BoxDecoration(
                                color: design.primary300,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: screenSize.width < 800
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText(
                                          "Macaw Technology",
                                          style: design.h3(),
                                        ),
                                        SizedBox(
                                          height: screenSize.width < 800
                                              ? 0.035 * screenSize.width
                                              : 0.02 * screenSize.width,
                                        ),
                                        AutoSizeText(
                                          "2023 - 2024",
                                          style: design.paragraphS().copyWith(
                                                fontSize: screenSize.width < 800
                                                    ? 0.035 * screenSize.width
                                                    : 0.02 * screenSize.width,
                                              ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            AutoSizeText(
                                              "Macaw Technology",
                                              style: design.h3(),
                                            ),
                                            const SizedBox(width: 20),
                                            AutoSizeText(
                                              "2023 - 2024",
                                              style: design.paragraphS(),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              expanded = !expanded;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          if (expanded) ...[
                            Padding(
                              padding: EdgeInsets.all(
                                screenSize.width < 800
                                    ? 0.025 * screenSize.width
                                    : 0.02 * screenSize.width,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AutoSizeText(
                                    i18n.softwareAnalystAndDeveloper,
                                    style: design.h3().copyWith(
                                          fontSize: screenSize.width < 800
                                              ? 0.035 * screenSize.width
                                              : 0.02 * screenSize.width,
                                        ),
                                  ),
                                  SizedBox(
                                    height: screenSize.width < 800
                                        ? 0.035 * screenSize.width
                                        : 0.02 * screenSize.width,
                                  ),
                                  AutoSizeText(
                                    i18n.softwareAnalystAndDeveloperDesc,
                                    style: design.paragraphS().copyWith(
                                          fontSize: screenSize.width < 800
                                              ? 0.035 * screenSize.width
                                              : 0.015 * screenSize.width,
                                        ),
                                  ),
                                  SizedBox(
                                    height: screenSize.width < 800
                                        ? 0.035 * screenSize.width
                                        : 0.02 * screenSize.width,
                                  ),
                                  AutoSizeText(
                                    i18n.mobileDeveloper,
                                    style: design.h3().copyWith(
                                          fontSize: screenSize.width < 800
                                              ? 0.035 * screenSize.width
                                              : 0.02 * screenSize.width,
                                        ),
                                  ),
                                  SizedBox(
                                    height: screenSize.width < 800
                                        ? 0.035 * screenSize.width
                                        : 0.02 * screenSize.width,
                                  ),
                                  AutoSizeText(
                                    i18n.mobileDeveloperDesc,
                                    style: design.paragraphS().copyWith(
                                          fontSize: screenSize.width < 800
                                              ? 0.035 * screenSize.width
                                              : 0.015 * screenSize.width,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
