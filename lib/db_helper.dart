import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  
  
  static Database? _database;



  DBHelper._privateConstructor();

  static final DBHelper instance = DBHelper._privateConstructor();

  static const String table='items';
  static const String columnId='id';
  static const String columnName='name';
  static const String columnDescription = 'description';
  
  Future<Database> get database async{
    if(_database != null) return  _database!;
    _database=await _initDatabase();
    return _database!;
  }


Future<Database> _initDatabase() async{
  String path=join(await getDatabasesPath(),'app.db');
  return openDatabase(
    path,
    version:1,
    onCreate: (Database db,int version) async{
      await db.execute(
        """
        CREATE TABLE $table (
          $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnDescription TEXT
            
        )
        """);
    }
  );
}


// CREATE
Future<int> insertDB(Map<String,dynamic> row) async{
  Database db=await instance.database;
  return await db.insert(table,row);
}

// READ

Future<List<Map<String,dynamic>>> readAllDB() async{
  Database db=await instance.database;
    return await db.query(table);
    }

// UPDATE
Future<int> updateItem(Map<String,dynamic>row)async{
  Database db=await instance.database;
  int id=row[columnId];
   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);

}

// DELETE
Future<int> deleteItem(int id)async{
  Database db=await instance.database;
  return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
}


}