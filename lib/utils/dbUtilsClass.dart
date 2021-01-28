import 'package:launcher/models/entry.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBUtilsClass {
  static final String _tableName = "Entries";
  static final String _databaseName = "EntriesDatabase.db";
  static final int _databaseVersion = 1;
  static Database _database;
  static void initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, todo TEXT, isUrgent INTEGER, isImportant INTEGER, category INTEGER, date TEXT)',
        );
      },
      version: _databaseVersion,
    );
  }

  static Future<void> setEntry(Entry entry) async {
    final Database db = _database;
    await db.insert(
      _tableName,
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Entry>> getEntry(
      String where, List<String> whereArgs) async {
    final Database db = _database;

    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: where,
      whereArgs: whereArgs,
    );

    return List.generate(
      maps.length,
      (i) {
        bool val1 = maps[i]['isUrgent'] == 1 ? true : false;
        bool val2 = maps[i]['isImportant'] == 1 ? true : false;
        return Entry(
          maps[i]['title'],
          maps[i]['todo'],
          val1,
          val2,
          maps[i]['category'],
          DateTime.parse(
            maps[i]['date'],
          ),
        );
      },
    );
  }
}
