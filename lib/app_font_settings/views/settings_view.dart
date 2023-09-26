import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings_controller/settings_controller.dart';

class MyFontPage extends ConsumerWidget {
  const MyFontPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Consumer(builder: (context, ref, child) {
          var value = ref.watch(fontSizeProvider);

          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Font Size : ${(value * 100).toStringAsFixed(0)}",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: value * 100),
                ),
                SizedBox(
                  height: 20,
                ),
                Slider(
                    value: value,
                    onChanged: (value) {
                      ref.read(fontSizeProvider.notifier).state = value;
                    })
              ]);
        }),
      ),
    );
  }
}
