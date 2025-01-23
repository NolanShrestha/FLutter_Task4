import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/users.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'users.db');

      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          print("Creating users table...");
          await db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
          );
        },
      );
    } catch (e) {
      print("Error initializing database: $e");
      rethrow;
    }
  }

  Future<void> insertUser(User user) async {
    try {
      final db = await database;
      await db.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("User ${user.name} inserted successfully.");
    } catch (e) {
      print("Error inserting user: $e");
    }
  }

  Future<List<User>> fetchUsers() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> usersMap = await db.query('users');
      print("Fetched users: $usersMap");
      return usersMap.map((user) => User.fromMap(user)).toList();
    } catch (e) {
      print("Error fetching users: $e");
      return [];
    }
  }
}
