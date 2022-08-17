import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  String _screen = '';

  void _updateScreen(buttonText) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _screen+= buttonText;
    });
  }

  void _clear() {
    setState(() {
      _screen = '';
    });
  }

  void _equals() {
    setState(() {
      _screen = _screen.interpret().toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Press the Buttons to Use the Calculator')
              )
            ),
            Text(
              '$_screen',
              style: Theme.of(context).textTheme.headline4,
            ),

            Container (
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column (
                children: [
                  Padding(
                    padding:EdgeInsets.all(10.0),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _updateScreen('1');
                    },
                    child: Text('1')
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _updateScreen('2');
                    },
                    child: Text('2')
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _updateScreen('+');
                    },
                    child: Text('+')
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _equals();
                    },
                    child: Text('=')
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _clear();
                    },
                    child: Text('Clear')
                  ),
                ]
              ),              
            ),
          ],
        ),
      ),
    );
  }
}
