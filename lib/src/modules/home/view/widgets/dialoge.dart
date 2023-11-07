import 'package:appointment_demo/src/extensions/extensions.dart';
import 'package:appointment_demo/src/modules/home/model/task.model.dart';
import 'package:appointment_demo/src/modules/home/provider/task.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDialog extends ConsumerWidget {
  const CustomDialog({super.key, this.task});
  final Task? task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(taskOperationsProvider(task));
    return AlertDialog(
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Task'),
            controller: TextEditingController(text: provider.title),
            onChanged: (value) => provider.title = value,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Remarks'),
            controller: TextEditingController(text: provider.description),
            onChanged: (value) => provider.description = value,
          ),
          ListTile(
            title: const Text('Task Date'),
            subtitle: Text(provider.datetime.formattedDate),
            onTap: () async => await ref
                .read(taskOperationsProvider(task).notifier)
                .pickDate(context),
          ),
          ListTile(
            title: const Text('Task Time'),
            subtitle: Text(provider.datetime.formattedTime),
            onTap: () async => await ref
                .read(taskOperationsProvider(task).notifier)
                .pickTime(context),
          ),
          SwitchListTile.adaptive(
            title: const Text('Is Done'),
            value: provider.isDone,
            onChanged: (value) => ref
                .read(taskOperationsProvider(task).notifier)
                .toggleDone(value), 
          ),
        ],
      ),
      actions: [
        if (provider.id != null)
          TextButton(
            child: const Text('Delete'),
            onPressed: () async => await ref
                .read(taskOperationsProvider(task).notifier)
                .delete()
                .then((_) => context.pop()),
          ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => context.pop(),
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () async => await ref
              .read(taskOperationsProvider(task).notifier)
              .save()
              .then((_) => context.pop()),
        ),
      ],
    );
  }
}
