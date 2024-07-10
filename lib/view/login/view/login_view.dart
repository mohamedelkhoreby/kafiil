import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/core/resources/color_manager.dart';
import 'package:kafiil/core/resources/font_manager.dart';
import 'package:kafiil/core/resources/style_manager.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  bool _obscureText = true;
  bool _remember = true;

  // Toggles the password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Navigation to the registration route
  Future<void> _goRegister() async {
    await replacement(NamedRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildLogo(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      _buildTextField('Email Address', false),
                      const SizedBox(height: 16.0),
                      _buildTextField('Password', true),
                      const SizedBox(height: 16.0),
                      _buildRememberMeAndForgotPassword(),
                      const SizedBox(height: 16.0),
                      _buildLoginButton(),
                      const SizedBox(height: 16.0),
                      _buildRegisterText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Builds the app bar with title
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Account Login",
        style: semiBlodMontserrat(fontSize: FontSize.s14, color: Colors.black),
      ),
      leading: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    );
  }

  // Builds the logo at the center
  Widget _buildLogo() {
    return Center(
      child: SizedBox(
        height: 225,
        width: 225,
        child: SvgPicture.asset(SvgAssets.login),
      ),
    );
  }

  // Builds a text field with label
  Widget _buildTextField(String label, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: mediumMontserratStyle(
                fontSize: FontSize.s10, color: ColorManager.grey),
          ),
        ),
        TextField(
          obscureText: isPassword ? _obscureText : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12.0),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: ColorManager.grey,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  // Builds the remember me checkbox and forgot password text button
  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Checkbox(
              value: _remember,
              onChanged: (bool? value) {
                setState(() {
                  _remember = value!;
                });
              },
              activeColor: ColorManager.mainColor,
            ),
            Text(
              'Remember me',
              style: mediumMontserratStyle(
                  fontSize: FontSize.s10, color: ColorManager.grey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Implement forgot password functionality here
          },
          child: Text(
            'Forgot Password?',
            style: mediumMontserratStyle(
                fontSize: FontSize.s10, color: ColorManager.grey),
          ),
        ),
      ],
    );
  }

  // Builds the login button
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          // Implement login functionality here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Login',
          style: mediumMontserratStyle(
              fontSize: FontSize.s10, color: ColorManager.white),
        ),
      ),
    );
  }

  // Builds the register text with a button to navigate to registration
  Widget _buildRegisterText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: mediumMontserratStyle(
              fontSize: FontSize.s10, color: ColorManager.grey),
        ),
        TextButton(
          onPressed: _goRegister,
          child: Text(
            "Register",
            style: mediumMontserratStyle(
                fontSize: FontSize.s10, color: ColorManager.mainColor),
          ),
        ),
      ],
    );
  }
}
