import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savemymind/common/app_colors.dart';
import 'package:savemymind/models/note.dart';

class AppFontsWeight {
  static const thin = FontWeight.w100;
  static const extraLight = FontWeight.w200;
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
  static const ultraBold = FontWeight.w900;
}

class AppFontSFamily {
  static const String fontFamily = "Khand";
}

abstract class AppStyle {
  ThemeData themeData;
  Color orangeBackground();
  Color frozenTundraColor();
  Color distantWindChimeColor();
  TextStyle defaultTextStyle();
  TextStyle selectedAppBarItemLabelStyle();
  TextStyle noteTitleStyle();
  TextStyle noteAddressStyle();
  TextStyle unSelectedAppBarItemLabelStyle();
  TextStyle disableSearchTextStyle();
  TextStyle optionTypeTextStyle(OptionType optionType);
}

class DefaultAppStyle implements AppStyle {
  @override
  ThemeData themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: const TextTheme(
        headline4: TextStyle(fontSize: 24, fontWeight: AppFontsWeight.medium),
        headline5: TextStyle(fontSize: 20, fontWeight: AppFontsWeight.bold),
        headline6: TextStyle(fontSize: 18, fontWeight: AppFontsWeight.bold),
        bodyText2: TextStyle(fontSize: 14, fontWeight: AppFontsWeight.regular),
        bodyText1: TextStyle(fontSize: 16, fontWeight: AppFontsWeight.regular),
      ),
      hintColor: AppColors.frozenTundra,
      fontFamily: AppFontSFamily.fontFamily);

  @override
  TextStyle defaultTextStyle() {
    return themeData.textTheme.bodyText2.copyWith(color: AppColors.blackOak);
  }

  @override
  Color orangeBackground() {
    return AppColors.orangeFire;
  }

  @override
  TextStyle selectedAppBarItemLabelStyle() {
    return defaultTextStyle().copyWith(
        color: AppColors.orangeFire, fontWeight: AppFontsWeight.semiBold);
  }

  @override
  TextStyle unSelectedAppBarItemLabelStyle() {
    return defaultTextStyle().copyWith(
        color: AppColors.blackOak, fontWeight: AppFontsWeight.regular);
  }

  @override
  TextStyle noteTitleStyle() {
    return defaultTextStyle().copyWith(
        color: AppColors.blackOak,
        fontWeight: AppFontsWeight.medium,
        fontSize: 18);
  }

  @override
  TextStyle noteAddressStyle() {
    return defaultTextStyle().copyWith(
        color: AppColors.blackOak,
        fontWeight: AppFontsWeight.regular,
        fontSize: 16);
  }

  @override
  Color frozenTundraColor() {
    return AppColors.frozenTundra;
  }

  @override
  Color distantWindChimeColor() {
    return AppColors.distantWindChime;
  }

  @override
  TextStyle disableSearchTextStyle() {
    return defaultTextStyle().copyWith(
        color: AppColors.frozenTundra, fontWeight: AppFontsWeight.regular);
  }

  @override
  TextStyle optionTypeTextStyle(OptionType optionType) {
    switch (optionType) {
      case OptionType.price:
        return defaultTextStyle().copyWith(
          color: AppColors.bleuDeFrance,
          fontWeight: AppFontsWeight.regular,
          fontSize: 14,
        );
      case OptionType.time:
        return defaultTextStyle().copyWith(
          color: AppColors.khmerCurry,
          fontWeight: AppFontsWeight.regular,
          fontSize: 14,
        );
      default:
        return defaultTextStyle().copyWith(
          color: AppColors.garnish,
          fontWeight: AppFontsWeight.regular,
          fontSize: 14,
        );
    }
  }
}
