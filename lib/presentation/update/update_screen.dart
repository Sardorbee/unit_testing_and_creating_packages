import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_package/model/student_model.dart';
import 'package:unit_testing_and_creating_packages/bloc/student_bloc/student_bloc.dart';

class UpdateStudents extends StatelessWidget {
  const UpdateStudents({super.key, required this.studentData});
  final StudentModel studentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Update Students',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StudentForm(studentData: studentData),
    );
  }
}

class StudentForm extends StatefulWidget {
  const StudentForm({super.key, required this.studentData});
  final StudentModel studentData;

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _imageController =
      TextEditingController(text: "https://source.unsplash.com/random");
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Prepopulate form fields with student data if available
    if (widget.studentData != null) {
      _nameController.text = widget.studentData.name;
      _courseController.text = widget.studentData.course;
      _imageController.text = widget.studentData.imageUrl;
      _ageController.text = widget.studentData.age.toString();
      _addressController.text = widget.studentData.address;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _courseController.dispose();
    _imageController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter student name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Course',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _courseController,
                decoration: const InputDecoration(
                  hintText: 'Enter student course',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a course';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Age',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  hintText: 'Enter student age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an age';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  hintText: 'Enter student address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      String course = _courseController.text;
                      String image = _imageController.text;
                      int age = int.tryParse(_ageController.text) ?? 0;
                      String address = _addressController.text;

                      if (name.isNotEmpty &&
                          address.isNotEmpty &&
                          age != 0 &&
                          course.isNotEmpty &&
                          image.isNotEmpty) {
                        context.read<StudentBloc>().add(
                              UpdateStudent(
                                StudentModel(
                                  id: widget.studentData.id,
                                  name: name,
                                  course: course,
                                  imageUrl: image,
                                  age: age,
                                  address: address,
                                ),
                              ),
                            );
                        context.read<StudentBloc>().add(FetchStudents());
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text('Update',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
