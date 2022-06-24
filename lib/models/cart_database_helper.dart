import 'package:expense_tracking_app/models/product_data.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._privateConstructor();
  static final CartDatabaseHelper instance =
      CartDatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'carts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE carts(
        id INTEGER PRIMARY KEY
      )
    ''');
  }

  Future<List<Product>> getProducts() async {
    Database db = await instance.database;
    var products = await db.query('carts', orderBy: 'id');
    List<Product> productList = products.isNotEmpty
        ? products.map((e) => Product.fromJson(e)).toList()
        : [];
    return productList;
  }
}
