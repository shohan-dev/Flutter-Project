import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Align_Animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Container_Animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Default_text_animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/Opacity_Animation.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/position_animation.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  final List<Map<String, Widget>> animationTypes = [
    {'name': Container_Animation()},
    {'name': Opacity_Animation()},
    {'name': Align_Animation()},
    {'name': Position_Animation()},
    {'name': DefaultTextAnimation()},
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
                    appBar: AppBar(
                      title: Text('Animation Example'),
                    ),
                    body: Center(
                      child: animationTypes[index]['name'],
                    ),
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  animationTypes[index]['name']
                      .runtimeType
                      .toString()
                      .replaceAll('Animated', '')
                      .replaceAll('Center', ''),
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
