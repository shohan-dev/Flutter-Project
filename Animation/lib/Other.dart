import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animations'),
      ),
      body: Center(
        child: Text(
          'Screen demonstrating Explicit Animations',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class PhysicsBasedAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics-based Animations'),
      ),
      body: Center(
        child: Text(
          'Screen demonstrating Physics-based Animations',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class FlareAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flare Animations'),
      ),
      body: Center(
        child: Text(
          'Screen demonstrating Flare Animations',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class AnimationControllersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Controllers'),
      ),
      body: Center(
        child: Text(
          'Screen demonstrating Animation Controllers',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class CustomAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Animations'),
      ),
      body: Center(
        child: Text(
          'Screen demonstrating Custom Animations',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
