import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';
import '../../model/localization.dart';

class BuildDrawer extends StatelessWidget {
  final Function(String) onItemTap;
  final Localization i18n;

  const BuildDrawer({
    super.key,
    required this.onItemTap,
    required this.i18n,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final screenSize = MediaQuery.of(context).size;

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
