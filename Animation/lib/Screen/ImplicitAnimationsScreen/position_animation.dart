import 'package:flutter/material.dart';

class Position_Animation extends StatefulWidget {
  @override
  _Position_AnimationState createState() => _Position_AnimationState();
}

class _Position_AnimationState extends State<Position_Animation> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Position Animation'),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            left: _isMoved ? 150.0 : 20.0,
            top: _isMoved ? 350.0 : 20.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isMoved = !_isMoved;
                });
              },
              child: Container(
                margin: EdgeInsets.all(52.0),
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
      ),
    );
  }
}
