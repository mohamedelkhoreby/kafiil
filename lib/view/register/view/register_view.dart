import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../widget/buildregisterstep2_widget.dart';
import '../widget/dropdwon_widget.dart';
import '../widget/obscuretextfield_widget.dart';
import '../widget/textfield_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _goToNextPage() {
    if (_currentPage < 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style:
              semiBlodMontserrat(fontSize: FontSize.s14, color: Colors.black),
        ),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: screenWidth * 0.25),
              const Text(
                'Register',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              SizedBox(width: screenWidth * 0.07),
              Text(
                'Complete Data',
                style: TextStyle(
                  color: _currentPage >= 1 ? Colors.green : Colors.grey,
                ),
              ),
              SizedBox(width: screenWidth * 0.20),
            ],
          ),
          const SizedBox(height: 5),
          _buildStepIndicator(screenWidth),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildRegisterStep1(screenWidth, screenheight);
                } else {
                  return BuildRegisterStep2(
                      screenWidth: screenWidth, screenheight: screenheight);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(double screenWidth) {
    double indicatorWidth = screenWidth * 0.25;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 2,
              width: indicatorWidth,
              color: Colors.green,
            ),
            Container(
              height: 30,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green),
                color: _currentPage == 0 ? Colors.white : Colors.green,
              ),
              child: _currentPage == 0
                  ? Center(
                      child: Text('${_currentPage + 1}',
                          style: const TextStyle(color: Colors.green)),
                    )
                  : const Center(
                      child: Icon(Icons.check, color: Colors.white, size: 15)),
            ),
          ],
        ),
        Container(
          height: 2,
          width: indicatorWidth,
          color: _currentPage == 0 ? Colors.grey : Colors.green,
        ),
        Container(
          height: 30,
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: _currentPage == 0
                ? Border.all(color: Colors.grey)
                : Border.all(color: Colors.green),
            color: _currentPage == 0
                ? Colors.grey
                : _currentPage == 1
                    ? Colors.white
                    : Colors.green,
          ),
          child: _currentPage == 0
              ? const SizedBox()
              : _currentPage == 1
                  ? Center(
                      child: Text('${_currentPage + 1}',
                          style: const TextStyle(color: Colors.green)),
                    )
                  : const Center(
                      child: Icon(Icons.check, color: Colors.white, size: 15)),
        ),
        Container(
          height: 2,
          width: indicatorWidth,
          color: _currentPage > 1 ? Colors.green : Colors.grey,
        ),
      ],
    );
  }

  Widget _buildRegisterStep1(screenWidth, screenheight) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.9,
              child: const Row(
                children: [
                  Expanded(
                    child: Field(
                      label: 'First Name',
                      textheight: 56,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Field(
                      label: "Last Name",
                      textheight: 56,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Field(
              label: "Email Address",
              textheight: 56,
            ),
            const SizedBox(height: 8),
            const ObscureTextField(label: "Password"),
            const SizedBox(height: 8),
            const ObscureTextField(label: "Confirm Password"),
            const SizedBox(height: 8),
            const DropDwon(
              label: 'User Type',
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 160,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _goToNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ColorManager.mainColor, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: mediumMontserratStyle(
                          fontSize: FontSize.s10, color: ColorManager.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
