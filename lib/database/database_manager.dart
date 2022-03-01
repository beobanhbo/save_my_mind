import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:savemymind/objectbox.g.dart';

class DatabaseManager {
  DatabaseManager._databaseManager();

  static final _instance = DatabaseManager._databaseManager();

  factory DatabaseManager() {
    return _instance;
  }
  Future<Store> initDatabase() async {
    // check if not exist database
    final directory = await getApplicationDocumentsDirectory();
//    return Store(getObj)
    final objectBoxDirectory = Directory(directory.path + '/objectbox/');
    openStore();
  }
}
