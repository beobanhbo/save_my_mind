import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/common/app_assets.dart';
import 'package:savemymind/localization/app_localizations.dart';
import 'package:savemymind/models/note.dart';

class AppUtils {
  static AppCubit getAppCubit(BuildContext context) {
    return context.read<AppCubit>();
  }

  static AppLocalization getAppLocale(BuildContext context) {
    return AppLocalization.of(context);
  }

  static bool isURL(String url) {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }

  static String getOptionWidgetIcon(OptionType optionType) {
    switch (optionType) {
      case OptionType.time:
        return AppAsset.icClock;
      case OptionType.price:
        return AppAsset.icDollar;
      default:
        return AppAsset.icCalendar;
    }
  }
}
