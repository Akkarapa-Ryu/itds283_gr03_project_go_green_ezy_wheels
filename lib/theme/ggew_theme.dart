// Go Green Ezy Wheels Theme
import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/theme/design_system.dart';

final class GGEWTheme {
  GGEWTheme._();

  static ThemeData get _baseTheme => ThemeData(
    fontFamily: DesignSystem.fontFamily,
    disabledColor: DesignSystem.disable,
  );

  static ThemeData get light => _baseTheme.copyWith(
        scaffoldBackgroundColor: DesignSystem.c1,
        colorScheme: const ColorScheme.light(
          primary: DesignSystem.c1,
          error: DesignSystem.error,
          background: DesignSystem.c2
        ),
      );

  static ThemeData get dark => _baseTheme.copyWith(
        scaffoldBackgroundColor: DesignSystem.c0,
        colorScheme: const ColorScheme.dark(
          primary: DesignSystem.c0,
          error: DesignSystem.error,
          background: DesignSystem.disable
        ),
      );
}