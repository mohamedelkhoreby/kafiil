import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';

class ObscureTextField extends StatefulWidget {
  final String label; // Added this to pass label dynamically

  const ObscureTextField({
    super.key,
    required this.label, // Accept label as a parameter
  });
  @override
  State<ObscureTextField> createState() => _ObscureTextFieldState();
}

class _ObscureTextFieldState extends State<ObscureTextField> {
  bool _obscureText = true;

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
          TextField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: ColorManager.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
