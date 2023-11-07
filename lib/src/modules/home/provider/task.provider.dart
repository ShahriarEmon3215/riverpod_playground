import 'package:appointment_demo/src/modules/home/model/task.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../db/isar.dart';
part 'task.provider.g.dart';

final tasksStreamProvider = 
    StreamProvider.autoDispose((_) => db.tasks.watchLazy());

@riverpod
class GetTask extends _$GetTask {
  @override
  FutureOr<List<Task>> build() {
    ref.watch(tasksStreamProvider);
    return db.tasks.where().findAll();
  }
}

@riverpod
class TaskOperations extends _$TaskOperations {
  @override
  Task build(Task? task) {
    return task ??
      Task(
        title: '',
        isDone: false,
        description: '',
        datetime: DateTime.now(),
      );
  }

  Future<void> save() async {
    await db.writeTxn(() {
      return db.tasks.put(state);
    });
  }

  Future<void> delete() async {
    if (state.id == null) return;
    await db.writeTxn(() {
      return db.tasks.delete(state.id!);
    });
  }

  Future<void> done() async {
    state.isDone = false;
    await db.writeTxn(() {
      return db.tasks.put(state);
    });
  }

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: state.datetime,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) return;
    state.datetime = DateTime(
      date.year,
      date.month,
      date.day,
      state.datetime.hour,
      state.datetime.minute,
    );
    state = state.copyWith();
  }

  Future<void> pickTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(state.datetime),
    );
    if (time == null) return;
    state.datetime = DateTime(
      state.datetime.year,
      state.datetime.month,
      state.datetime.day,
      time.hour,
      time.minute,
    );
    state = state.copyWith();
  }

  void toggleDone(bool value) {
    state.isDone = value;
    state = state.copyWith();
  }
}
