
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper{
//   //variables
//   static const dbName ='AlarmDatabase.db';
//   static const dbTable = 'Alarms';
//   static const dbVersion = 1;
//   static const columnAlarmId = 'AlarmId';
//   static const columnAlarmTime = 'AlarmTime';
//   static const columnAlarmTone = 'AlarmTone';
//   static const columnAlarmActiveInactiveStatus = 'AlarmActiveInactiveStatus';

//   //contructor
//   DatabaseHelper instance = DatabaseHelper();

//   //initializing Database
//   static Database? _database;
//   Future<Database?> get database async{
//   if(_database!=null){
//     return _database;
//   }
//   else{
//    _database=await initDB();
//    return _database;
//   }
//   }

//   initDB()async{
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, dbName);
//     return await openDatabase(path, version: dbVersion, onCreate: (db, version) {
//       db.execute(
//         '''
//         CREATE TABLE $dbTable(
//           $columnAlarmId INTEGER PRIMARY KEY,
//           $columnAlarmTime TEXT,
//           $columnAlarmTone TEXT,
//           $columnAlarmActiveInactiveStatus TEXT 
//         )
//         '''
//       );
//     },);
//   }


//   //insert Method
//   insertRecord(Map<String, dynamic> row)async{
//     Database? db = await instance.database;
//     return await db!.insert(dbTable, row);
//   }

//   //read Method
//   Future<List<Map<String,dynamic>>> readRecord()async{
//     Database? db = await instance.database;
//     return await db!.query(dbTable);
//   }

//   //update Method
//   Future<int> updateRecord(Map<String,dynamic> row, int id)async{
//     Database? db = await instance.database;
//     return await db!.update(dbTable, row, where: '$columnAlarmId = ?', whereArgs: [id]);
//   }

//   //delete Method
//   Future<int> deleteRecord(int id)async{
//     Database? db = await instance.database;
//     return await db!.delete(dbTable, where: '$columnAlarmId = ?', whereArgs: [id]);
//   }
// }