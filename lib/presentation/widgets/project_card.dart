import 'package:flutter/material.dart';
import 'package:portifolio/presentation/widgets/project_card_list.dart';

import '../../design_system.dart';
import '../../model/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    required this.project,
    super.key,
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
                title: Text(project.title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      project.imageUrl[0],
                      width: 300,
                    ),
                    SizedBox(height: 0.04 * screenSize.height),
                    Text(
                      project.detailed_description,
                      style: design.paragraphS(),
                    ),
                    SizedBox(height: 0.04 * screenSize.height),
                    Text(
                      project.technologies.join(", "),
                      style: design.paragraphS(),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'),
                  ),
                ],
              );
            });
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
                      project.imageUrl[0],
                      width: screenSize.width > 850
                          ? 0.15 * screenSize.width
                          : 0.3 * screenSize.width,
                    ),
                    SizedBox(
                        width: screenSize.width > 850
                            ? 0.025 * screenSize.height
                            : 0.03 * screenSize.height),
                    ProjectCardList(project: project),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      project.imageUrl[0],
                      height: 0.2 * screenSize.width,
                    ),
                    SizedBox(height: 0.01 * screenSize.width),
                    ProjectCardList(project: project),
                  ],
                ),
        ),
      ),
    );
  }
}
