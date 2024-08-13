import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/presentation/widgets/project_card_list.dart';

import '../../design_system.dart';
import '../../model/project.dart';
import '../../utils.dart';
import 'dialog_content_column.dart';
import 'dialog_content_row.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final String locale;

  const ProjectCard({
    required this.project,
    super.key,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              titlePadding: const EdgeInsets.all(22),
              scrollable: true,
              backgroundColor: design.terciary500,
              title: Text(project.title, style: design.h3()),
              content: project.isWeb
                  ? DialogContentColumn(project: project)
                  : screenSize.width < 850
                      ? DialogContentColumn(project: project)
                      : DialogContentRow(project: project),
              actions: [
                TextButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.code,
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
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        color: design.terciary500,
        child: Padding(
          padding: EdgeInsets.all(
            screenSize.width > 850
                ? 0.018 * screenSize.width
                : 0.025 * screenSize.width,
          ),
          child: !project.isWeb
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      project.imageUrl,
                      width: screenSize.width > 850
                          ? 0.15 * screenSize.width
                          : 0.3 * screenSize.width,
                    ),
                    SizedBox(
                        width: screenSize.width > 850
                            ? 0.025 * screenSize.height
                            : 0.03 * screenSize.height),
                    ProjectCardList(
                      project: project,
                      locale: locale,
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      project.imageUrl,
                      height: screenSize.width > 850 && project.isWeb
                          ? 0.13 * screenSize.width
                          : 0.3 * screenSize.width,
                    ),
                    SizedBox(height: 0.02 * screenSize.height),
                    ProjectCardList(
                      project: project,
                      locale: locale,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
