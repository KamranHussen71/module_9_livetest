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
  String selectedSize = " ";

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

  Widget _buildSizeButton(String size, double paddingVertical, double paddingHorizontal) {
    return ElevatedButton(
      onPressed: () => _onSizeButtonPressed(size),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: size == selectedSize ? Colors.orangeAccent : Colors.white10,
        padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
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
                _buildSizeButton("S", 10, 40),
                _buildSizeButton("M", 10, 40),
                _buildSizeButton("L", 10, 40),
                _buildSizeButton("XL", 10, 40),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSizeButton("XXL", 10, 25),
                SizedBox(width: 5),
                _buildSizeButton("XXXL", 10, 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
