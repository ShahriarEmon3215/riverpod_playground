// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTaskHash() => r'1f13a0404c694138becc34731dbfd4665c1961aa';

/// See also [GetTask].
@ProviderFor(GetTask)
final getTaskProvider =
    AutoDisposeAsyncNotifierProvider<GetTask, List<Task>>.internal(
  GetTask.new,
  name: r'getTaskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetTask = AutoDisposeAsyncNotifier<List<Task>>;
String _$taskOperationsHash() => r'81581fa7f45642bb3a5fc33afa1023b9d2e295bd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TaskOperations extends BuildlessAutoDisposeNotifier<Task> {
  late final Task? task;

  Task build(
    Task? task,
  );
}

/// See also [TaskOperations].
@ProviderFor(TaskOperations)
const taskOperationsProvider = TaskOperationsFamily();

/// See also [TaskOperations].
class TaskOperationsFamily extends Family<Task> {
  /// See also [TaskOperations].
  const TaskOperationsFamily();

  /// See also [TaskOperations].
  TaskOperationsProvider call(
    Task? task,
  ) {
    return TaskOperationsProvider(
      task,
    );
  }

  @override
  TaskOperationsProvider getProviderOverride(
    covariant TaskOperationsProvider provider,
  ) {
    return call(
      provider.task,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'taskOperationsProvider';
}

/// See also [TaskOperations].
class TaskOperationsProvider
    extends AutoDisposeNotifierProviderImpl<TaskOperations, Task> {
  /// See also [TaskOperations].
  TaskOperationsProvider(
    this.task,
  ) : super.internal(
          () => TaskOperations()..task = task,
          from: taskOperationsProvider,
          name: r'taskOperationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskOperationsHash,
          dependencies: TaskOperationsFamily._dependencies,
          allTransitiveDependencies:
              TaskOperationsFamily._allTransitiveDependencies,
        );

  final Task? task;

  @override
  bool operator ==(Object other) {
    return other is TaskOperationsProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Task runNotifierBuild(
    covariant TaskOperations notifier,
  ) {
    return notifier.build(
      task,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
