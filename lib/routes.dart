import 'package:flutter/cupertino.dart';
import 'package:savemymind/modules/main/main_screen.dart';

class Routes {
  static const String Init = "/";
  static const String Home = "/Home";
  static const String Main = "/Main";
  CupertinoPageRoute routePage(RouteSettings settings) {
    return CupertinoPageRoute(
        builder: (context) {
          switch (settings.name) {
            case Main:
              return MainScreen();
            default:
              return Container();
          }
        },
        settings: settings);
  }
}
