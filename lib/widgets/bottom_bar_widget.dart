import 'package:flutter/material.dart';
import 'package:web_app/utils/dimensions.dart';
import 'package:web_app/widgets/big_text.dart';

class BottomBarWidget extends StatelessWidget {
  BottomBarWidget({Key? key}) : super(key: key);
  // final Map<String, List<String>> alllinks = {
  //   "About": ["Contact Us", "About Us", "Careers"],
  //   "help": ["Contact Us", "About Us", "Careers"],
  //   "Social": ["Contact Us", "About Us", "Careers"]
  // };
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.screenWidth,
        height: (Dimensions.isSmallScreen)
            ? Dimensions.screenHeight * .25
            : Dimensions.screenHeight * .4,
        margin: EdgeInsets.only(top: Dimensions.height20 * 2),
        padding: EdgeInsets.all(Dimensions.height30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(.2, .2),
            end: FractionalOffset(1, 1),
            stops: [0, 1],
            colors: [
              Color.fromARGB(255, 51, 145, 239),
              Color.fromARGB(255, 31, 72, 106)
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: (Dimensions.isSmallScreen) ? smallBottomBar : largeBottomBar);
  }

  Widget get largeBottomBar {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //details
            Container(
              // color: Colors.amber,
              width: Dimensions.screenWidth * .3,
              child: links,
            ),
            //divider
            Container(
              height: Dimensions.screenHeight * .25,
              width: Dimensions.height10 * .35,
              color: Colors.white,
            ),
            // address
            Container(
              width: Dimensions.screenWidth * .5,
              padding: EdgeInsets.only(left: Dimensions.screenWidth * .1),
              child: details,
            ),
          ],
        ),
        verticalDivider,
        footer,
      ],
    );
  }

  Widget get smallBottomBar {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        links,
        verticalDivider,
        footer,
      ],
    );
  }

  Widget get links => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          linksColumn(
              header: "About", sections: ["Contact Us", "About Us", "Careers"]),
          linksColumn(
              header: "help", sections: ["Payment", "Cancellation", "FAQ"]),
          linksColumn(
              header: "social", sections: ["tiwitter", "facebook", "YouTube"]),
        ],
      );

  Widget get details => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: ,
        children: [
          BigText(
              text: "Email: ashrfabdulsalam95@gmail.com", color: Colors.white),
          BigText(text: "67b kostkova, Belgorod, Russia ", color: Colors.white),
        ],
      );

  Widget get footer => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(text: "Copyright", color: Colors.white),
          Icon(
            IconData(0xe198, fontFamily: 'MaterialIcons'),
            color: Colors.white,
          ),
          BigText(text: "  2022 | A4", color: Colors.white),
        ],
      );

  Widget get verticalDivider => Container(
        width: Dimensions.screenWidth * .9,
        height: Dimensions.height10 * .4,
        color: Colors.white60,
      );
  Widget linksColumn({required String header, required List<String> sections}) {
    return Column(
        // width: Dimensions.width10*.1
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: header.toUpperCase(),
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: Dimensions.height10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sections
                .map((e) => BigText(
                      text: e,
                      color: Colors.white,
                      size: Dimensions.font16,
                    ))
                .toList(),
          )
        ]);
  }
}
