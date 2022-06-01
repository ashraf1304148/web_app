import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/widgets/divider_widget.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> x = ["askdjf", "klsdf", "lkdasfj"];
    return Drawer(
      child: GetBuilder<MainController>(builder: (_controller) {
        return Container(
          color: Color(0xFF077bd7),
          // width: 80,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: _controller.topBarItems!.asMap().entries.map((e) {
                    return Column(
                      children: [
                        // item
                        InkWell(
                          onTap: () {},
                          child: Text(
                            e.value,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        // divider
                        (e.key < _controller.topBarItems!.length - 1)
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                child: Divider(
                                  color: Colors.blueGrey.shade400,
                                  thickness: 2,
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
                  }).toList(),
                ),
                /*  MenuDrawerItem(name: "Home"),
                  DividerWidget(),
                  MenuDrawerItem(name: "About"),
                  DividerWidget(),
                  MenuDrawerItem(name: "Cooperate"),
                  DividerWidget(),
                  MenuDrawerItem(name: "Contact"),*/
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Copyright © 2021 | Ashraf',
                      style: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget MenuDrawerItem({required String name}) {
    return InkWell(
      onTap: () {},
      child: Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
