import 'package:flutter/material.dart';

class position_animation extends StatefulWidget {
  @override
  _position_animationState createState() => _position_animationState();
}

class _position_animationState extends State<position_animation> {
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
