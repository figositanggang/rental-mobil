import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/model_rental_mobil.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;
  final String tableName = 'rental';
  bool initData = false;

  final String id = 'id';
  final String name = 'name';
  final String owner = 'owner';
  final String image = 'image';
  final String firstPrice = 'firstPrice';
  final String secondPrice = 'secondPrice';

  final List dummyData = [
    {
      "name": "Avanza Veloz",
      "owner": "false",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRVHg8Kp3U40aawoUhYhRSKsqtjtyMiD_vig&usqp=CAU",
      "firstPrice": "12h/day = Rp.300.000",
      "secondPrice": "24/day = Rp.500.000"
    },
    {
      "name": "Toyota Innova Reborn",
      "owner": "false",
      "image":
          "https://foto.kontan.co.id/YNULXmEQ3-ez59eEC_ODfMpRbNc=/smart/2021/11/05/1291507197p.jpg",
      "firstPrice": "12h/day = Rp.400.000",
      "secondPrice": "24/day = Rp.700.000"
    },
    {
      "name": "Hyundai Creta",
      "owner": "true",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMNB9xhb9NQcm9bvoayRf4JhasN57tWz59PA&usqp=CAU",
      "firstPrice": "12h/day = Rp.700.000",
      "secondPrice": "24/day = Rp.1.300.000"
    },
    {
      "name": "Toyota Fortuner",
      "owner": "true",
      "image":
          "https://statik.tempo.co/data/2020/04/23/id_933079/933079_720.jpg",
      "firstPrice": "12h/day = Rp.600.000",
      "secondPrice": "24/day = Rp.1.000.000"
    }
  ];

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  insertDummyData() {
    if (initData == false) {
      initData = true;
      return dummyData.map((data) async {
        await saveRentalMobil(
          ModelRentalMobil(
            name: data['name'],
            image: data['image'],
            owner: data['owner'],
            firstPrice: data['firstPrice'],
            secondPrice: data['secondPrice'],
          ),
        );
      });
    }
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'rental.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($id INTEGER PRIMARY KEY, "
        "$name TEXT,"
        "$owner TEXT,"
        "$image TEXT,"
        "$firstPrice TEXT,"
        "$secondPrice TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveRentalMobil(ModelRentalMobil rentalMobil) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, rentalMobil.toMap());
  }

  Future<List?> getAllRentalMobil(bool type) async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName,
        columns: [id, name, owner, image, firstPrice, secondPrice],
        where: '$owner = ?',
        whereArgs: [type.toString()]);
    return result.toList();
  }

  Future<int?> updateRentalMobil(ModelRentalMobil rentalMobil) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, rentalMobil.toMap(),
        where: "$id = ?", whereArgs: [rentalMobil.id]);
  }

  Future<int?> deleteRentalMobil(int id) async {
    var dbClient = await _db;
    return await dbClient!.delete(tableName, where: "$id = ?", whereArgs: [id]);
  }
}
