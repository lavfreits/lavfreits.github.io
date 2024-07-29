import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../design_system.dart';
import '../../model/project.dart';

class ProjectCardList extends StatelessWidget {
  final Project project;

  const ProjectCardList({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: project.isWeb
          ? 0.45 * screenSize.width
          : screenSize.width > 850
              ? 0.20 * screenSize.width
              : 0.42 * screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            project.title,
            style: design.h3().copyWith(
                  fontSize:
                      screenSize.width > 850 ? 0.027 * screenSize.width : 24,
                ),
          ),
          SizedBox(
            height: project.isWeb
                ? 0.025 * screenSize.height
                : 0.05 * screenSize.height,
          ),
          Text(
            project.short_description,
            style: design.paragraphS().copyWith(
                  fontSize: screenSize.width > 800 ? 16 : 14,
                ),
          ),
          SizedBox(height: 0.03 * screenSize.height),
          Text(
            project.technologies.join(", "),
            style: design.labelM().copyWith(
                  fontSize: screenSize.width < 800 ? 13 : 15,
                ),
          ),
          SizedBox(height: 0.03 * screenSize.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                icon: const Icon(
                  Icons.code,
                ),
                onPressed: () {
                  launchURL(project.repoUrl);
                },
                label: const Text(
                  'Ver Código',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Não foi possível abrir a URL: $url';
  }
}
