import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignSystem extends InheritedWidget {
  final Design playBankDesign;

  const DesignSystem({
    super.key,
    required this.playBankDesign,
    required super.child,
  });

  static Design of(BuildContext context) {
    final layerDesign = context
        .dependOnInheritedWidgetOfExactType<DesignSystem>()
        ?.playBankDesign;

    assert(layerDesign != null, 'No PlayBankDesign found in context.');

    return layerDesign!;
  }

  @override
  bool updateShouldNotify(DesignSystem oldWidget) {
    return playBankDesign != oldWidget.playBankDesign;
  }
}

/// Example class
class Design {
  /// [Primary Color]
  final Color primary300;
  final Color primary500;
  final Color primary700;

  /// [Secondary Color]
  final Color secondary300;
  final Color secondary500;
  final Color secondary700;

  /// [Terciary Color]
  final Color terciary300;
  final Color terciary500;
  final Color terciary700;

  /// [White]
  final Color white;

  /// [Black]
  final Color black;

  /// [Grey]
  final Color gray;

  /// [Text styles / Typography] - Defined on `Figma`
  /// Defaults to `Figtree`
  final String fontFamily;

  /// [Headings]
  final TextStyle _heading1;
  final TextStyle _heading2;
  final TextStyle _heading3;
  final TextStyle _heading4;
  final TextStyle _heading5;
  final TextStyle _heading6;

  /// [Subtitle, Paragraph, Caption]
  final TextStyle _subtitle;
  final TextStyle _labelMedium;
  final TextStyle _labelSmall;
  final TextStyle _paragraphMedium;
  final TextStyle _paragraphSmall;
  final TextStyle _caption;

  const Design({
    this.fontFamily = 'Poppins',
    required this.primary300,
    required this.primary500,
    required this.primary700,
    required this.secondary300,
    required this.secondary500,
    required this.secondary700,
    required this.terciary300,
    required this.terciary500,
    required this.terciary700,
    required this.white,
    required this.black,
    required this.gray,
    required TextStyle heading1,
    required TextStyle heading2,
    required TextStyle heading3,
    required TextStyle heading4,
    required TextStyle heading5,
    required TextStyle heading6,
    required TextStyle subtitle,
    required TextStyle labelMedium,
    required TextStyle labelSmall,
    required TextStyle paragraphMedium,
    required TextStyle paragraphSmall,
    required TextStyle caption,
  })  : _heading1 = heading1,
        _heading2 = heading2,
        _heading3 = heading3,
        _heading4 = heading4,
        _heading5 = heading5,
        _heading6 = heading6,
        _subtitle = subtitle,
        _labelMedium = labelMedium,
        _labelSmall = labelSmall,
        _paragraphMedium = paragraphMedium,
        _paragraphSmall = paragraphSmall,
        _caption = caption;

  Design copyWith({
    Color? primary300,
    Color? primary500,
    Color? primary700,
    Color? secondary300,
    Color? secondary500,
    Color? secondary700,
    Color? terciary300,
    Color? terciary500,
    Color? terciary700,
    Color? white,
    Color? black,
    Color? gray,
    LinearGradient? gradient,
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? heading6,
    TextStyle? subtitle,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? paragraphMedium,
    TextStyle? paragraphSmall,
    TextStyle? caption,
  }) {
    return Design(
      primary300: primary300 ?? this.primary300,
      primary500: primary500 ?? this.primary500,
      primary700: primary700 ?? this.primary700,
      secondary300: secondary300 ?? this.secondary300,
      secondary500: secondary500 ?? this.secondary500,
      secondary700: secondary700 ?? this.secondary700,
      terciary300: terciary300 ?? this.terciary300,
      terciary500: terciary500 ?? this.terciary500,
      terciary700: terciary700 ?? this.terciary700,
      white: white ?? this.white,
      black: black ?? this.black,
      gray: gray ?? this.gray,
      heading1: heading1 ?? _heading1,
      heading2: heading2 ?? _heading2,
      heading3: heading3 ?? _heading3,
      heading4: heading4 ?? _heading4,
      heading5: heading5 ?? _heading5,
      heading6: heading6 ?? _heading6,
      subtitle: subtitle ?? _subtitle,
      labelMedium: labelMedium ?? _labelMedium,
      labelSmall: labelSmall ?? _labelSmall,
      paragraphMedium: paragraphMedium ?? _paragraphMedium,
      paragraphSmall: paragraphSmall ?? _paragraphSmall,
      caption: caption ?? _caption,
    );
  }

  /// [Headings]
  TextStyle h1({Color? color}) => _getStyle(_heading1, color);

  TextStyle h2({Color? color}) => _getStyle(_heading2, color);

  TextStyle h3({Color? color}) => _getStyle(_heading3, color);

  TextStyle h4({Color? color}) => _getStyle(_heading4, color);

  TextStyle h5({Color? color}) => _getStyle(_heading5, color);

  TextStyle h6({Color? color}) => _getStyle(_heading6, color);

  /// [Subtitle, Paragraph, Caption]
  TextStyle subtitle({Color? color}) => _getStyle(_subtitle, color);

  TextStyle labelM({Color? color}) => _getStyle(_labelMedium, color);

  TextStyle labelS({Color? color}) => _getStyle(_labelSmall, color);

  TextStyle paragraphM({Color? color}) => _getStyle(_paragraphMedium, color);

  TextStyle paragraphS({Color? color}) => _getStyle(_paragraphSmall, color);

  TextStyle caption({Color? color}) => _getStyle(_caption, color);

  TextStyle _getStyle(TextStyle style, Color? color) {
    return GoogleFonts.getFont(
      style.fontFamily ?? fontFamily,
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      height: style.height,
      letterSpacing: style.letterSpacing,
      color: color ?? white,
    );
  }

  ThemeData buildThemeData() => ThemeData.from(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primary500,
          secondary: secondary500,
          tertiary: terciary500,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.black,
          onError: Colors.black,
          surface: Colors.black,
          onSurface: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: _heading1,
          displayMedium: _heading2,
          displaySmall: _heading3,
          headlineMedium: _heading4,
          headlineSmall: _heading5,
          titleLarge: _heading6,
          titleMedium: _subtitle,
          titleSmall: _labelMedium,
          bodyLarge: _paragraphMedium,
          bodyMedium: _paragraphSmall,
          bodySmall: _caption,
        ),
      ).copyWith(
        scaffoldBackgroundColor: white,
      );
}

/// An extension for easily setting the font height for a [TextStyle]
extension FontHeightExtension on TextStyle {
  /// Returns a copy of the [TextStyle] with the calculated font height.
  ///
  /// The value is calculated by dividing the [TextStyle] fontSize and the
  /// passed height value expressed in logica pixels (can be found in Figma).
  ///
  /// Example:
  ///   - fontSize: 32
  ///   - passed height: 36
  ///
  ///   return copyWith(height: 36/32);
  ///
  TextStyle fontHeight(double height) =>
      fontSize == null ? this : copyWith(height: height / fontSize!);
}
