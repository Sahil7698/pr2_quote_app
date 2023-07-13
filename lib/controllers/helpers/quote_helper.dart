import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/quote_model.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  Future<void> initDB() async {
    var directory = await getDatabasesPath();
    String path = join(directory, "quote.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int ver) async {
        String query =
            "CREATE TABLE IF NOT EXISTS tbl_quote(Id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT NOT NULL,type TEXT NOT NULL);";
        // String queryHistory =
        //     "CREATE TABLE IF NOT EXISTS tbl_history(Id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT NOT NULL,type TEXT NOT NULL);";
        await db.execute(query);
        //await db.execute(queryHistory);
      },
    );
  }

  Future<int> insertRecord(
      {required String quote, required String type}) async {
    await initDB();

    String query = "INSERT INTO tbl_quote(quote,type) VALUES(?,?);";
    List args = [quote, type];

    return await db!.rawInsert(query, args);
  }

  // Future<int> insertHistory(
  //     {required String quote, required String type}) async {
  //   await initDB();
  //
  //   String queryHistory = "INSERT INTO tbl_history(quote,type) VALUES(?,?);";
  //   List args = [quote, type];
  //
  //   return await db!.rawInsert(queryHistory, args);
  // }

  Future<List<Quote>> getAllRecords({required String type}) async {
    await initDB();
    String query = "SELECT * FROM tbl_quote WHERE type='$type';";

    List<Map<String, dynamic>> allRecords = await db!.rawQuery(query);

    List<Quote> allQuotes =
        allRecords.map((e) => Quote.fromMap(data: e)).toList();
    return allQuotes;
  }

  // Future<List<Quote>> getAllHistory() async {
  //   await initDB();
  //   String query = "SELECT * FROM tbl_history;";
  //
  //   List<Map<String, dynamic>> allHistories = await db!.rawQuery(query);
  //
  //   List<Quote> allQuotes =
  //       allHistories.map((e) => Quote.fromMap(data: e)).toList();
  //   return allQuotes;
  // }
}
