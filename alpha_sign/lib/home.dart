import 'package:alpha_sign/button.dart';
import 'package:flutter/material.dart';
import 'package:alpha_sign/predictor.dart'; // Import the prediction page
import 'about.dart'; // Import the AboutPage

// HomePage widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/b.jpg', // Path to your background image
              fit: BoxFit.cover, // Ensure the image covers the whole screen
            ),
          ),
          // Centered container with logo and buttons
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo image
                  Image.asset(
                    'images/logo.png', // Path to your logo image
                    height: 150, // Adjust logo size
                  ),
                  SizedBox(height: 40), // Space between logo and buttons
                  // Custom buttons for navigation
                  ShadowButton(
                    text: 'About',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  ShadowButton(
                    text: 'Prediction',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PredictionPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
