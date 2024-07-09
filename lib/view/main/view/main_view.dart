import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/core/resources/assets_manager.dart';
import 'package:kafiil/view/main/view/countries_page.dart';
import 'package:kafiil/view/main/view/services_page.dart';
import 'package:kafiil/view/main/view/whoim_page.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<String> _pageTitles = ['Who Am I', 'Countries', 'Services'];
  final List<Widget> _pages = [
    const WhoAmIPage(),
    const CountriesPage(),
    const ServicesPage()
  ];

  // Update the selected index on page change
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Navigate to the selected page
  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  // Build navigation bar item
  BottomNavigationBarItem _buildNavItem(
      String assetName, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetName,
        colorFilter: ColorFilter.mode(
          _selectedIndex == index ? ColorManager.mainColor : ColorManager.grey,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      backgroundColor:
          _selectedIndex >= 1 ? ColorManager.background : ColorManager.white,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Build AppBar with dynamic title
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorManager.white,
      automaticallyImplyLeading: false,
      title: Text(
        _pageTitles[_selectedIndex],
        style: semiBlodMontserrat(
            fontSize: FontSize.s15, color: ColorManager.black),
      ),
    );
  }

  // Build PageView with pages
  PageView _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      children: _pages,
    );
  }

  // Build BottomNavigationBar
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: ColorManager.white,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedLabelStyle: mediumMontserratStyle(
          fontSize: FontSize.s10, color: ColorManager.mainColor),
      unselectedLabelStyle: mediumMontserratStyle(
          fontSize: FontSize.s10, color: ColorManager.grey),
      selectedItemColor: ColorManager.mainColor,
      items: [
        _buildNavItem(SvgAssets.user, 'Who Am I', 0),
        _buildNavItem(SvgAssets.global, 'Countries', 1),
        _buildNavItem(SvgAssets.shopingcart, 'Services', 2),
      ],
    );
  }
}
