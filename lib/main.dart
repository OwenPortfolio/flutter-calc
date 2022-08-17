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
        child: Column(
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
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 175.0),
              decoration: BoxDecoration(
                color: Colors.red[800],
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:EdgeInsets.all(10.0),
                  ),
                  Column(
                    children: [
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('+');
                      },
                      child: Text('+')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('-');
                      },
                      child: Text('-')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('*');
                      },
                      child: Text('*')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('*');
                      },
                      child: Text('*')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('/');
                      },
                      child: Text('/')
                    ),
                      ]
                    ),
                  Column(
                    children: [
                    ElevatedButton(
                        onPressed: (){
                          _updateScreen('1');
                      },
                      child: Text('1')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('3');
                      },
                      child: Text('3')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('5');
                      },
                      child: Text('5')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('7');
                      },
                      child: Text('7')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('9');
                      },
                      child: Text('9')
                    )
                      ]
                  ),
                  Column(
                    children: [
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('2');
                      },
                      child: Text('2')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('4');
                      },
                      child: Text('4')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('6');
                      },
                      child: Text('6')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('8');
                      },
                      child: Text('8')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen('0');
                      },
                      child: Text('0')
                    ),
                      ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    ElevatedButton(
                      onPressed: (){
                        _equals();
                      },
                      child: Text('=')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _clear();
                      },
                      child: Text('Clear')
                    ),
                      ]
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
