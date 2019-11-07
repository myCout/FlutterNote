import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter_book/public.dart';
import 'package:flutter_book/Model/Book.dart';

class DataManager {
  static Database _db;
  String DB_NAME = 'abook.db';
  static String TABLE_USER = "user_table";
  String dbPath;
  String sql_create_user_Table =
      'CREATE TABLE $TABLE_USER (id INTEGER PRIMARY KEY,token Text ,nickname TEXT,avatar Text, sex INTEGER, birthday Text, sign Text, expiration INTEGER)';
  String sql_query_count = 'SELECT COUNT(*) FROM $TABLE_USER';
  String sql_query = 'SELECT * FROM $TABLE_USER';

//  var _result;

  static final DataManager _instance = DataManager.internal();

  factory DataManager() => _instance;

  DataManager.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    // 获取数据库文件的存储路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DB_NAME);
//    print('数据库地址: ${path}');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("$sql_create_user_Table");
  }

  Future<int> insertUser(UserModelEntity model) async {
    var dbClient = await db;
    int result;
    UserModelEntity userModel = await getUserModel(model.id);

    if (userModel != null) {
      debugPrint("name = ${model.nickname}");
      result = await updateUser(model);
    } else {
      result = await dbClient.insert(TABLE_USER, model.toJson());
//    debugPrint('result : ${result}');
    }
    return result;
  }

  //修改
  Future<int> updateUser(UserModelEntity model) async {
    var dbClient = await db;
    return await dbClient.update(TABLE_USER, model.toJson(),
        where: "${model.id} = ?", whereArgs: [model.id]);
  }

  Future<UserModelEntity> getUserModel(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(TABLE_USER,
        columns: [
          'id',
          'token',
          'nickname',
          'avatar',
          'sex',
          'birthday',
          'sign',
          'expiration'
        ],
        where: '$id = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return UserModelEntity.fromJson(result.first);
    }

    return null;
  }

  //  Future<Book> getVideo(int id) async {
//    var dbClient = await db;
//    List<Map> result = await dbClient.query(tableVideo,
//        columns: [columnId, image, url, duration, title, favoriteStatus],
//        where: '$id = ?',
//        whereArgs: [id]);
//
//    if (result.length > 0) {
//      return Book.fromSql(result.first);
//    }

//  Future<int> insertVideo(Book video) async {
//    var dbClient = await db;
//    var result = await dbClient.insert(tableVideo, video.toJson());
//
//    return result;
//  }
//
//  Future<List> selectVideos({int limit, int offset}) async {
//    var dbClient = await db;
//    var result = await dbClient.query(
//      tableVideo,
//      columns: [columnId, image, url, duration, title, favoriteStatus],
//      limit: limit,
//      offset: offset,
//    );
//    List<Book> videos = [];
//    result.forEach((item) => videos.add(Book.fromSql(item)));
//    return videos;
//  }
//
//  Future<int> getCount() async {
//    var dbClient = await db;
//    return Sqflite.firstIntValue(
//        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableVideo'));
//  }
//

//
//    return null;
//  }
//
//  Future<int> deleteNote(String images) async {
//    var dbClient = await db;
//    return await dbClient
//        .delete(tableVideo, where: '$image = ?', whereArgs: [images]);
//  }
//
//  Future<int> updateNote(Book video) async {
//    var dbClient = await db;
//    return await dbClient.update(tableVideo, video.toJson(),
//        where: "$columnId = ?", whereArgs: [video.id]);
//  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
