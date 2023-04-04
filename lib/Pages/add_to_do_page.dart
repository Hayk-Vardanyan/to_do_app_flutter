import 'package:flutter/material.dart';
import 'package:to_do_project/Store/my_state/to_do_list.dart';
import 'package:to_do_project/Store/my_state/to_do.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({
    Key? key,
    required this.todos,
    required this.isEdit,
    this.updated,
  }) : super(key: key);

  final ToDoList? todos;
  final bool isEdit;

  final String? updated;

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  final descriptionController = TextEditingController();

  String? description;

  DateTime? date;

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(widget.isEdit ? 'Update Task' : 'Create Your Tasks')),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: [
            const Image(
              image: AssetImage('images/my_task.png'),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: TextField(
                onChanged: (input) {
                  description = input;
                },
                controller: descriptionController,
                cursorColor: Colors.black45,
                decoration: const InputDecoration(
                    hintText: 'add description',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030))
                      .then((value) {
                    date = value;
                  });
                },
                child: const Text('Choose Date')),
            const SizedBox(height: 20),
            Observer(
              builder: (_) => IconButton(
                  onPressed: () {
                    if (widget.isEdit) {
                      if (description != null || date != null) {
                        ToDo? updatedTodo = widget.todos?.todos.firstWhere(
                            (element) => element.description == widget.updated);
                        date ??= updatedTodo?.date;
                        description ??= updatedTodo?.description;
                        widget.todos?.removeToDo(updatedTodo!);
                        widget.todos?.addToDo(
                          description: description!,
                          date: date!,
                          done: updatedTodo!.done,
                        );
                      }
                      Navigator.pop(context);
                    } else {
                      if (description != null && date != null) {
                        widget.todos?.addToDo(
                          description: description!,
                          date: date!,
                          done: false,
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
                  icon: const Icon(Icons.check)),
            )
          ],
        ),
      ),
    );
  }
}
