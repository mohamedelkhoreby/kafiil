import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';

class Field extends StatefulWidget {
  final String label; // Added this to pass label dynamically
  final double textheight;
  const Field(
      {super.key,
      required this.label, // Accept label as a parameter
      required this.textheight});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.9, // Adjust width to be 90% of the screen width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.label, // Use the label passed to the widget
              style: mediumMontserratStyle(
                fontSize: FontSize.s10,
                color: ColorManager.grey,
              ),
            ),
          ),
          SizedBox(
            height: 56,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
