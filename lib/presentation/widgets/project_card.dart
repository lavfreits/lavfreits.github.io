import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(project.imageUrl[0]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: design.h2(),
                ),
                const SizedBox(height: 8.0),
                Text(
                  project.description,
                  style: design.paragraphS(),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        launchURL(project.repoUrl);
                      },
                      child: const Text('Ver Código'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }
}
