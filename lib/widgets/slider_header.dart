import 'package:flutter/material.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/dimensions.dart';
import 'package:web_app/widgets/big_text.dart';

class SliderHeader extends StatelessWidget {
  const SliderHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.only(bottom: Dimensions.height20 * 2),
      child: BigText(
        text: "Knowledge diversity ",
        color: AppColors.headerColor,
        size: Dimensions.isSmallScreen
            ? Dimensions.font20 * 1.6
            : Dimensions.font20 * 2.8,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
