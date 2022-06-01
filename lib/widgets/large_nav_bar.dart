import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/utils/dimensions.dart';

class LargeNavBar extends StatefulWidget {
  const LargeNavBar({Key? key}) : super(key: key);

  @override
  State<LargeNavBar> createState() => _LargeNavBarState();
}

class _LargeNavBarState extends State<LargeNavBar> {
  int? isHover;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_controller) {
      return Container(
        // padding: EdgeInsets.all(0),
        height: Dimensions.screenHeight * .08,
        width: Dimensions.screenWidth * .9,
        margin: EdgeInsets.only(
          left: Dimensions.screenWidth * .05,
          right: Dimensions.screenWidth * .05,
          top: Dimensions.screenHeight * .01,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 238, 238),
          borderRadius: BorderRadius.circular(Dimensions.height20),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _controller.sliderPlaces!.asMap().entries.map(
              (element) {
                return GestureDetector(
                    onTap: () {
                      _controller.currentNabBarIndex = element.key;
                      _controller.carouselController
                          .jumpToPage(_controller.currentNabBarIndex);
                    },
                    child: InkWell(
                      onHover: (value) {
                        isHover = (value) ? element.key : -1;
                        _controller.update();
                      },
                      onTap: () {
                        // isPressed = element.key;
                        _controller.currentNabBarIndex = element.key;
                        _controller.sliderUpdate;
                        _controller.update();
                      },
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              element.value.toString(),
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                            visible: ((element.key == isHover) ||
                                (element.key ==
                                    _controller.currentNabBarIndex)),
                            child: Container(
                              height: Dimensions.height10 * .8,
                              width: Dimensions.screenWidth /
                                  _controller.sliderPlacesLength! *
                                  .6,
                              margin: EdgeInsets.only(top: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: (element.key ==
                                        _controller.currentNabBarIndex)
                                    ? Colors.grey[800]
                                    : Colors.grey[400],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ));
              },
            ).toList()),
      );
    });
  }
}
  /*  Container(
                    height: Dimensions.screenHeight / 10,
                    width:
                        Dimensions.screenWidth * .9 / _controller.placesLength,
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        element.value.toUpperCase(),
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: (element.key == _controller.currentIndex)
                          ? Colors.amber[800]
                          : Colors.amber[300],
                      borderRadius: (element.key == 0)
                          ? BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            )
                          : (element.key == _controller.placesLength - 1)
                              ? BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                )
                              : BorderRadius.circular(0),
                    ),
                  ) */
               
 