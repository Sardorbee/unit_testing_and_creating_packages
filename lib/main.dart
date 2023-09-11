import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unit_testing_and_creating_packages/bloc/student_bloc/student_bloc.dart';
import 'package:unit_testing_and_creating_packages/bloc/tab_cubit/tab_cubit.dart';
import 'package:unit_testing_and_creating_packages/presentation/home_screen/home_screen.dart';
import 'package:unit_testing_and_creating_packages/presentation/tab.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => TabCubit(),
    ),
    BlocProvider(
      create: (context) => StudentBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
