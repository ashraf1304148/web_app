import 'package:flutter/material.dart';
import 'package:web_app/utils/dimensions.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: Dimensions.screenHeight * .75,
      width: Dimensions.screenWidth,
      child: Image.asset(
        "assets/images/background.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
