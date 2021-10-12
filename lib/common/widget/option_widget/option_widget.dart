import 'package:flutter/material.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/common/app_assets.dart';
import 'package:savemymind/common/app_utils.dart';
import 'package:savemymind/localization/app_localizations.dart';
import 'package:savemymind/models/note.dart';

class OptionWidget extends StatefulWidget {
  final OptionType optionType;
  final String content;

  const OptionWidget({Key key, this.optionType, this.content})
      : super(key: key);
  @override
  _OptionWidgetState createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  AppCubit appCubit;
  AppLocalization appLocalization;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appCubit = AppUtils.getAppCubit(context);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    appLocalization = AppUtils.getAppLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 4),
          child: AppImage.asset(
              assetPath: AppUtils.getOptionWidgetIcon(widget.optionType)),
        ),
        Expanded(
          child: Text(
            widget.content ?? "06/29/2020 - 06/29/2020",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: appCubit.appStyle.optionTypeTextStyle(widget.optionType),
          ),
        ),
      ],
    );
  }
}
