
import 'package:isar/isar.dart';
part 'task.model.g.dart';

@collection
class Task {
  Id? id;
  String title;
  DateTime datetime;
  String? description;
  bool isDone;

  Task({
    this.id,
    required this.title,
    required this.datetime,
    this.description,
    required this.isDone,
  });

  Task copyWith({
    Id? id,
    String? title,
    DateTime? datetime,
    String? description,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      datetime: datetime ?? this.datetime,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
