import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/utils/dimensions.dart';

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_controller) {
      return Center(
        child: Container(
          // color: Color.fromRGBO(255, 193, 7, .2),
          child: (Dimensions.isSmallScreen)
              ? AspectRatio(
                  aspectRatio: 2.25,

                  // color: Colors.amber[100],
                  child: Center(
                    child: Text(
                      _controller.sliderPlaces![_controller.currentNabBarIndex]
                          .toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.height10 * 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Center(
                  child: AspectRatio(
                    aspectRatio: 2.25,

                    // color: Colors.amber[100],
                    child: Center(
                      child: Text(
                        _controller.sliderPlaces![_controller.currentNabBarIndex]
                            .toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.height10 * 5.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ),
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
