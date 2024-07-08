import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';

class SkiilWidget extends StatefulWidget {
  const SkiilWidget({super.key});

  @override
  State<SkiilWidget> createState() => _SkiilWidgetState();
}

class _SkiilWidgetState extends State<SkiilWidget> {
  final TextEditingController _controller = TextEditingController();
  List<String> skills = [];

  void _addSkill(String skill) {
    setState(() {
      skills.add(skill);
    });
    _controller.clear();
  }

  void _removeSkill(String skill) {
    setState(() {
      skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.9, 
      height: 113,
      child: TextField(
        controller: _controller,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: ColorManager.mainColor,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          prefixIcon: skills.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 50, top: 10),
                  child: Wrap(
                    spacing: 2.0,
                    runSpacing: 4.0,
                    children: skills.map((skill) {
                      return Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffe9f9f1),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: SizedBox(
                                  width: 100,
                                  child: Text(
                                    skill,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: mediumMontserratStyle(
                                      fontSize: FontSize.s10,
                                      color: ColorManager.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _removeSkill(skill);
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 12,
                                  color: Colors.green, // Change as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              : null,
        ),
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            _addSkill(value);
          }
        },
      ),
    );
  }
}
