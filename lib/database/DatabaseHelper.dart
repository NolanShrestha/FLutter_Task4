import 'package:sqflite/sqflite.dart';
import 'package:task4/models/users.dart';

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
    return await openDatabase(
      ':memory:',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
        );
      },
    );
  }

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> fetchUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> usersMap = await db.query('users');
    return usersMap.map((user) => User.fromMap(user)).toList();
  }

  // Debugging method to print the entire table
  Future<void> printUsersTable() async {
    final db = await database;
    final List<Map<String, dynamic>> tableData = await db.query('users');
    print('Users Table:');
    for (var row in tableData) {
      print(row);
    }
  }
}
