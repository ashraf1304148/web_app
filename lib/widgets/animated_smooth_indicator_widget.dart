import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimatedSmoothIndicatorWidget extends StatelessWidget {
  const AnimatedSmoothIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_controller) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Center(
            child: AnimatedSmoothIndicator(
          activeIndex: _controller.currentNabBarIndex,
          count: _controller.sliderPlaces!.length,
          curve: Curves.slowMiddle,
        )),
      );
    });
  }
}
