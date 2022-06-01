import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/utils/dimensions.dart';

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int x = 0x00A9;
  int? _isHovering, _isPressed;
  @override
  Widget build(BuildContext context) {
    print(Get.find<MainController>().appBarOpacity);
    return GetBuilder<MainController>(builder: (_controller) {
      return Visibility(
        visible: _controller.appBarVisability,
        child: Container(
          color: Colors.white.withOpacity(_controller.appBarOpacity),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Text(
                    'Library',
                    style: TextStyle(
                      color: Color(0xFF077bd7),
                      fontSize: 26,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  Icon(IconData(0xe198, fontFamily: 'MaterialIcons')),
                  SizedBox(width: Dimensions.screenWidth / 15),
                  Container(
                    width: Dimensions.screenWidth * .3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _controller.topBarItems!.asMap().entries.map(
                        (element) {
                          return InkWell(
                            onHover: (value) {
                              setState(() {
                                _isHovering = (value) ? element.key : -1;
                              });
                            },
                            onTap: () {
                              _isPressed = element.key;
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  element.value,
                                  style: TextStyle(
                                      color: _isHovering == element.key
                                          ? Color(0xFF077bd7)
                                          : Color(0xFF077bd7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering == element.key ||
                                      _isPressed == element.key,
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Color(0xFF051441),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
    //);
  }
}
