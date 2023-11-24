import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'inh.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  List<Widget>? tiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tiles=[];
    for(int i=0;i<4;i++){
      final k=ObjectKey(i);
      tiles?.add(
        Column(
          key: k,
          children:[
            Text("$k"),
            const Padding(
              padding: EdgeInsets.all(1),
              child: StatefulColorfulTile(),
            ),
          ],
        )
      );
    }

  }

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _swapTiles() {
    setState(() {
      tiles!.insert(tiles!.length - 1, tiles!.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              children: tiles!,
            ),
            InheritedWidget1(integerData1: 1234435, child: DescendantOfInheritedWidget1())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          _swapTiles();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({super.key});
  @override
  State<StatefulWidget> createState() => _StatefulColorfulTile();
}

class _StatefulColorfulTile extends State<StatefulColorfulTile> {
  final color =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Text('${widget.key}'),
    );
  }
}



class InheritedWidget1 extends InheritedWidget {
  final int integerData1;
  const InheritedWidget1(
      {super.key, required this.integerData1, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget)=>true;

  static InheritedWidget1? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWidget1>();
  }

  static InheritedWidget1 of(BuildContext context) {
    final InheritedWidget1? result = maybeOf(context);
    assert(result != null, 'No InheritedWidget1 found in context');
    return result!;
  }
}

