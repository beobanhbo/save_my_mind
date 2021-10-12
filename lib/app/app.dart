import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/app/cubit/app_state.dart';
import 'package:savemymind/localization/app_localizations.dart';
import 'package:savemymind/routes.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final Routes routes = Routes();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppCubit(AppInitial()))],
      child: GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
          return MaterialApp(
            locale: (state is AppLanguageFetchLocaleCompleted)
                ? state.locale
                : const Locale('en'),
            supportedLocales: AppLocalization.supportedLocale,
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            initialRoute: Routes.Main,
            onGenerateRoute: (setting) => routes.routePage(setting),
          );
        }),
      ),
    );
  }
}
