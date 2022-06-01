import 'package:flutter/material.dart';
import 'package:web_app/utils/dimensions.dart';
import 'package:web_app/widgets/Carousel_slider_widget.dart';
import 'package:web_app/widgets/aspect_ratio_widget.dart';
import 'package:web_app/widgets/nav_bar_widget.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.isSmallScreen
            ? Dimensions.screenWidth
            : Dimensions.screenWidth * .9,
        // width: Dimensions.screenWidth * .9,
        height: (Dimensions.isSmallScreen)
            ? Dimensions.screenHeight * .33
            : Dimensions.screenHeight * .9,
        // color: Colors.blue[200], 
        child: Stack(
          children: [
            Positioned(
              top: 0,

              // height: D,
              child: Center(
                  // color: Colors.blue,
                  child: CarouselSliderWidget()),
            ),
            AspectRatioWidget(),
            // nav bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NavBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
