import 'package:stream_practice/task.dart';

class TaskA extends Task {
  TaskA(String name) : super(name);
  @override
  Future<TaskStatus> execute() async {
    print("start");
    await Future.delayed(const Duration(seconds: 3));
    print("done");
    return TaskStatus.success;
    // final url = Uri.https('google.com');
    // final response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // if (response.statusCode == 200) {
    //   return TaskStatus.success;
    // } else {
    //   return TaskStatus.shouldGiveUp;
    // }
  }
}
