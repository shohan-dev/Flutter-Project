import 'package:flutter/material.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Container_Animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Opacity_Animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Align_Animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Position_Animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Default_text_animation.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  final List<Widget> animationTypes = [
    Container_Animation(),
    Opacity_Animation(),
    Align_Animation(),
    Position_Animation(),
    DefaultTextAnimation(),
  ];

  final List<String> animationNames = [
    'Container Animation',
    'Opacity Animation',
    'Align Animation',
    'Position Animation',
    'Default Text Animation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        itemCount: animationTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: Center(
                      child: animationTypes[index],
                    ),
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  animationNames[index],
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
