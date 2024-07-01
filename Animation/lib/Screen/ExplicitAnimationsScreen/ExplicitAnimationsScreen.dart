import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ExplicitAnimationsScreen(),
    theme: ThemeData(primarySwatch: Colors.blue),
  ));
}

class ExplicitAnimationsScreen extends StatefulWidget {
  @override
  _ExplicitAnimationsScreenState createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen> {
  bool _containerToggled = false;
  double _opacityLevel = 1.0;
  bool _isAligned = false;

  void _toggleContainer() {
    setState(() {
      _containerToggled = !_containerToggled;
    });
  }

  void _changeOpacity() {
    setState(() {
      _opacityLevel = _opacityLevel == 1.0 ? 0.0 : 1.0;
    });
  }

  void _toggleAlignment() {
    setState(() {
      _isAligned = !_isAligned;
    });
  }

  void _navigateToGridView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AnimatedGridViewScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animations Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: _toggleContainer,
              child: AnimatedContainer(
                width: _containerToggled ? 200.0 : 100.0,
                height: _containerToggled ? 100.0 : 200.0,
                decoration: BoxDecoration(
                  color: _containerToggled ? Colors.blue : Colors.red,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Center(
                  child: Text(
                    _containerToggled ? 'Expanded' : 'Collapsed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: _changeOpacity,
              child: AnimatedOpacity(
                opacity: _opacityLevel,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Opacity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: _toggleAlignment,
              child: AnimatedAlign(
                alignment:
                    _isAligned ? Alignment.centerRight : Alignment.centerLeft,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Alignment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _navigateToGridView(context),
              child: Text(
                'Go to GridView',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedGridViewScreen extends StatefulWidget {
  @override
  _AnimatedGridViewScreenState createState() => _AnimatedGridViewScreenState();
}

class _AnimatedGridViewScreenState extends State<AnimatedGridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated GridView Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimatedGridItem(index: index);
          },
        ),
      ),
    );
  }
}

class AnimatedGridItem extends StatefulWidget {
  final int index;

  AnimatedGridItem({required this.index});

  @override
  _AnimatedGridItemState createState() => _AnimatedGridItemState();
}

class _AnimatedGridItemState extends State<AnimatedGridItem> {
  bool _isToggled = false;

  void _toggle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isToggled ? Colors.green : Colors.orange,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Item ${widget.index}',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
