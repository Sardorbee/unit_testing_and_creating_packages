import 'package:student_package/local/students_sql.dart';
import 'package:student_package/model/student_model.dart';

class StudentRepository {
  final LocalDatabase _localDatabase = LocalDatabase();

  Future<void> insertStudent(StudentModel student) async =>
      await _localDatabase.insertStudent(student);

  Future<List<StudentModel>> getAllStudents() async =>
      await _localDatabase.getAllStudents();

  Future<void> updateStudent(StudentModel student) async =>
      await _localDatabase.updateStudent(student);

  Future<void> deleteStudent(int studentId) async =>
      await _localDatabase.deleteStudentByID(studentId);

  Future<void> deleteAllStudents() async =>
      await _localDatabase.deleteAllStudents();
}
