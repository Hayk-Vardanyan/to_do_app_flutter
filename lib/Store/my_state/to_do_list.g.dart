// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToDoList on _ToDoList, Store {
  Computed<ObservableList<ToDo>>? _$getCompletedToDosComputed;

  @override
  ObservableList<ToDo> get getCompletedToDos => (_$getCompletedToDosComputed ??=
          Computed<ObservableList<ToDo>>(() => super.getCompletedToDos,
              name: '_ToDoList.getCompletedToDos'))
      .value;
  Computed<ObservableList<ToDo>>? _$getPendingToDosComputed;

  @override
  ObservableList<ToDo> get getPendingToDos => (_$getPendingToDosComputed ??=
          Computed<ObservableList<ToDo>>(() => super.getPendingToDos,
              name: '_ToDoList.getPendingToDos'))
      .value;

  late final _$todosAtom = Atom(name: '_ToDoList.todos', context: context);

  @override
  ObservableList<ToDo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<ToDo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$_ToDoListActionController =
      ActionController(name: '_ToDoList', context: context);

  @override
  ObservableList<ToDo> contain(String input) {
    final _$actionInfo =
        _$_ToDoListActionController.startAction(name: '_ToDoList.contain');
    try {
      return super.contain(input);
    } finally {
      _$_ToDoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToDo(
      {required String description,
      required DateTime date,
      bool done = false}) {
    final _$actionInfo =
        _$_ToDoListActionController.startAction(name: '_ToDoList.addToDo');
    try {
      return super.addToDo(description: description, date: date, done: done);
    } finally {
      _$_ToDoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeToDo(ToDo todo) {
    final _$actionInfo =
        _$_ToDoListActionController.startAction(name: '_ToDoList.removeToDo');
    try {
      return super.removeToDo(todo);
    } finally {
      _$_ToDoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
getCompletedToDos: ${getCompletedToDos},
getPendingToDos: ${getPendingToDos}
    ''';
  }
}
