import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedPositioned Example'),
        ),
        body: PositionDemo(),
      ),
    );
  }
}

class PositionDemo extends StatefulWidget {
  @override
  _PositionDemoState createState() => _PositionDemoState();
}

class _PositionDemoState extends State<PositionDemo> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedPositioned(
          duration: Duration(seconds: 1),
          left: _isMoved ? 150.0 : 50.0,
          top: _isMoved ? 150.0 : 50.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isMoved = !_isMoved;
              });
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
              child: Center(
                  child: Text('Tap to Move',
                      style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ],
    );
  }
}
