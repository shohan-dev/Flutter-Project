import 'package:flutter/material.dart';

class DefaultTextAnimation extends StatefulWidget {
  const DefaultTextAnimation({Key? key}) : super(key: key);

  @override
  State<DefaultTextAnimation> createState() => _DefaultTextAnimationState();
}

class _DefaultTextAnimationState extends State<DefaultTextAnimation> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isClicked = !_isClicked;
            });
          },
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: TextStyle(
              fontSize: _isClicked ? 64.0 : 26.0,
              color: _isClicked ? Colors.blue : Colors.black,
              fontWeight: _isClicked ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              'Click me!',
            ),
          ),
        ),
      ),
    );
  }
}
