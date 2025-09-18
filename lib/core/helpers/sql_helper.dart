import 'package:ahwa_manager_app/core/models/order_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  String tableName = 'orders';
  Database? _database;
  getDataBase() async {
    if (_database == null) {
      _database = await inialDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  inialDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'notes.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        Batch batch = db.batch();
        batch.execute('''
        CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        customerName TEXT ,
        drinkId TEXT, 
        specialInstructions TEXT ,
        createdAt TEXT, 
        status TEXT
        )
        ''');
        batch.commit();
      },
    );
  }

  Future<void> insertData(OrderModel note) async {
    Database db = await getDataBase();
    Batch batch = db.batch();
    batch.insert(tableName, note.toMap());
    batch.commit();
  }

  //get data update delete
  //select
  Future<List<OrderModel>> getData() async {
    Database db = await getDataBase();
    List<Map> data = await db.query(tableName);
    return List.generate(data.length, (i) {
      return OrderModel(
        customerName: data[i]['customerName'],
        drinkId: data[i]['drinkId'],
        specialInstructions: data[i]['specialInstructions'],
        createdAt: data[i]['createdAt'],
        status: data[i]['status'],
        id: data[i]['id'],
      );
    });
  }

  Future<void> update(OrderModel order) async {
    Database db = await getDataBase();
    Batch batch = db.batch();
    batch.update(
      tableName,
      order.toMap(),
      where: 'id = ?',
      whereArgs: [order.id],
    );
    batch.commit();
  }

  Future<int> delete(int id) async {
    Database db = await getDataBase();
    return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
