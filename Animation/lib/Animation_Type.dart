import 'package:aniamtion/Other.dart';
import 'package:aniamtion/Screen/HeroAnimationsScreen/HeroAnimationsScreen.dart';
import 'package:aniamtion/Screen/ImplicitAnimationsScreen/ImplicitAnimationsScreen.dart';
import 'package:flutter/material.dart';

class Animation_Type extends StatelessWidget {
  final List<String> animationTypes = [
    'Implicit Animations',
    'Explicit Animations',
    'Hero Animations',
    'Physics-based Animations',
    'Flare Animations',
    'Animation Controllers',
    'Custom Animations',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation Types'),
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
                    builder: (context) =>
                        getAnimationScreen(animationTypes[index]),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    animationTypes[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getAnimationScreen(String animationType) {
    switch (animationType) {
      case 'Implicit Animations':
        return ImplicitAnimationsScreen();
      case 'Explicit Animations':
        return ExplicitAnimationsScreen();
      case 'Hero Animations':
        return HeroAnimationsScreen();
      case 'Physics-based Animations':
        return PhysicsBasedAnimationsScreen();
      case 'Flare Animations':
        return FlareAnimationsScreen();
      case 'Animation Controllers':
        return AnimationControllersScreen();
      case 'Custom Animations':
        return CustomAnimationsScreen();
      default:
        return Container(
          child: Center(
            child: Text('Unknown Animation Type'),
          ),
        );
    }
  }
}
