import 'package:bloc/bloc.dart';
import 'package:savemymind/app/cubit/app_state.dart';
import 'package:savemymind/styles.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(AppState initialState) : super(AppInitial());
  AppStyle appStyle = DefaultAppStyle();
  void fetchLocale() {}
  void changeLanguage() {}
}
