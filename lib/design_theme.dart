import 'package:flutter/material.dart';

import 'design_system.dart';

final design = Design(
  primary300: const Color(0xfff5554a),
  primary500: const Color(0xfff5554a).withOpacity(0.5),
  primary700: const Color(0xffdb3c30),
  secondary300: const Color(0xff5ec7f6),
  secondary500: const Color(0xff1a191d),
  secondary700: const Color(0xff34a752),
  terciary300: const Color(0xffDEDFE3),
  terciary500: const Color(0xff1b1d24),
  terciary700: const Color(0xff7B7C81),
  white: const Color(0xffFFFFFF),
  black: const Color(0xff000000),
  gray: const Color(0xffF5F6FA),
  heading1: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 96,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: -0.33,
  ).fontHeight(105.0),
  heading2: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 60.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.33,
  ).fontHeight(36.0),
  heading3: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.33,
  ).fontHeight(30.0),
  heading4: const TextStyle(
    fontSize: 24.0, //todo letra de cogigo também
    fontWeight: FontWeight.w600,
    letterSpacing: -0.33,
  ).fontHeight(24.0),
  heading5: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.33,
  ).fontHeight(21.0),
  heading6: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.33,
  ).fontHeight(18.0),
  subtitle: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.33,
  ).fontHeight(18.0),
  labelMedium: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.33,
  ).fontHeight(30.0),
  labelSmall: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.33,
  ).fontHeight(24.0),
  paragraphMedium: const TextStyle(
    ///todo body é pra ser letra de código
    fontFamily: 'Poppins',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.40,
  ).fontHeight(24.0),
  paragraphSmall: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 1,
  ).fontHeight(30.0),
  caption: const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.33,
  ).fontHeight(15.0),
);
