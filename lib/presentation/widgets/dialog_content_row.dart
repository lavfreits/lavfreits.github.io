import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';
import '../../model/project.dart';

class DialogContentRow extends StatelessWidget {
  final Project project;

  const DialogContentRow({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Row(
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
          height: screenSize.width > 800 ? 0.8 * screenSize.height : null,
          width: screenSize.width > 800 ? null : 0.9 * screenSize.width,
        ),
        SizedBox(width: 0.03 * screenSize.width),
        SizedBox(
          width: 0.3 * screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                project.detailedDescription,
                maxFontSize: 30,
                minFontSize: 12,
                style: design.paragraphS().copyWith(
                      fontSize: screenSize.width > 600
                          ? 0.018 * screenSize.width
                          : 0.022 * screenSize.width,
                    ),
              ),
              SizedBox(height: 0.1 * screenSize.height),
              AutoSizeText(
                project.technologies.join(", "),
                maxFontSize: 30,
                minFontSize: 12,
                style: design.labelS().copyWith(
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
