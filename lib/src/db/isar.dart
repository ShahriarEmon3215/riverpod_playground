import 'package:appointment_demo/src/modules/home/model/task.model.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:isar/isar.dart' show Isar;
import '../modules/setting/model/setting.model.dart' show AppSettingSchema;
import 'paths.dart' show AppDir, appDir, initDir;

const _schema = [AppSettingSchema, TaskSchema];
late final Isar db;

Future<void> openDB() async {
  await initDir();
  db = await Isar.open(
    _schema,
    inspector: !kReleaseMode,
    directory: appDir.db.path,
  );
}

void openDBSync(AppDir dir) {
  db = Isar.openSync(_schema, inspector: !kReleaseMode, directory: dir.db.path);
}
