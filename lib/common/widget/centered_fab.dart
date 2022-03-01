import 'package:flutter/material.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/common/app_assets.dart';
import 'package:savemymind/common/app_utils.dart';

class FABBottomBarItem {
  final String activeIcon, inActiveIcon, title;

  FABBottomBarItem(
      {required this.activeIcon,
      required this.inActiveIcon,
      required this.title});
}

class FABBottomBar extends StatefulWidget {
  final List<FABBottomBarItem> listWidget;
  final ValueChanged<int> onTapItem;
  final double? itemHeight;

  FABBottomBar(
      {Key? key,
      required this.listWidget,
      required this.onTapItem,
      this.itemHeight})
      : super(key: key);
  @override
  _FABBottomBarState createState() => _FABBottomBarState();
}

class _FABBottomBarState extends State<FABBottomBar> {
  int selectedIndex = 0;
  late AppCubit appCubit;
  @override
  void initState() {
    super.initState();
    appCubit = AppUtils.getAppCubit(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listItem = List.generate(
        widget.listWidget.length,
        (index) => _buildItemAppBar(
            item: widget.listWidget[index],
            onTapItem: _updateIndex,
            index: index));
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: listItem,
      ),
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
    );
  }

  void _updateIndex(int index) {
    widget.onTapItem(index);
    setState(() {
      selectedIndex = index;
    });
  }

  Widget _buildItemAppBar(
      {required FABBottomBarItem item,
      required ValueChanged<int> onTapItem,
      required int index}) {
    TextStyle textStyle = selectedIndex == index
        ? appCubit.appStyle.selectedAppBarItemLabelStyle()
        : appCubit.appStyle.unSelectedAppBarItemLabelStyle();
    String asset = selectedIndex == index ? item.activeIcon : item.inActiveIcon;
    return Expanded(
        child: SizedBox(
      height: widget.itemHeight,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => onTapItem(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 8),
                  child: AppImage.asset(
                    assetPath: asset,
                  )),
              Text(
                item.title,
                style: textStyle,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
