import 'package:flutter/material.dart';

class Align_Animation extends StatefulWidget {
  @override
  _Align_AnimationState createState() => _Align_AnimationState();
}

class _Align_AnimationState extends State<Align_Animation> {
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
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
