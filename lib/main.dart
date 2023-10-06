import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeSelectorScreen(),
    );
  }
}

class SizeSelectorScreen extends StatefulWidget {
  @override
  _SizeSelectorScreenState createState() => _SizeSelectorScreenState();
}

class _SizeSelectorScreenState extends State<SizeSelectorScreen> {
  String selectedSize = "";

  void _onSizeButtonPressed(String size) {
    setState(() {
      selectedSize = size;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () => _onSizeButtonPressed(size),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        primary: size == selectedSize ? Colors.orangeAccent : Colors.white10,
        padding: EdgeInsets.symmetric(vertical: size == "S" ? 10 : 10, horizontal: 40),
      ),
      child: Text(
        size,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSizeButton("S"),
                _buildSizeButton("M"),
                _buildSizeButton("L"),
                _buildSizeButton("XL"),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSizeButton("XXL"),
                  _buildSizeButton("XXXL"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
