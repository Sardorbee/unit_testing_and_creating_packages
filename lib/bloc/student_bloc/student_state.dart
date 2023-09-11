part of 'student_bloc.dart';

abstract class StudentState {}

class InitialStudentState extends StudentState {}

class LoadedStudents extends StudentState {
  final List<StudentModel> students;
  LoadedStudents(this.students);
}

class LoadingStudents extends StudentState {}
