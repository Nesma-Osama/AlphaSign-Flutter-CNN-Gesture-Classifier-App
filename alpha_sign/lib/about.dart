import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'images/background.jpg', // Path to your background image
            fit: BoxFit.cover, // Ensure the image covers the whole screen
          ),
          // Centered container with logo and about explanation
          Center(
            child: Container(
              width: 450, // Set a specific width for the container
              padding: EdgeInsets.all(20),
              margin:EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7), // Semi-transparent background
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Prevent the column from taking more space than necessary
                children: [
                  // Logo image at the top
                  Image.asset(
                    'images/logo.png', // Path to your logo image
                    height: 100, // Adjust logo size
                  ),
                  SizedBox(height: 30), // Space between logo and text

                  // Centered explanation text
                  Expanded(
                    child: SingleChildScrollView(  // Wrap the text content in SingleChildScrollView
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Introducing Alpha Sign AI: A cutting-edge tool for hand gesture recognition, designed to translate American Sign Language (ASL) into text. Using advanced machine learning algorithms, our app enables seamless communication by classifying hand gestures into their corresponding alphabet letters.',
                            style: TextStyle(
                              color: Colors.white, // White text to contrast with the dark background
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20), // Space between text and other content
                          Text(
                            'Alpha Sign AI is powered by sophisticated AI models that analyze hand shapes, positions, and movements. It can accurately classify any hand gesture into its appropriate ASL letter, making it an ideal tool for communication with the hearing-impaired or in situations where voice communication is not possible.',
                            style: TextStyle(
                              color: Colors.white, // White text
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20), // Space between text and other content
                          Text(
                            'With real-time hand gesture recognition, Alpha Sign AI provides immediate feedback, helping users learn and practice sign language efficiently. Whether you are a beginner or looking to improve your skills, Alpha Sign AI adapts to your needs, offering a powerful tool for personal and educational use.',
                            style: TextStyle(
                              color: Colors.white, // White text
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20), // Space between text and other content
                          Text(
                            'Join us in breaking down communication barriers and promoting inclusivity. Start using Alpha Sign AI today to better understand sign language and make a positive impact in the world around you.',
                            style: TextStyle(
                              color: Colors.white, // White text
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
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
