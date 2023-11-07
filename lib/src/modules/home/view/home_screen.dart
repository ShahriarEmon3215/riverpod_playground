import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/task.provider.dart';
import 'widgets/dialoge.dart';
import 'widgets/task_item_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(getTaskProvider).value;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Tasks',
        style: TextStyle(color: Colors.white),
      )),
      body: tasks == null
          ? const Center(
              child: Text('Empty!'),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) => TaskItem(tasks[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async => await showModal(
          builder: (_) => const CustomDialog(),
          context: context,
        ),
      ),
    );
  }
}
