import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savemymind/app/cubit/app_cubit.dart';
import 'package:savemymind/common/app_colors.dart';
import 'package:savemymind/common/app_utils.dart';
import 'package:savemymind/common/widget/note_item/note_item.dart';
import 'package:savemymind/common/widget/search_widget/CustomSearchWidget.dart';
import 'package:savemymind/config/app_constants.dart';
import 'package:savemymind/localization/app_localizations.dart';
import 'package:savemymind/models/note.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppCubit appCubit;
  AppLocalization appLocalization;
  TextEditingController controller;
  List<Note> listNote;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appCubit = AppUtils.getAppCubit(context);
    controller = TextEditingController();
    listNote = List.generate(
        8,
        (index) => Note(
            title: "Chicken And Meat Chicken And MeatChicken And Meat",
            description: "Make stronger health",
            noteType: index.isEven ? NoteType.reminder : NoteType.store));
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
      body: Container(
        color: AppColors.cloudBreak,
        margin: const EdgeInsets.symmetric(
          horizontal: Constants.marginDefault,
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchWidget(
                controller: controller,
                hintTitle: appLocalization.searchItem(),
                enable: false,
                prefixIcon: Icon(
                  Icons.search,
                  color: appCubit.appStyle.frozenTundraColor(),
                ),
              ),
              _buildListNote(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListNote() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
//          childAspectRatio: 1 / 1.5,
          mainAxisSpacing: 8,
          mainAxisExtent: 250,
          crossAxisSpacing: 8),
      itemCount: listNote.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Container(
        child: NoteItem(
          note: listNote[index],
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                width: 1, color: appCubit.appStyle.orangeBackground())),
      ),
    );
  }
}
