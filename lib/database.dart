import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Person{
  final int id;
  final String name;
 
 Person({required this.id,required this.name});

 Map<String,dynamic> toMap(){
   return {
     'id':id,
     'name':name,
     };
 }
 
 @override
String toString(){
   return 'Person{id:$id,name:$name}';
}
}

late Database database;

void initializeDB() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database=openDatabase(
    join(await getDatabasesPath(), 'data.db'),
    onCreate:(db,version){
      return db.execute(
        """
        CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT),
        """
      );
    },
    version:1,
  );
}

Future<void> insert(Person person) async{
  final db=database;
  await db.insert(
    'person',
    person.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Person>> retrieve() async{
  final db = database;
  final List<Map<String,dynamic>> maps=await db.query('person');
  return List.generate(maps.length, (i){
    return Person(
      id:maps[i]['id'],
      name:maps[i]['name'],
    );
  });
}

Future<void> updateData(Person person) async{
  final db=database;
  await db.update(
    'person',
    person.toMap(),
    where:'id=?',
    whereArgs: [person.id],
  );
}

Future<void> deleteData(Person person) async{
  final db=database;
  await db.delete(
    'person',
    where:'id=?',
    whereArgs: [person.id],
  );
}

var person1=Person(
  id:0,
  name:'person_name',
);

