import 'package:auto_size_text/auto_size_text.dart';
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
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
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
              AutoSizeText(
                project.detailedDescription,
                minFontSize: 10,
                maxFontSize: 30,
                style: design.paragraphS().copyWith(
                    fontSize: screenSize.width > 600
                        ? 0.018 * screenSize.width
                        : 0.022 * screenSize.width),
              ),
              SizedBox(height: 0.05 * screenSize.height),
              AutoSizeText(
                project.technologies.join(", "),
                minFontSize: 10,
                maxFontSize: 30,
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
