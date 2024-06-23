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
          title: Text('AnimatedAlign Example'),
        ),
        body: AlignDemo(),
      ),
    );
  }
}

class AlignDemo extends StatefulWidget {
  @override
  _AlignDemoState createState() => _AlignDemoState();
}

class _AlignDemoState extends State<AlignDemo> {
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _alignment = _alignment == Alignment.centerLeft
                ? Alignment.centerRight
                : Alignment.centerLeft;
          });
        },
        child: AnimatedAlign(
          alignment: _alignment,
          duration: Duration(seconds: 1),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.blue,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'Tap to Change Alignment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
