import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unit_testing_and_creating_packages/bloc/tab_cubit/tab_cubit.dart';
import 'package:unit_testing_and_creating_packages/presentation/crud/crud.dart';
import 'package:unit_testing_and_creating_packages/presentation/home_screen/home_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const AddStudents(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: Scaffold(
        body: IndexedStack(
          index: context.watch<TabCubit>().state,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          unselectedItemColor: Colors.black12,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.teal,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.web,
              ),
              label: '',
            ),
          ],
          currentIndex: context.watch<TabCubit>().state,
          onTap: (index) {
            context.read<TabCubit>().updateScreen(index);
          },
        ),
      ),
    );
  }
}
