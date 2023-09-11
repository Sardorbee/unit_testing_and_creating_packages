part of 'student_bloc.dart';

abstract class StudentEvent {}

class FetchStudents extends StudentEvent {}

class AddStudent extends StudentEvent {
  final StudentModel student;
  AddStudent(this.student);
}

class UpdateStudent extends StudentEvent {
  final StudentModel student;
  UpdateStudent(this.student);
}

class DeleteStudent extends StudentEvent {
  final int studentId;
  DeleteStudent(this.studentId);
}

class DeleteAllStudents extends StudentEvent {}
