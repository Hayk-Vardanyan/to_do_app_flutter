// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:to_do_project/Store/my_state/to_do_list.dart';

class SearchLine extends StatelessWidget {
  const SearchLine({
    Key? key,
    required this.foundedTodo,
    required this.todos,
  }) : super(key: key);

  final ToDoList foundedTodo;
  final ToDoList todos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (input) {
          if (input.isEmpty) {
            foundedTodo.todos = todos.todos;
          } else {
            foundedTodo.todos = todos.contain(input);
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 18,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 50,
            minWidth: 30,
          ),
          hintText: 'Search tasks',
        ),
      ),
    );
  }
}
