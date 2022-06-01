import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/dimensions.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_controller) {
      return Center(
        child: Container(
          // margin: Dimensions.isSmallScreen
          //     ? EdgeInsets.only(left: Dimensions.screenWidth * 0)
          //     : EdgeInsets.only(left: Dimensions.screenWidth * .05),
          // color: Colors.amber,
          width: (Dimensions.isSmallScreen)
              ? Dimensions.screenWidth
              : Dimensions.screenWidth * .9,
          height: (Dimensions.isSmallScreen)
              ? Dimensions.screenHeight * .3
              : Dimensions.screenHeight * .86,
          child: CarouselSlider(
            carouselController: _controller.carouselController,
            items: _controller.generateImagesTiles,
            options: CarouselOptions(
              // initialPage: _currentIndex,
              enlargeCenterPage: true,
              viewportFraction: (Dimensions.isSmallScreen) ? .8 : 1,
              // autoPlay: true,
              aspectRatio: (Dimensions.isSmallScreen)
                  ? (Dimensions.screenWidth * .8) /
                      (Dimensions.screenHeight * .3)
                  : (Dimensions.screenWidth *
                      .9 *
                      1 /
                      (Dimensions.screenHeight * .86)),
              onPageChanged: (index, other) {
                _controller.currentNabBarIndex = index;
                _controller.update();
              },
            ),
          ),
        ),
      );
    });
  }
}
