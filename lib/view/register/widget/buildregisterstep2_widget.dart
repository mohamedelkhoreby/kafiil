import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import 'skills_widget.dart';

class BuildRegisterStep2 extends StatefulWidget {
  final double? screenheight;
  final double? screenWidth;

  const BuildRegisterStep2({
    super.key,
    this.screenheight,
    this.screenWidth,
  });

  @override
  State<BuildRegisterStep2> createState() => _BuildRegisterStep2State();
}

class _BuildRegisterStep2State extends State<BuildRegisterStep2> {
  final TextEditingController _textController = TextEditingController();
  int salary = 1000;
  String selectedGender = "";
  Map<String, bool> socialMedia = {
    "Facebook": true,
    "Twitter": false,
    "LinkedIn": false,
  };
  incrementSalary() {
    salary += 1000;
    _updateSalaryText();
  }

  decrementSalary() {
    if (salary >= 1000) {
      salary -= 1000;
      _updateSalaryText();
    }
  }

  void _updateSalaryText() {
    _textController.text = 'SAR $salary';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: SizedBox(
              height: 83,
              width: 83,
              child: Image.asset(ImageAssets.registertion),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "About",
                      style: mediumMontserratStyle(
                        fontSize: FontSize.s10,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 335,
                    height: 113,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textAlignVertical: TextAlignVertical.top,
                      cursorColor: ColorManager.mainColor,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Salary",
                      style: mediumMontserratStyle(
                        fontSize: FontSize.s10,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 335,
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.center,
                      controller: _textController,
                      style: semiBlodMontserrat(
                        fontSize: FontSize.s16,
                        color: ColorManager.black,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: IconButton(
                            onPressed: incrementSalary,
                            icon: SvgPicture.asset(
                              SvgAssets.plus,
                            ),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: IconButton(
                            onPressed: decrementSalary,
                            icon: SvgPicture.asset(
                              SvgAssets.muns,
                            ),
                          ),
                        ),
                        filled: true,
                        hintText: 'SAR $salary',
                        hintStyle: semiBlodMontserrat(
                          fontSize: FontSize.s16,
                          color: ColorManager.black,
                        ),
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Birth Date",
                      style: mediumMontserratStyle(
                        fontSize: FontSize.s10,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 335,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(ImageAssets.calendar),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Gender",
                      style: mediumMontserratStyle(
                        fontSize: FontSize.s10,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 335,
                    child: Row(
                      children: [
                        Radio<String>(
                          activeColor: ColorManager.mainColor,
                          value: "Male",
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() => selectedGender = value!);
                          },
                        ),
                        Text(
                          "Male",
                          style: mediumMontserratStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.grey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Radio<String>(
                          activeColor: ColorManager.mainColor,
                          value: "Female",
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() => selectedGender = value!);
                          },
                        ),
                        Text(
                          "Female",
                          style: mediumMontserratStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Skills",
                      style: mediumMontserratStyle(
                        fontSize: FontSize.s10,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                  const SkiilWidget(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Favourite Social Media",
                      style: mediumMontserratStyle(
                        fontSize: FontSize.s10,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 239,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: socialMedia.keys.map((String key) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: ColorManager.mainColor,
                                value: socialMedia[key],
                                onChanged: (bool? value) {
                                  setState(() {
                                    socialMedia[key] = value!;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: SvgPicture.asset(
                                  'assets/svg/${key.toLowerCase()}.svg',
                                  width: 18,
                                  height: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    width: 335,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _go,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorManager.mainColor, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: mediumMontserratStyle(
                            fontSize: FontSize.s10, color: ColorManager.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Navigation to the main route
  _go() async {
    await push(NamedRoutes.main);
  }
}
