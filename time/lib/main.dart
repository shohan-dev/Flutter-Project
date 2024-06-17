import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _dateTimeString;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateTimeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  void _updateDateTime() {
    setState(() {
      _dateTimeString = _formatDateTime(DateTime.now());
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.toLocal()}".split(' ')[0] +
        " " +
        dateTime.toLocal().toString().split(' ')[1].split('.')[0];
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Text(
          _dateTimeString,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
