import 'Note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper; //Singleton
  static Database _database; //singleton

  String noteTable = 'note_table';
  String colID = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

DatabaseHelper._createInstance();

factory DatabaseHelper(){
  if (_databaseHelper == null) {

    _databaseHelper = DatabaseHelper._createInstance();
    
  }
  return _databaseHelper;
}


//custom getter
Future<Database> get database async {
  if (_database == null) {
    _database = await initailizeDatabase();
    
  }
  return _database;
}

}

Future<Database> initailizeDatabase() async{
  Directory directory = await getApplicationDocumentsDirectory();
  String path = directory.path + 'notes.db';
  var notesDatabase = await openDatabase(path, version:1, _createDb);
  return notesDatabase;
}