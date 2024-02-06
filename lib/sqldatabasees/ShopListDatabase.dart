import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:robisalesautomation/model/Shop.dart';
import 'package:sqflite/sqflite.dart';
import 'package:robisalesautomation/model/User.dart';

class ShopListDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'mydatabase.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE IF NOT EXISTS shoplist (
            dealer_code TEXT PRIMARY KEY,
            emp_code TEXT,
            shop_name TEXT,
            shop_owner_name TEXT,
            manager_name TEXT,
            manager_mobile TEXT,
            master_dealer_code TEXT,
            product_group TEXT,
            target_shop TEXT,
            market_id TEXT,
            route_id TEXT,
            area_id TEXT,
            zone_id TEXT,
            region_id TEXT,
            shop_class TEXT,
            shop_type TEXT,
            shop_channel TEXT,
            shop_route_type TEXT,
            shop_identity TEXT,
            mobile TEXT,
            shop_address TEXT,
            status TEXT,
            otp TEXT,
            latitude TEXT,
            longitude TEXT,
            picture TEXT,
            picture_sm TEXT,
            image_compress TEXT,
            copy_done TEXT,
            entry_by TEXT,
            entry_at TEXT
          )
        ''');
      },
    );
  }

  Future<int> saveUser(Shop shop) async {
    final db = await database;
    return db.insert('shoplist', shop.toMap());
  }

  Future<bool> isUserLoggedIn() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return maps.isNotEmpty;
  }

  Future<Shop?> getShops() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('shoplist', limit: 1);
    return result.isNotEmpty ? Shop.fromJson(result.first) : null;
  }
}
