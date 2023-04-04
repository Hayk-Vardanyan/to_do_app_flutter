import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_project/Store/my_state/to_do.dart';

import 'package:to_do_project/Store/my_state/to_do_list.dart';

class ToDoPages extends StatelessWidget {
  const ToDoPages({
    Key? key,
    required this.todos,
    required this.function,
    required this.isPending,
    required this.info,
  }) : super(key: key);

  final ToDoList todos;
  final bool isPending;
  final String info;
  final Route Function(ToDoList, bool, String) function;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Here is your $info tasks',
            style: const TextStyle(fontWeight: FontWeight.w100),
          ),
        ),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: isPending
                ? todos.getPendingToDos.length
                : todos.getCompletedToDos.length,
            itemBuilder: (_, index) {
              final ToDo todo;
              if (isPending) {
                todo = todos.getPendingToDos[index];
              } else {
                todo = todos.getCompletedToDos[index];
              }
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
                                    Navigator.of(context).push(function(
                                        todos, true, todo.description));
                                  }),
                              IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    // todos.removeToDo(todo);
                                    todos.removeToDo(todo);
                                  })
                            ],
                          ),
                        ),
                      ));
            });
      }),
    );
  }
}
