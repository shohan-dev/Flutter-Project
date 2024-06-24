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
          title: Text('AnimatedOpacity Example'),
        ),
        body: Opacity_Animation(),
      ),
    );
  }
}

class Opacity_Animation extends StatefulWidget {
  @override
  _Opacity_AnimationState createState() => _Opacity_AnimationState();
}

class _Opacity_AnimationState extends State<Opacity_Animation> {
  bool _isOpaque = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isOpaque = !_isOpaque;
          });
        },
        child: Center(
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _isOpaque ? 1.0 : 0.5,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Tap to Change Opacity',
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
      ),
    );
  }
}
