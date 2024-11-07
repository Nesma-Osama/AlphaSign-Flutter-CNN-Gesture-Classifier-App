import 'package:flutter/material.dart';

class ShadowButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;  // Add width parameter

  ShadowButton({required this.onPressed, required this.text, this.width = 250}); // Default width of 250

  @override
  _ShadowButtonState createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          constraints: BoxConstraints(minWidth: 120, minHeight: 44),
          width: widget.width,  // Set the button width to the specified value
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.transparent),
            gradient: LinearGradient(
              colors: [
                Color(0xFF00C1F1), // --btn-bg-2 (hsla(194 100% 69%))
                Color(0xFF0054C8), // --btn-bg-1 (hsla(217 100% 56%))
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF47B8FF).withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0xFF3A7DE9).withOpacity(0.25),
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Color(0xFFAFE6FF).withOpacity(0.5),
             
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
              BoxShadow(
                color: Color(0xFF1360D8).withOpacity(0.35),
            
                blurRadius: 8,
                offset: Offset(-4, -4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,  // Display custom text
              style: TextStyle(
                color: Colors.white, // --btn-bg-color
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
