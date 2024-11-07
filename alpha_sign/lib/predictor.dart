import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:html' as html; // Only needed for Flutter web

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  html.File? _selectedImage;
  String _prediction = "Prediction will appear here";
  Image? _displayedImage;

  // Function to pick an image from the gallery (Web compatible)
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Read the file as bytes
      final bytes = await pickedImage.readAsBytes();
      setState(() {
        _displayedImage = Image.memory(bytes); // Display the image
      });
      await _predictImage(bytes);
    }
  }

  // Function to send the image to the server and get prediction
  Future<void> _predictImage(Uint8List imageBytes) async {
    final base64Image = base64Encode(imageBytes);

    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/predict'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"image": base64Image}),
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      setState(() {
        _prediction = result['class'];
      });
    } else {
      setState(() {
        _prediction = "Prediction failed. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'images/b.jpg', // Replace with your background image path
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(70),
              padding: EdgeInsets.all(30),
              
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Display the selected image
                  if (_displayedImage != null)
                    _displayedImage!
                  else
                    Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey,
                    ),
                  SizedBox(height: 20),

                  // Button to pick image
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Pick Image' ,style: TextStyle(
      fontSize: 24, // Increase font size
      fontWeight: FontWeight.bold, // Make text bold
    ),),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Box to display prediction result
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(70),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      _prediction,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
