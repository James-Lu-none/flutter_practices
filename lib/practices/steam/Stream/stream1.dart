import 'dart:async';
import 'package:stream_practice/task.dart';

typedef OnSuccessCallBack = Function(Task);

class TaskFlow {
  TaskFlow()
      : _queue = [],
        _completeTask = [],
        _failTask = [],
        callback = null;

  final List<Task> _queue;
  final List<Task> _completeTask;
  final List<Task> _failTask;
  OnSuccessCallBack? callback;

  int get length => _queue.length;

  List<Task> get completeTask => _completeTask;

  void addTask(Task task) {
    _queue.add(task);
  }

  Future<bool> start() async {
    bool success = true;

    final tasks = _queue.map((task) => task.execute()).toList();
    final results = await Future.wait(tasks);
    for (int i = 0; i < results.length; i++) {
      final task = _queue[i];
      final status = results[i];

      switch (status) {
        case TaskStatus.success:
          _completeTask.add(task);
          callback?.call(task);
          break;
        case TaskStatus.shouldGiveUp:
          _failTask.addAll(_queue);
          _queue.clear();
          success = false;
          break;
        case TaskStatus.shouldRestart:
        case TaskStatus.shouldIgnore:
          _completeTask.add(task);
          break;
      }
    }
    String log = "success";
    for (final task in _completeTask) {
      log += '\n--${task.name}';
    }
    if (!success) {
      log += "\nfail";
      for (final task in _failTask) {
        log += '\n--${task.name}';
      }
    }
    _queue.clear();
    _completeTask.clear();
    _failTask.clear();
    return success;
  }
}
