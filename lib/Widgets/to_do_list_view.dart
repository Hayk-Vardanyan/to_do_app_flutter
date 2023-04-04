import 'package:flutter/material.dart';

import 'package:to_do_project/Store/my_state/to_do_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ToDoListView extends StatelessWidget {
  const ToDoListView({
    Key? key,
    required this.todos,
    required this.foundedTodos,
    required this.function,
  }) : super(key: key);

  final ToDoList todos;
  final ToDoList foundedTodos;
  final Route Function(ToDoList, bool, String) function;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Flexible(
        child: ListView.builder(
          itemCount: foundedTodos.todos.length,
          itemBuilder: (_, index) {
            final todo = foundedTodos.todos[index];
            return Observer(
              builder: (_) => Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white70,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: todo.done,
                  onChanged: (flag) => todo.done = flag!,
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          todo.description,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        todo.date.toString().substring(0, 10),
                        overflow: TextOverflow.ellipsis,
                      )),
                      IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.of(context)
                                .push(function(todos, true, todo.description));
                          }),
                      IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            todos.removeToDo(todo);
                            foundedTodos.removeToDo(todo);
                          })
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
