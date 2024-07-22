import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/presentation/home_page.dart';

import 'container/localization.dart';
import 'design_system.dart';
import 'design_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DesignSystem(
      playBankDesign: design,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return MaterialApp(
                title: 'portifolio',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: design.primary300,
                  textTheme: GoogleFonts.poppinsTextTheme().apply(
                    bodyColor: design.white,
                    fontFamily: design.fontFamily,
                  ),
                ),
                home: const LocalizationContainer(
                  child: HomePage(),
                ),
                // supportedLocales: const [
                //   Locale('en', 'US'),
                //   Locale('pt', 'BR'),
                // ],
              );
            },
          );
        },
      ),
    );
  }
}
