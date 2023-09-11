import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student_package/model/student_model.dart';
import 'package:student_package/repositories/students_repository.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(InitialStudentState()) {
    on<FetchStudents>(fetchStudents);
    on<AddStudent>(addStudent);
    on<UpdateStudent>(updateStudent);
    on<DeleteStudent>(deleteStudent);
    on<DeleteAllStudents>(deleteAllStudents);
  }
  final StudentRepository _repository = StudentRepository();

  Future<void> fetchStudents(
      FetchStudents event, Emitter<StudentState> emitter) async {
    emit(LoadingStudents());
    final students = await _repository.getAllStudents();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(LoadedStudents(students));
  }

  Future<void> addStudent(
    AddStudent event,
    Emitter<StudentState> emitter,
  ) async {
    emit(LoadingStudents());
    await _repository.insertStudent(event.student);
    emit(InitialStudentState());
  }

  Future<void> updateStudent(
      UpdateStudent event, Emitter<StudentState> emitter) async {
    emit(LoadingStudents());

    await _repository.updateStudent(event.student);
    emit(InitialStudentState());
  }

  Future<void> deleteStudent(
      DeleteStudent event, Emitter<StudentState> emitter) async {
    emit(LoadingStudents());

    await _repository.deleteStudent(event.studentId);
    emit(InitialStudentState());
  }

  Future<void> deleteAllStudents(
      DeleteAllStudents event, Emitter<StudentState> emitter) async {
    emit(LoadingStudents());

    await _repository.deleteAllStudents();
    emit(InitialStudentState());
  }
}
