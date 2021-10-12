import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/common/app_assets.dart';
import 'package:savemymind/common/app_utils.dart';
import 'package:savemymind/common/widget/centered_fab.dart';
import 'package:savemymind/localization/app_localizations.dart';
import 'package:savemymind/modules/home/home_screen.dart';
import 'package:savemymind/modules/setting/setting_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final double width = 24, height = 24;
  AppCubit appCubit;
  List<Widget> listScreen;
  List<Widget> listBottomAppBarItem;
  AppLocalization appLocalization;
  @override
  void initState() {
    super.initState();
    appCubit = AppUtils.getAppCubit(context);
    listScreen = getListScreen();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    appLocalization = AppUtils.getAppLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: onPress,
        backgroundColor: appCubit.appStyle.orangeBackground(),
        child: Icon(
          Icons.add,
        ),
      ),
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: listScreen,
      ),
      bottomNavigationBar: _getListBottomAppBarItem(),
    );
  }

  List<BottomNavigationBarItem> getListBottomNavigationBarItem() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        activeIcon: AppImage.asset(
          assetPath: AppAsset.icHome,
          width: width,
          height: height,
        ),
        icon: AppImage.asset(
          assetPath: AppAsset.icHomeInActive,
          width: width,
          height: height,
        ),
        label: appLocalization.home(),
      ),
      BottomNavigationBarItem(
        activeIcon: AppImage.asset(
          assetPath: AppAsset.icSetting,
          width: width,
          height: height,
        ),
        icon: AppImage.asset(
          assetPath: AppAsset.icSettingInActive,
          width: width,
          height: height,
        ),
        label: appLocalization.settings(),
      ),
    ];
  }

  Widget _getListBottomAppBarItem() {
    return FABBottomBar(
      onTapItem: onTapItem,
      listWidget: [
        FABBottomBarItem(
            activeIcon: AppAsset.icHome,
            inActiveIcon: AppAsset.icHomeInActive,
            title: appLocalization.home()),
        FABBottomBarItem(
            activeIcon: AppAsset.icSetting,
            inActiveIcon: AppAsset.icSettingInActive,
            title: appLocalization.settings()),
      ],
    );
  }

  List<Widget> getListScreen() {
    return [HomeScreen(), SettingScreen()];
  }

  void onTapItem(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onPress() {}
}
