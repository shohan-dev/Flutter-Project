import 'package:flutter/material.dart';

class Container_Animation extends StatefulWidget {
  @override
  _Container_AnimationState createState() => _Container_AnimationState();
}

class _Container_AnimationState extends State<Container_Animation> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _isExpanded ? 300.0 : 200.0,
            height: _isExpanded ? 300.0 : 200.0,
            color: _isExpanded ? Colors.red : Colors.blue,
            child: Center(
              child: Text(
                'Tap to Expand',
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
    );
  }
}
