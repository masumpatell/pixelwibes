import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "PixelWibes.db";
  static const _databaseVersion = 1;
  static const table = 'person_table';
  static const columnFirstName = 'FName';
  static const columnLastName = 'LName';
  static const columnEmail = 'email';
  static const columnPicture = 'picture';

  late Database _db;

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnFirstName TEXT NOT NULL,
            $columnLastName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPicture TEXT NOT NULL
          )
          ''');
  }

  // Insert Data
  Future<void> insertPerson(Map<String, dynamic> personData) async {
    await _db.insert(table, personData);
  }

  //read Data
  Future<List<Map<String, dynamic>>> getAllPersons() async {
    return await _db.query(table);
  }

}
