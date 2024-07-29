import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../container/localization.dart';
import '../../design_system.dart';

class BuildLanguageTool extends StatefulWidget {
  final void Function(String) onTap;

  const BuildLanguageTool({
    super.key,
    required this.onTap,
  });

  @override
  State<BuildLanguageTool> createState() => _BuildLanguageToolState();
}

class _BuildLanguageToolState extends State<BuildLanguageTool> {
  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return BlocBuilder<CurrentLocaleCubit, String>(
      builder: (context, locale) {
        return ToggleButtons(
          borderRadius: BorderRadius.circular(20),
          isSelected: [locale == 'pt-br', locale == 'en'],
          onPressed: (index) {
            final newLocale = index == 0 ? 'pt-br' : 'en';

            widget.onTap(newLocale);
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'PT-BR',
                style: TextStyle(
                  color: locale == 'pt-br' ? design.primary500 : design.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'EN',
                style: TextStyle(
                  color: locale == 'en' ? design.primary500 : design.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    ;
  }
}
