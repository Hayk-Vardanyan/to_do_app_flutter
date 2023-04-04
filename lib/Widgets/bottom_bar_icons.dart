import 'package:flutter/material.dart';

import 'package:to_do_project/Pages/add_to_do_page.dart';
import 'package:to_do_project/Pages/to_do_pages.dart';

import 'package:to_do_project/Store/my_state/to_do_list.dart';

class BottomBarIcons extends StatelessWidget {
  const BottomBarIcons({
    Key? key,
    required this.todos,
    required this.function,
  }) : super(key: key);

  final ToDoList todos;
  final Route Function(ToDoList, bool, String) function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                _createRouteForPending(todos, true, 'pending'),
              );
            },
            icon: const Icon(Icons.pending_actions_sharp),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute(todos, false));
            },
            icon: const Icon(Icons.add_circle_outline_sharp),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(_createRouteForPending(todos, false, 'completed'));
            },
            icon: const Icon(Icons.checklist_rounded),
          ),
        ),
      ],
    );
  }

  Route _createRouteForPending(ToDoList todos, bool isPending, String info) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ToDoPages(
          todos: todos, function: function, isPending: isPending, info: info),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

Route _createRoute(ToDoList todos, bool isEdit) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AddToDoPage(
      todos: todos,
      isEdit: isEdit,
    ),
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
