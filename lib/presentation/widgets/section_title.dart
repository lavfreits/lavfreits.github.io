import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.screenSize,
    required this.title,
    required this.style,
  });

  final Size screenSize;
  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(
        title,
        style: style.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: getFontSize(
            0.05,
            screenSize,
          ),
        ),
      ),
    );
  }

  double getFontSize(double ratio, Size screenSize) => ratio * screenSize.width;
}
