import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'mobflix.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        final batch = db.batch();

        batch.execute(
          '''CREATE TABLE videos(id INTEGER PRIMARY KEY AUTOINCREMENT,
             url TEXT NOT NULL,
             category TEXT NOT NULL,
             preview TEXT NOT NULL)''',
        );

        batch.commit();
      },
    );
  }

  Future<int> insertVideo(String url, String category, String preview) async {
    final db = await database;
    return await db.insert('videos', {
      'url': url,
      'category': category,
      'preview': preview,
    });
  }

  Future<List<Map<String, dynamic>>> getVideos() async {
    final db = await database;
    return await db.query('videos');
  }

  Future<int> deleteVideo(int id) async {
    final db = await database;
    return db.delete('videos', where: 'id = ?', whereArgs: [id]);
  }
}
