// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:to_do_project/Pages/add_to_do_page.dart';
import 'package:to_do_project/Widgets/search_line.dart';
import 'package:to_do_project/Widgets/to_do_list_view.dart';
import 'package:to_do_project/Widgets/bottom_bar_icons.dart';
import 'package:to_do_project/Store/my_state/to_do_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoList todos = ToDoList();
  ToDoList foundedTodos = ToDoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Create and Update Tasks',
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            SearchLine(
              foundedTodo: foundedTodos,
              todos: todos,
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) => foundedTodos.todos.isEmpty
                  ? const SizedBox()
                  : ToDoListView(
                      todos: todos,
                      foundedTodos: foundedTodos,
                      function: _createRoute,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarIcons(
        todos: todos,
        function: _createRoute,
      ),
    );
  }
}

Route _createRoute(ToDoList todos, bool isEdit, String description) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        AddToDoPage(todos: todos, isEdit: isEdit, updated: description),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
