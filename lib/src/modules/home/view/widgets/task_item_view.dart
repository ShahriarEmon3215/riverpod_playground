import 'package:animations/animations.dart';
import 'package:appointment_demo/src/modules/home/model/task.model.dart';
import 'package:appointment_demo/src/modules/home/provider/task.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dialoge.dart';

class TaskItem extends ConsumerWidget {
  const TaskItem(this.task, {super.key});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(width: 2, color: Colors.teal),
        gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 0, 75, 67),
              Colors.teal,
            ]),
      ),
      child: ListTile(
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: task.description != null ? Text(task.description!) : null,
        trailing: !task.isDone
            ? null
            : IconButton(
                icon: const Icon(Icons.done_all_rounded),
                onPressed: () async => await ref
                    .read(taskOperationsProvider(task).notifier)
                    .done(),
              ),
        onTap: () async => await showModal(
          builder: (_) => CustomDialog(task: task),
          context: context,
        ),
      ),
    );
  }
}
