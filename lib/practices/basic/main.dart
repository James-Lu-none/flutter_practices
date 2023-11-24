import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';

Future<List<Map>> readJsonFile(String filePath) async {
  print("reading...");
  String? input;
  try{
    input = await File(filePath).readAsString();
  }
  catch(e)
  {
    input= "nothing";
    print(e);
  }
  print(input);
  print("decoding...");
  var map = jsonDecode(input);
  print(map);
  print("done");
  return map;
}

// The following calls the 'action' method only if nullableObject is not null
//nullableObject?.action();
int? stringLength(String? nullableString) {
  return nullableString?.length;
  //the string variable "nullableString" is a potentially null value so the ? is need so that
  //the .length wont be called if "nullableSting" has value null.
}
void print_nullableSting(String? str)
{
  //both statements below print "alt" if str is null
  print(str ?? "alt");
  print((str != null) ? str:"alt");
  //both statements below assigns value "alt" if str is null;
  String a;
  a=str??"alt";
  a=(str != null) ? str:"alt";

}

class student{
  late String _name;
  late String _ID;
  student(this._name,this._ID);
  student.onlyName(this._name);
  student.onlyID(String ID){
    this._ID=ID;//_ID=ID
  }
  String get ID=>_ID;
  set ID(String ID)=>_ID=ID;
  String get name=>_name;
  set name(String name)=>_ID=name;
}
class NTUT_student extends student{

  NTUT_student(String a,String name,String ID):super(name,ID);
  void disp()
  {
    print("this student has name $name and ID $ID");
  }

}
void iterNums(List nums) {
  nums.forEach((num)=>print("Number is $num"));
}
int? couldReturnNullButDoesnt() => -3;
void main() {
  List<String> SL1=["one","two",3.toString()];//normal string list
  List<String?> SL2=["one",null,3.toString()];//string list that can contains nullable strings
  List<String>? SL3=null;//a nullable string list
  List<String?>? SL4=null;//a nullable string list that can contains nullable strings
  print(SL1.join(","));

  int? couldBeNullButIsnt = 1;
  List<int?> listThatCouldHoldNulls = [2, null, 4];

  int a = couldBeNullButIsnt;
  int b = listThatCouldHoldNulls.first!; // first item in the list
  int c = couldReturnNullButDoesnt()!.abs(); // absolute value
  int T=100;
  print(T.runtimeType);
  var value;
  readJsonFile('assets/a.json').then(value);

  print(value);
  print(T.toString());
  print('a is $a.');
  print('b is $b.');
  print('c is $c.');
  iterNums(SL1);
  print("a" as String);
  print_nullableSting("haha");

  var student1= new student.onlyID("110310144");
  var student2=NTUT_student("?","james","110310144");
  student2.disp();
  student1.ID="100";
  print(student1.ID);
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
