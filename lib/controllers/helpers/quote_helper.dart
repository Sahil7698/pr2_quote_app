import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/quote_model.dart';
import '../../res/quote_list.dart';

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
        await db.execute(query);
      },
    );
  }

  Future<int> insertRecord() async {
    await initDB();

    String query = "INSERT INTO tbl_quote(Id,quote,type) VALUES(?,?,?);";
    List args = [
      Global.alone.length,
      Global.angry.length,
      Global.happy.length,
      Global.attitude.length,
      Global.life.length,
      Global.time.length,
    ];

    return await db!.rawInsert(query, args);
  }

  Future<List<Quote>> getAllRecords({required String type}) async {
    await initDB();
    String query = "SELECT * FROM tbl_quote WHERE type='$type';";

    List<Map<String, dynamic>> allRecords = await db!.rawQuery(query);

    List<Quote> allQuotes =
    allRecords.map((e) => Quote.fromMap(data: e)).toList();
    return allQuotes;
  }
}
