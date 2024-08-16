import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../design_system.dart';
import '../../model/project.dart';
import '../../utils.dart';

class ProjectCardList extends StatelessWidget {
  final Project project;
  final String locale;
  final VoidCallback openProjectDetails;

  const ProjectCardList({
    super.key,
    required this.project,
    required this.locale,
    required this.openProjectDetails,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width < 400 || project.isWeb
          ? 0.85 * screenSize.width
          : screenSize.width > 850
              ? screenSize.width > 1100 && !project.isWeb
                  ? 0.15 * screenSize.width
                  : 0.2 * screenSize.width
              : 0.45 * screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            project.title,
            softWrap: true,
            maxFontSize: 30,
            style: design.h3().copyWith(
                  fontSize:
                      screenSize.width > 850 ? 0.027 * screenSize.width : 24,
                ),
          ),
          SizedBox(
            height: project.isWeb
                ? 0.015 * screenSize.height
                : screenSize.width > 1100
                    ? 0.02 * screenSize.height
                    : 0.01 * screenSize.height,
          ),
          Text(
            project.shortDescription,
            softWrap: true,
            maxLines: 6,
            style: design.paragraphS().copyWith(
                  fontSize: screenSize.width > 800 ? 16 : 14,
                ),
          ),
          SizedBox(
            height: screenSize.width > 800
                ? 0.02 * screenSize.height
                : 0.01 * screenSize.height,
          ),
          Text(
            project.technologies.join(", "),
            softWrap: true,
            maxLines: 3,
            style: design.labelM().copyWith(
                  fontSize: screenSize.width < 800 ? 13 : 15,
                ),
          ),
          SizedBox(
            height: screenSize.width > 800
                ? 0.02 * screenSize.height
                : 0.01 * screenSize.height,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.code,
                    size: 18,
                  ),
                  onPressed: () {
                    launchURL(project.repoUrl);
                  },
                  label: Text(
                    locale == "en" ? 'View Code' : 'Ver Código',
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: openProjectDetails,
                  child: Text(
                    locale == "en" ? 'More details' : 'Ver mais',
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
