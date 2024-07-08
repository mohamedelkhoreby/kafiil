import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';

class DropDwon extends StatefulWidget {
  final String label; // Added this to pass label dynamically

  const DropDwon({
    super.key,
    required this.label, // Accept label as a parameter
  });

  @override
  State<DropDwon> createState() => _DropDwonState();
}

class _DropDwonState extends State<DropDwon> {
  String dropdownValue = ''; // Default dropdown value
  List<String> userType = ['seller', 'buyer', 'both'];
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
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.black,
            ),
            menuMaxHeight: MediaQuery.of(context).size.height / 2,
            items: userType.map((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
