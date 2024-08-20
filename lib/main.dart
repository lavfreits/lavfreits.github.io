import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/presentation/home.dart';

import 'container/bloc_container.dart';
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
      child: MaterialApp(
        title: 'Portifólio - Lavínia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: design.primary300,
          textTheme: GoogleFonts.poppinsTextTheme().apply(
            bodyColor: design.white,
            displayColor: design.white,
            fontFamily: design.fontFamily,
          ),
        ),
        home: const LocalizationContainer(
          child: HomePage(),
        ),
      ),
    );
  }
}
