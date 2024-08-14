import 'package:hive/hive.dart';

part 'todo_list.g.dart';

@HiveType(typeId: 1)
class TodoList {
  TodoList({
    required this.nameActivity,
    required this.date,
  });

  @HiveField(0)
  String nameActivity;

  @HiveField(1)
  String date;
}
