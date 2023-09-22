import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String message = ref.read<String>(helloMessage);
    int counter = ref.watch<int>(counterState);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                var counter = ref.watch<int>(counterState);
                return Text(counter.toString());
              },
            ),

            ref.watch(flutureData).when(data: (data) => Text(data), error: (error, stackTrace) => const Text("Error"), loading: () => const CircularProgressIndicator(),),

            const SizedBox(height: 19),
            ElevatedButton(
              onPressed: () {
                ref.read(counterState.notifier).state++;
              },
              child: const Text("Tap"),
            )
          ],
        ),
      ),
    );
  }
}
