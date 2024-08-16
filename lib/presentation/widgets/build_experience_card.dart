import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';

class BuildExperienceCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool isExpanded;
  final Function onTap;
  final String skills;

  const BuildExperienceCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.isExpanded,
    required this.onTap,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    double getFontSize(double ratio) => ratio * screenSize.width;

    EdgeInsets getPadding(double horizontal, double vertical) =>
        EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

    return Padding(
      padding: getPadding(
          screenSize.width > 1100
              ? 0.2 * screenSize.width
              : 0.1 * screenSize.width,
          0.02 * screenSize.width),
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
                    ? screenSize.width <= 400
                        ? 0.2 * screenSize.width
                        : 0.1 * screenSize.width
                    : 0.05 * screenSize.width,
                width: screenSize.width * 0.85,
                decoration: BoxDecoration(
                  color: design.primary300,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.5,
                      child: AutoSizeText(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxFontSize: 35,
                        style: design.h3().copyWith(
                              fontSize: getFontSize(
                                screenSize.width < 800 ? 0.025 : 0.02,
                              ),
                            ),
                      ),
                    ),
                    Icon(
                      Icons.remove,
                      size: getFontSize(0.013),
                      color: Colors.white,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "Macaw Technology",
                          maxFontSize: 25,
                          style: design.h3().copyWith(
                                fontSize: getFontSize(
                                  screenSize.width < 800 ? 0.03 : 0.015,
                                ),
                              ),
                        ),
                        AutoSizeText(
                          date,
                          maxFontSize: 20,
                          style: design.paragraphS().copyWith(
                                fontSize: getFontSize(0.02),
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getFontSize(
                        screenSize.width < 800 ? 0.025 : 0.02,
                      ),
                    ),
                    AutoSizeText(
                      description,
                      maxFontSize: 20,
                      minFontSize: 12,
                      style: design.paragraphS().copyWith(
                            fontSize: getFontSize(
                              screenSize.width < 800 ? 0.025 : 0.015,
                            ),
                          ),
                    ),
                    AutoSizeText(
                      skills,
                      maxFontSize: 20,
                      minFontSize: 11,
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
}
