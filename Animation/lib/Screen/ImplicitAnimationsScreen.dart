import 'package:aniamtion/Screen/ImplicitAnimationsScreen/AnimatedPositioned.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  final List<Map<String, Widget>> animationTypes = [
    {
      'name': AnimatedContainer(
        duration: Duration(seconds: 1),
        width: 200.0,
        height: 200.0,
        color: Colors.blue,
        child: Center(child: Text('AnimatedContainer')),
      ),
    },
    {
      'name': AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: 0.5,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: Center(child: Text('AnimatedOpacity')),
        ),
      ),
    },
    {
      'name': AnimatedAlign(
        alignment: Alignment.centerLeft,
        duration: Duration(seconds: 1),
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: Center(child: Text('AnimatedAlign')),
        ),
      ),
    },
    {'name': PositionDemo()},
    {
      'name': AnimatedDefaultTextStyle(
        duration: Duration(seconds: 1),
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        child: Center(
          child: Text('AnimatedDefaultTextStyle'),
        ),
      ),
    },
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
