import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductsRow(screenWidth),
              const SizedBox(height: 30),
              _buildSectionTitle("Popular Services"),
              const SizedBox(height: 20),
              _buildProductsRow(screenWidth),
            ],
          ),
        ],
      ),
    );
  }

  // Build a row of product cards
  Row _buildProductsRow(double screenWidth) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.95,
          height: 192,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildProductCard();
            },
          ),
        ),
      ],
    );
  }

  // Build a single product card
  Padding _buildProductCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 157,
        height: 192,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.white,
        ),
        child: Column(
          children: [
            _buildProductImage(),
            _buildProductTitle(),
            const SizedBox(height: 10),
            _buildProductRating(),
          ],
        ),
      ),
    );
  }

  // Build product image with price tag
  SizedBox _buildProductImage() {
    return SizedBox(
      height: 107,
      width: 151,
      child: Stack(
        children: [
          Image.asset(ImageAssets.productpic),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              width: 55,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorManager.mainColor,
              ),
              child: Center(
                child: Text(
                  '\$100',
                  style: mediumMontserratStyle(
                      fontSize: FontSize.s10, color: ColorManager.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build product title
  SizedBox _buildProductTitle() {
    return SizedBox(
      height: 37,
      width: 136,
      child: Center(
        child: Text(
          'Logo Design -Graphic Design Graphic Design',
          maxLines: 2,
          textScaler: const TextScaler.linear(1),
          style: mediumMontserratStyle(
              fontSize: FontSize.s10, color: ColorManager.black),
        ),
      ),
    );
  }

  // Build product rating and review count
  SizedBox _buildProductRating() {
    return SizedBox(
      height: 15,
      width: 89,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(SvgAssets.star),
          Text(
            "(4.5)",
            style: regularMontserratStyle(
                fontSize: FontSize.s10, color: const Color(0xffFFCB31)),
          ),
          Text(
            '|',
            style: regularMontserratStyle(
                fontSize: FontSize.s10, color: ColorManager.grey),
          ),
          SvgPicture.asset(SvgAssets.group),
          Center(
            child: Text(
              '20',
              style: regularMontserratStyle(
                  fontSize: FontSize.s10, color: ColorManager.grey),
            ),
          ),
        ],
      ),
    );
  }

  // Build section title
  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        title,
        style: semiBlodMontserrat(
            fontSize: FontSize.s15, color: ColorManager.black),
      ),
    );
  }
}
