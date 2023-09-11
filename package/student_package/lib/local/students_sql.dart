// ignore: depend_on_referenced_packages

import 'package:student_package/model/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return instance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("student_database.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER NOT NULL";
    const realType = "REAL DEFAULT 0.0";

    await db.execute('''
    CREATE TABLE ${StudentModelFields.studentTable}(
    ${StudentModelFields.id} $idType,
    ${StudentModelFields.name} $textType,
    ${StudentModelFields.course} $textType,
    ${StudentModelFields.imageUrl} $textType,
    ${StudentModelFields.age} $intType,
    ${StudentModelFields.address} $textType
    );
    ''');
  }

  Future<StudentModel> insertStudent(StudentModel student) async {
    final db = await instance.database;
    final int id =
        await db.insert(StudentModelFields.studentTable, student.toJson());

    return student.copyWith(id: id);
  }

  Future<List<StudentModel>> getAllStudents() async {
    List<StudentModel> allStudents = [];
    final db = await instance.database;
    allStudents = (await db.query(StudentModelFields.studentTable))
        .map((e) => StudentModel.fromJson(e))
        .toList();

    return allStudents;
  }

  Future<int> updateStudent(StudentModel updatedStudent) async {
    final db = await instance.database;
    return await db.update(
      StudentModelFields.studentTable,
      updatedStudent.toJson(),
      where: '${StudentModelFields.id} = ?',
      whereArgs: [updatedStudent.id],
    );
  }

  deleteStudentByID(int id) async {
    final db = await instance.database;
    db.delete(
      StudentModelFields.studentTable,
      where: "${StudentModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  deleteAllStudents() async {
    final db = await instance.database;
    db.delete(
      StudentModelFields.studentTable,
    );
  }
}
