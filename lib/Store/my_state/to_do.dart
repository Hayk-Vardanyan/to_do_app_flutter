import 'package:mobx/mobx.dart';

part 'to_do.g.dart';

class ToDo = _ToDo with _$ToDo;

abstract class _ToDo with Store {
  _ToDo({
    required this.description,
    required this.date,
  });

  @observable
  String description;

  @observable
  DateTime date;

  @observable
  bool done = false;
}
