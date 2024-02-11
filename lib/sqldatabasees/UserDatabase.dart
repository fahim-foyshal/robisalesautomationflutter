import 'package:flutter/material.dart';
import 'package:robisalesautomation/model/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, instantiate it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'mydatabase.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Create the 'users' table
        return db.execute('''
          CREATE TABLE IF NOT EXISTS users (
            user_id TEXT PRIMARY KEY,
            user TEXT,
            password TEXT,
            full_name TEXT,
            mobile TEXT,
            dealer_code TEXT,
            region_id TEXT,
            zone_id TEXT,
            area_id TEXT,
            region_name TEXT,
            zone_name TEXT,
            area_name TEXT,
            user_image TEXT,
            isLoggedIn TEXT DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<int> saveUser(User user) async {
    final db = await database;
    return db.insert('users', user.toMap());
  }

  Future<bool> isUserLoggedIn() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return maps.isNotEmpty;
  }

  Future<User?> getUser() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('users', limit: 1);
    return result.isNotEmpty ? User.fromJson(result.first) : null;
  }
}
