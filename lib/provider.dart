import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloMessage = Provider<String>((ref) => "Hello i'm Emon");
final counterState = StateProvider<int>((ref) => 0);
final flutureData = FutureProvider((ref) => fetchFutureData());

Future<String> fetchFutureData () async {
 return await Future.delayed(Duration(seconds: 3)).then((value) {
    return "Data loaded";
  });
 }

