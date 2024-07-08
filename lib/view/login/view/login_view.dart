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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Login",
          style:
              semiBlodMontserrat(fontSize: FontSize.s14, color: Colors.black),
        ),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 225,
                  width: 225,
                  child: SvgPicture.asset(
                    SvgAssets.login,
                  ),
                ),
              ),
              SizedBox(
                width: 335,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Email Address',
                            style: mediumMontserratStyle(
                                fontSize: FontSize.s10,
                                color: ColorManager.grey),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Password',
                            style: mediumMontserratStyle(
                                fontSize: FontSize.s10,
                                color: ColorManager.grey),
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
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
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
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (bool? value) {},
                              activeColor: ColorManager.mainColor,
                            ),
                            Text(
                              'Remember me',
                              style: mediumMontserratStyle(
                                  fontSize: FontSize.s10,
                                  color: ColorManager.grey),
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
                                fontSize: FontSize.s10,
                                color: ColorManager.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: 335,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement login functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ColorManager.mainColor, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: mediumMontserratStyle(
                              fontSize: FontSize.s10,
                              color: ColorManager.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account ? ",
                          style: mediumMontserratStyle(
                              fontSize: FontSize.s10, color: ColorManager.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              _goRegister();
                            },
                            child: Text(
                              "Register",
                              style: mediumMontserratStyle(
                                  fontSize: FontSize.s10,
                                  color: ColorManager.mainColor),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Navigation to the registration route
  _goRegister() async {
    await replacement(NamedRoutes.register);
  }
}
