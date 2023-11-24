import 'dart:io';

import 'package:flutter/material.dart';
import 'task.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:async';
import 'Stream/stream1.dart';
import 'Task/taskA.dart';
abstract class Vehicle{
  double speed=0;

  void makeSomeNoise();
  void horn();
  void speedUp(){
    speed+=1;
  }
}

class Car extends Vehicle{
  @override
  double get speed => 1;
  @override
  void makeSomeNoise() {
    // TODO: implement makeSomeNoise
  }
  @override
  void horn() {
    // TODO: implement horn
  }
}

class Car1 implements Vehicle{
  @override
  double speed=0;

  @override
  void horn() {
    // TODO: implement horn
  }

  @override
  void makeSomeNoise() {
    // TODO: implement makeSomeNoise
  }

  @override
  void speedUp() {
    // TODO: implement speedUp
  }
}

class DTask extends Task{
  static bool A=true;
  static set setA(bool value){
    A=value;
  }
  static get getA{
    return A;
  }
  DTask(String name):super(name);
  @override
  Future<TaskStatus> execute() async {
    sleep(const Duration(seconds: 1));
    
    return TaskStatus.shouldGiveUp;
  }
}
Stream<int> intStream = controller.stream;
Stream<int> doubleIntStream = intStream.map((event) => event * 2);
final controller = StreamController<int>();

void main() {
  controller
      .addStream(Stream<int>.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
  final doubleInt = doubleIntStream.listen((event) {
    print(event);
  });
  final a = TaskFlow();
  // final tasks = [TaskA("taskA1"), TaskA("taskA2"), TaskA("taskA3")];
  a.addTask(TaskA("taskA1"));
  a.addTask(TaskA("taskA2"));
  a.addTask(TaskA("taskA3"));
  a.addTask(TaskA("taskA4"));
  a.start();
  final D1=DTask("1");
  final D2=DTask("2");
  DTask.A=false;
  print(DTask.A);
  DTask.A=true;
  print(DTask.A);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState() {
    print("init done");
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: (true) ? Colors.red : Colors.black),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
