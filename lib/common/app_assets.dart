import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppAsset {
  static const String assetRoot = 'assets/images';
  static const String icHome = '$assetRoot/home_orange.svg';
  static const String icHomeInActive = '$assetRoot/inactive_home.svg';
  static const String icProfileInActive = '$assetRoot/inactive_profile.svg';
  static const String icProfile = '$assetRoot/profile.svg';
  static const String icSettingInActive = '$assetRoot/setting_inactive.svg';
  static const String icSetting = '$assetRoot/setting_orange.svg';
  static const String icDollar = '$assetRoot/dollar_sign.svg';
  static const String icCalendar = '$assetRoot/ic_calendar.svg';
  static const String icClock = '$assetRoot/clock.svg';
}

class AppImage {
  static Widget network({
    @required String url,
    BoxFit fit = BoxFit.cover,
    double width,
    double height,
    Color color,
    String placeholder,
  }) {
    return Container(
      color: color ?? Colors.transparent,
      width: width,
      height: height,
      child: (url != null && url != '')
          ? Image.network(
              url,
              fit: fit,
            )
          : const SizedBox(),
    );
  }

  static Widget asset(
      {@required String assetPath,
      Color color,
      BoxFit fit = BoxFit.cover,
      double width,
      double height}) {
    final imagePath = assetPath ?? '';
    final isSVG = imagePath.endsWith('.svg');

    return Container(
      color: color ?? Colors.transparent,
      child: isSVG
          ? SvgPicture.asset(
              assetPath,
              fit: fit,
              width: width,
              height: height,
            )
          : Image.asset(
              assetPath,
              width: width,
              height: height,
              fit: fit,
            ),
    );
  }
}
