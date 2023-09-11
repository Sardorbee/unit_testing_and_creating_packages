import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_package/model/student_model.dart';
import 'package:unit_testing_and_creating_packages/bloc/student_bloc/student_bloc.dart';
import 'package:unit_testing_and_creating_packages/presentation/crud/crud.dart';
import 'package:unit_testing_and_creating_packages/presentation/update/update_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentBloc>().add(FetchStudents());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Students',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddStudents(),
                  ));
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          print(state);
          if (state is LoadedStudents) {
            return buildGridView(state.students);
          } else {
            return const Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while fetching data
            );
          }
        },
      ),
    );
  }

  Widget buildGridView(List<StudentModel> students) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.875,
      ),
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return Column(
          children: [
            SizedBox(
              width: 200,
              child: buildStudentCard(
                student,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateStudents(studentData: student),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async{

                    context.read<StudentBloc>().add(DeleteStudent(student.id!));
                  context.read<StudentBloc>().add(FetchStudents());
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildStudentCard(StudentModel student) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(student.imageUrl), // Use student's image URL
              radius: 40.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              student.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              student.course,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Age: ${student.age}',
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Address: ${student.address}',
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
