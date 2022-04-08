import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Models/Products.dart';
import 'package:shopping/Screens/WishList/WishListModel.dart';
import 'package:sqflite/sqflite.dart';

import '../Screens/Cart/ModelCart.dart';

class DatabaseHelper {
  late bool wishFound;
  bool alreadInCart = false;

  DatabaseHelper._privateConstructor();

  static DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initialDatabase();

  Future<Database> _initialDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "CartDatabase.db");
    return await openDatabase(path,
        version: 6, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

//version 1, created two tables, 2, added column, 3 truncated table, version 4 no truncate, version 5 userId
  Future _onCreate(Database db, int version) async {
    try {
      await db.execute('''
            CREATE TABLE userCart(
            
            id INTEGER PRIMARY KEY, 
            quantity INTEGER, 
            name VARCHAR(255), 
            productId INTEGER,
            userId INTEGER 
            
            )
          ''');
      await db.execute('''
            CREATE TABLE wishList(
            id INTEGER PRIMARY KEY,
            name VARCHAR(255),
            price INTEGER,
            quantity INTEGER,
            description VARCHAR(255),
            details VARCHAR(255),
            thumbnail VARCHAR(255)
            )
          ''');
      print("Done, entities created successfully");
    } on DatabaseException catch (error) {
      print(error);
      throw error;
    } catch (e) {
      throw e;
    }
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute('''
    //   ALTER TABLE wishList ADD COLUMN productId INTEGER
    // ''');

    await db.execute('''
      ALTER TABLE wishList ADD COLUMN userId INTEGER
    ''');
  }

  //Retrieving CartList
  Future<List<CartModel>> cartList() async {
    Database db = await instance.database;
    var myCartList = await db.query("userCart", orderBy: "id");
    List<CartModel> cartList = myCartList.isNotEmpty
        ? myCartList.map((e) => CartModel.fromSqfLite(e)).toList()
        : [];
    return cartList;
  }

  // Saving into cart model

  Future<int> addToCart(CartModel cartModel) async {
    Database db = await instance.database;
    // print("going to save");
    return await db.insert('userCart', cartModel.toMap());
  }

  Future<List<Products>> getWishList() async {
    Database db = await instance.database;
    var wishProducts = await db.query('wishList', orderBy: 'id');
    List<Products> fetchWish = wishProducts.isNotEmpty
        ? wishProducts.map((e) => Products.wishList(e)).toList()
        : [];
    return fetchWish;
  }

  // Future<List<CartModel>> getCart() async{
  //   Database db = await instance.database;
  //   var List<CartModel> listCart = await db.query('')
  // }

  Future<int> addWishlist(WishListModel wishListModel) async {
    Database db = await instance.database;
    return await db.insert('wishList', wishListModel.toWishListModel());
  }

  Future<int> deleteCart(int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('userCart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteWishList(int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('wishList', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> findSingle(int id) async {
    Database db = await instance.database;
    var findWishlist =
        await db.query('wishList', where: 'productId = ?', whereArgs: [id]);
    if (findWishlist.isEmpty) {
      print("$findWishlist finding wish list");
      return false;
    } else {
      // print("Single user found $findWishlist");
      return true;
    }
  }

  Future<bool> findInCart(int id) async {
    Database db = await instance.database;
    var availability =
        await db.query('userCart', where: 'productId = ?', whereArgs: [id]);
    if (availability.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future authStatus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? tokens = sharedPreferences.getString("TOKEN");
    return tokens;
  }
}
