import 'package:flutter/material.dart';

import '../../design_system.dart';
import '../../model/project.dart';

class DialogContentColumn extends StatelessWidget {
  final Project project;

  const DialogContentColumn({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Image.network(
          project.imageUrl,
          width: screenSize.width < 600 && project.isWeb
              ? 0.8 * screenSize.width
              : 0.4 * screenSize.width,
        ),
        SizedBox(height: 0.04 * screenSize.height),
        SizedBox(
          width: 0.55 * screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.detailedDescription,
                style: design.paragraphS().copyWith(
                    fontSize: screenSize.width > 600
                        ? 0.018 * screenSize.width
                        : 0.022 * screenSize.width),
              ),
              SizedBox(height: 0.05 * screenSize.height),
              Text(
                project.technologies.join(", "),
                style: design.labelM().copyWith(
                      fontSize: screenSize.width > 600
                          ? 0.017 * screenSize.width
                          : 0.023 * screenSize.width,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
