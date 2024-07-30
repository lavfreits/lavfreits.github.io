import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../container/localization.dart';
import '../../design_system.dart';

class BuildDrawer extends StatelessWidget {
  final Function(String) onItemTap;

  const BuildDrawer({
    super.key,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;
    final i18n = HomeViewI18n(context);

    return Drawer(
      backgroundColor: design.secondary500,
      child: ListView(
        padding: EdgeInsets.only(top: screenSize.height * 0.25),
        children: i18n.items
            .map((item) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                    title: AutoSizeText(item, style: design.h3()),
                    onTap: () => onItemTap(item),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
