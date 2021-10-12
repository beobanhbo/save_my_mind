import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/common/app_utils.dart';
import 'package:savemymind/config/app_constants.dart';

class CustomSearchWidget extends StatefulWidget {
  final String hintTitle, leftIconPath;
  final Function(void) onTap;
  final TextInputType textInputType;
  final bool enable;
  final TextAlign textAlign;
  final TextEditingController controller;
  final Widget prefixIcon;
  const CustomSearchWidget({
    Key key,
    this.hintTitle,
    this.leftIconPath,
    this.onTap,
    this.textInputType,
    this.controller,
    this.prefixIcon,
    this.enable = true,
    this.textAlign,
  }) : super(key: key);

  @override
  _CustomSearchWidgetState createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  AppCubit appCubit;
  GlobalKey<FormState> _formState = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appCubit = AppUtils.getAppCubit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTextField(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Form(
      key: _formState,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        enabled: widget.enable,
        inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[ ]'))],
        textAlign: widget.textAlign ?? TextAlign.center,
        style: appCubit.appStyle.disableSearchTextStyle(),
        decoration: InputDecoration(
            hintStyle: appCubit.appStyle.disableSearchTextStyle(),
            hintText: widget.hintTitle ?? "",
            prefixIcon: widget.prefixIcon,
            filled: true,
            fillColor: appCubit.appStyle.distantWindChimeColor(),
            contentPadding: const EdgeInsets.symmetric(
                vertical: Constants.marginEightPx,
                horizontal: Constants.marginEightPx),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(Constants.textFieldBorderRadius),
                ),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(Constants.textFieldBorderRadius),
                ),
                borderSide: const BorderSide(color: Colors.transparent)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(Constants.textFieldBorderRadius)),
                borderSide: const BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
