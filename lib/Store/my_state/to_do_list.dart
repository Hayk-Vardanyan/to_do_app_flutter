import 'package:to_do_project/Store/my_state/to_do.dart';
import 'package:mobx/mobx.dart';

part 'to_do_list.g.dart';

class ToDoList = _ToDoList with _$ToDoList;

abstract class _ToDoList with Store {
  @observable
  ObservableList<ToDo> todos = ObservableList<ToDo>();

  @computed
  ObservableList<ToDo> get getCompletedToDos =>
      ObservableList.of(todos.where((todo) => todo.done == true));

  @computed
  ObservableList<ToDo> get getPendingToDos =>
      ObservableList.of(todos.where((todo) => todo.done == false));

  @action
  ObservableList<ToDo> contain(String input) {
    return ObservableList.of(
      todos.where(
        (todo) => todo.description.contains(input),
      ),
    );
  }

  @action
  void addToDo({
    required String description,
    required DateTime date,
    bool done = false,
  }) {
    final todo = ToDo(
      description: description,
      date: date,
    );
    todo.done = done;
    todos.add(todo);
  }

  @action
  void removeToDo(ToDo todo) {
    todos.removeWhere((elem) => elem.description == todo.description);
  }
}
