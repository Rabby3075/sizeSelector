import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedButtonIndex = -1; // Initialize to -1 (no button selected)

  ButtonStyle commonButtonStyle(int index) {
    Color buttonColor = selectedButtonIndex == index ? Colors.orange : Colors.black38;

    return ElevatedButton.styleFrom(
      primary: buttonColor,      // Background color
      onPrimary: Colors.white, // Text color
    );
  }

  void selectButton(int index) {
    setState(() {
      selectedButtonIndex = index;
    });

    final selectedSizeText = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'][index];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $selectedSizeText'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
      ),
      body: Center(
        child: Wrap(
          spacing: 8.0, // Horizontal spacing between buttons
          runSpacing: 8.0, // Vertical spacing between rows of buttons
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                selectButton(0);
              },
              child: Text('S'),
              style: commonButtonStyle(0),
            ),
            ElevatedButton(
              onPressed: () {
                selectButton(1);
              },
              child: Text('M'),
              style: commonButtonStyle(1),
            ),
            ElevatedButton(
              onPressed: () {
                selectButton(2);
              },
              child: Text('L'),
              style: commonButtonStyle(2),
            ),
            ElevatedButton(
              onPressed: () {
                selectButton(3);
              },
              child: Text('XL'),
              style: commonButtonStyle(3),
            ),
            ElevatedButton(
              onPressed: () {
                selectButton(4);
              },
              child: Text('XXL'),
              style: commonButtonStyle(4),
            ),
            ElevatedButton(
              onPressed: () {
                selectButton(5);
              },
              child: Text('XXXL'),
              style: commonButtonStyle(5),
            ),
          ],
        ),
      ),
    );
  }
}
