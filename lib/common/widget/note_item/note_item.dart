import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/common/app_colors.dart';
import 'package:savemymind/common/app_utils.dart';
import 'package:savemymind/common/widget/network_image/custom_image.dart';
import 'package:savemymind/common/widget/option_widget/option_widget.dart';
import 'package:savemymind/localization/app_localizations.dart';
import 'package:savemymind/models/note.dart';

class NoteItem extends StatefulWidget {
  final Note note;
  final Function(int) onTapItem;

  const NoteItem({Key key, this.note, this.onTapItem}) : super(key: key);
  @override
  _NoteItemState createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  AppCubit appCubit;
  AppLocalization appLocalization;
  @override
  void initState() {
    super.initState();
    appCubit = AppUtils.getAppCubit(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalization = AppUtils.getAppLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTapItem,
        child: widget.note?.noteType == NoteType.reminder
            ? _buildReminderItem()
            : _buildNormalItem());
  }

  Widget _buildNormalItem() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: _buildImage()),
          ),
          Flexible(flex: 4, child: _buildTitle()),
        ],
      ),
    );
  }

  Widget _buildReminderItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeaderItem(),
        _buildImage(),
//        _buildTitle(),
      ],
    );
  }

  Widget _buildHeaderItem() {
    return Container(
      padding: const EdgeInsets.all(
        4,
      ),
      decoration: BoxDecoration(
          color: appCubit.appStyle.orangeBackground(),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.note?.title ?? appLocalization.note(),
              style: appCubit.appStyle.noteTitleStyle(),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage() {
    return CustomImage(
      imagePath: "assets/images/among_us.jpg",
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Flexible(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.note?.title ?? "",
                        style: appCubit.appStyle.noteTitleStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Divider(
                    height: 1,
                    color: AppColors.blackOak,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "117/12A An Binh, District 5,HCMC, HCMC",
                    style: appCubit.appStyle.noteAddressStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionWidget() {
    return OptionWidget();
  }
}
