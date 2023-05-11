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
            "CREATE TABLE IF NOT EXISTS tbl_quote(Id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT NOT NULL,);";
        await db.execute(query);
      },
    );
  }

  Future<int> insertRecord({required Quote quote}) async {
    await initDB();

    String query = "INSERT INTO tbl_quote(id,quote) VALUES(?,?);";
    List args = [];

    return await db!.rawInsert(query, args);
  }

  Future<List<Quote>> getAllRecords() async {
    await initDB();
    String query = "SELECT * FROM tbl_quote;";

    List<Map<String, dynamic>> allRecords = await db!.rawQuery(query);

    List<Quote> allQuotes =
        allRecords.map((e) => Quote.fromMap(data: e)).toList();
    return allQuotes;
  }
}
