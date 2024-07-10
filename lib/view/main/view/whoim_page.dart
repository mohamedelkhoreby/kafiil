import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/view/register/widget/obscuretextfield_widget.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../register/widget/skills_widget.dart';
import '../../register/widget/textfield_widget.dart';

class WhoAmIPage extends StatefulWidget {
  const WhoAmIPage({super.key});

  @override
  State<WhoAmIPage> createState() => _WhoAmIPageState();
}

class _WhoAmIPageState extends State<WhoAmIPage> {
  // Controller for the salary text field
  final TextEditingController _textController = TextEditingController();
  int salary = 1000;
  String selectedGender = "";
  // Social media preferences
  Map<String, bool> socialMedia = {
    "Facebook": true,
    "Twitter": false,
    "LinkedIn": false,
  };
  // Increment salary by 1000 and update the text field
  void _incrementSalary() {
    setState(() {
      salary += 1000;
      _updateSalaryText();
    });
  }

// Decrement salary by 1000 and update the text field if salary is above or equal to 1000
  void _decrementSalary() {
    if (salary >= 1000) {
      setState(() {
        salary -= 1000;
        _updateSalaryText();
      });
    }
  }

// Update the text field with the current salary value
  void _updateSalaryText() {
    _textController.text = 'SAR $salary';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Center(
          child: SizedBox(
            height: 83,
            width: 83,
            child: Image.asset(ImageAssets.user),
          ),
        ),
        const SizedBox(height: 8),
        _buildNameFields(screenWidth),
        const SizedBox(height: 8),
        const Field(label: "Email Address", textheight: 56),
        const SizedBox(height: 8),
        const ObscureTextField(label: "Password"),
        const SizedBox(height: 8),
        _buildRadioGroup(
          label: "User Type",
          options: ["Seller", "Buyer", "Both"],
          selectedValue: selectedGender,
          onChanged: (value) => setState(() => selectedGender = value),
        ),
        const SizedBox(height: 8),
        _buildTextField(
          label: "About",
          height: 113,
          maxLines: null,
          expands: true,
        ),
        const SizedBox(height: 8),
        _buildSalaryField(),
        const SizedBox(height: 8),
        _buildTextField(
          label: "Birth Date",
          suffixIcon: Image.asset(ImageAssets.calendar),
        ),
        const SizedBox(height: 8),
        _buildRadioGroup(
          label: "Gender",
          options: ["Male", "Female"],
          selectedValue: selectedGender,
          onChanged: (value) => setState(() => selectedGender = value),
        ),
        const SizedBox(height: 8),
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
        const SizedBox(height: 8),
        _buildSocialMediaCheckboxes(screenWidth),
      ],
    );
  }

// Build name fields with first and last name text fields
  Widget _buildNameFields(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.9,
      child: const Row(
        children: [
          Expanded(
            child: Field(label: 'First Name', textheight: 56),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Field(label: "Last Name", textheight: 56),
          ),
        ],
      ),
    );
  }

  // Build a group of radio buttons
  Widget _buildRadioGroup({
    required String label,
    required List<String> options,
    required String selectedValue,
    required onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: mediumMontserratStyle(
              fontSize: FontSize.s10,
              color: ColorManager.grey,
            ),
          ),
        ),
        Row(
          children: options.map((option) {
            return Row(
              children: [
                Radio<String>(
                  activeColor: ColorManager.mainColor,
                  value: option,
                  groupValue: selectedValue,
                  onChanged: onChanged,
                ),
                Text(
                  option,
                  style: mediumMontserratStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.grey,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

// Build a reusable text field widget
  Widget _buildTextField({
    required String label,
    double? height,
    int? maxLines,
    bool expands = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: mediumMontserratStyle(
              fontSize: FontSize.s10,
              color: ColorManager.grey,
            ),
          ),
        ),
        SizedBox(
          height: height,
          child: TextField(
            expands: expands,
            maxLines: maxLines,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textAlignVertical: TextAlignVertical.top,
            cursorColor: ColorManager.mainColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

// Build the salary field with increment and decrement buttons
  Widget _buildSalaryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          width: MediaQuery.of(context).size.width * 0.9,
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
                  onPressed: _incrementSalary,
                  icon: SvgPicture.asset(SvgAssets.plus),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: IconButton(
                  onPressed: _decrementSalary,
                  icon: SvgPicture.asset(SvgAssets.minus),
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
      ],
    );
  }

// Build the social media checkboxes
  Widget _buildSocialMediaCheckboxes(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          width: screenWidth * 0.7,
          child: Column(
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
      ],
    );
  }
}
