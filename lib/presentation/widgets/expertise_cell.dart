import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';

class ExpertiseCell extends StatelessWidget {
  final Size screenSize;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;

  const ExpertiseCell({
    super.key,
    required this.screenSize,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1b1d24),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: design.black.withOpacity(0.2),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(
          screenSize.width < 800
              ? 0.04 * screenSize.width
              : 0.02 * screenSize.width,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: screenSize.width < 800
                      ? screenSize.width * 0.15
                      : screenSize.width * 0.035,
                  color: design.white,
                ),
                SizedBox(width: 0.015 * screenSize.width),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenSize.width < 800
                          ? screenSize.width * 0.50
                          : screenSize.width * 0.15,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: color,
                            width: 6.0,
                          ),
                        ),
                      ),
                      child: AutoSizeText(
                        title,
                        style: design
                            .h3()
                            .copyWith(
                                fontSize: screenSize.width < 800
                                    ? 0.035 * screenSize.width
                                    : 0.02 * screenSize.width)
                            .fontHeight(screenSize.width < 800
                                ? 0.02 * screenSize.width
                                : 0.015 * screenSize.width),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width < 800
                          ? screenSize.width * 0.50
                          : screenSize.width * 0.15,
                      child: AutoSizeText(
                        subtitle,
                        style: design.h3().copyWith(
                              fontSize: screenSize.width < 800
                                  ? 0.035 * screenSize.width
                                  : 0.02 * screenSize.width,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 0.02 * screenSize.width),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  "Text(",
                  style: design
                      .h4()
                      .copyWith(
                        color: const Color(0xff48a6e4),
                        fontSize: screenSize.width < 800
                            ? 0.035 * screenSize.width
                            : 0.02 * screenSize.width,
                      )
                      .fontHeight(24.0),
                ),
                SizedBox(height: 0.01 * screenSize.width),
                Padding(
                  padding: EdgeInsets.only(left: 0.015 * screenSize.width),
                  child: SizedBox(
                    width: screenSize.width < 800
                        ? screenSize.width * 0.58
                        : screenSize.width * 0.18,
                    child: AutoSizeText(
                      "\"$description\"",
                      // textAlign: TextAlign.center,
                      style: design.paragraphS().copyWith(
                            fontSize: screenSize.width < 800
                                ? 0.035 * screenSize.width
                                : 0.02 * screenSize.width,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 0.01 * screenSize.width),
                AutoSizeText(
                  ")",
                  style: design
                      .h4()
                      .copyWith(
                        color: const Color(0xff48a6e4),
                        fontSize: screenSize.width < 800
                            ? 0.035 * screenSize.width
                            : 0.02 * screenSize.width,
                      )
                      .fontHeight(24.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
