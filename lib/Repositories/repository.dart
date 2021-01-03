import 'package:goalzy_app/Repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {

  DatabaseConnection _databaseConnection;

  Repository() {
    //initialize database connection
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async{
    //return existing database
    if (_database != null) return _database;
    //else return new database
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  //inserting data to table
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  //read data from a table
  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }

  readDataById(table, itemId) async {
    var connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  updateData(table, data) async {
    var connection = await database;
    return await connection.update(table, data, where: 'id=?', whereArgs: [data['id']]);

  }

  deleteData(table, itemId) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }



}
