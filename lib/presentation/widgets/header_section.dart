import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';
import '../../model/localization.dart';
import '../../utils.dart';
import 'build_language_tool.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.i18n,
    required this.onChangeLanguage,
  });

  final Localization i18n;
  final Function(String) onChangeLanguage;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Stack(
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
                      onTap: onChangeLanguage,
                      i18n: i18n,
                    ),
                    const SizedBox(width: 35),
                    IconButton(
                      icon: Icon(Icons.menu, size: 40, color: design.white),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
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
                        .copyWith(fontSize: getFontSize(0.06, screenSize))
                        .fontHeight(getFontSize(0.065, screenSize)),
                  ),
                  const SizedBox(height: 10),
                  AutoSizeText(
                    i18n.introduction,
                    style: design
                        .h3()
                        .copyWith(fontSize: getFontSize(0.035, screenSize))
                        .fontHeight(getFontSize(0.04, screenSize)),
                  ),
                  SizedBox(height: screenSize.height * 0.15),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  double getFontSize(double ratio, Size screenSize) => ratio * screenSize.width;
}
