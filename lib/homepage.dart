import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _screen = '';

List<String> operators = ['+', '-', '/', '*'];

  void _updateScreen(buttonText) {
    if(operators.contains(buttonText) && operators.contains(_screen[_screen.length -1])){
      _screen = _screen.substring(0, _screen.length - 1);
    }
    setState(() {
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
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
                        _updateScreen('.');
                      },
                      child: Text('.')
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
                        _updateScreen('(');
                      },
                      child: Text('(')
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: (){
                        _updateScreen(')');
                      },
                      child: Text(')')
                    ),
                    SizedBox(height: 5),
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