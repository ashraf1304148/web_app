import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/main.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/utils/dimensions.dart';
import 'package:web_app/widgets/big_text.dart';

class Featuredwidget extends StatelessWidget {
  Featuredwidget({Key? key}) : super(key: key);
  List<String>? images = Get.find<MainController>().featureImages;
  List<String>? names = Get.find<MainController>().featureNames;

  @override
  Widget build(BuildContext context) {
    // (!isLoaded) ? loading : (() {}());

    return Container(
      // width: Dimensions.screenWidth * .9,
      padding: EdgeInsets.all(Dimensions.screenWidth * .05),
      child: Column(
        children: [
          // title
          header,
          (Dimensions.isSmallScreen)
              ? getFutures(countPerScreenWidth: 2)
              : getFutures(countPerScreenWidth: 3),
          // items
        ],
      ),
    );
  }

  Widget get header => Center(
        child: Container(
          // color: Colors.amber[300],
          width: Dimensions.screenWidth * .9,
          // margin: EdgeInsets.only(bottom: Dimensions.height30),
          child: (Dimensions.isSmallScreen)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                        color: AppColors.headerColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font20 * 1.8,
                      ),
                    ),
                    Text(
                      "Clue of the wooden cottageee",
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font20,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                        color: AppColors.headerColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font20 * 1.8,
                      ),
                    ),
                    Text(
                      "Clue of the wooden cottage",
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font20,
                      ),
                    ),
                  ],
                ),
        ),
      );
// smart code to get features by count pre screen width
  Widget getFutures({int countPerScreenWidth = 3}) {
    double mainItemWidth =
        ((Dimensions.screenWidth * .9) / countPerScreenWidth) -
            Dimensions.height20;
    // double mainItemHeight = ((Dimensions.screenHeight * .95) / countPerScreen) -
    //     Dimensions.height20;
    double mainItemHeight =
        (Dimensions.isSmallScreen) ? mainItemWidth * 1.5 : mainItemWidth * .65;

    return Center(
      child: Container(
        width: Dimensions.screenWidth * .9,
        child: Column(
          children: <Widget>[
            for (int i = 0; i < images!.length / countPerScreenWidth.abs(); i++)
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (int g = 0; g < countPerScreenWidth; g++)
                    (i * countPerScreenWidth + g >= images!.length)
                        ? SizedBox()
                        : Container(
                            width: mainItemWidth,
                            height: mainItemHeight,
                            // width: 100,
                            // height: 300,
                            margin: EdgeInsets.all(Dimensions.height10),
                            decoration: BoxDecoration(),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // image
                                  Container(
                                    height: mainItemHeight * .85,
                                    width: mainItemWidth,
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.height20),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/${images![i * countPerScreenWidth + g]}"),
                                            fit: BoxFit.cover),
                                        color: Colors.amber),
                                  ),
                                  // text
                                  Center(
                                    child: BigText(
                                      text: names![i * countPerScreenWidth + g]
                                          .toString(),
                                      color: AppColors.headerColor,
                                    ),
                                  )
                                ]),
                          )
                ],
              ),
          ],
        ),
      ),
    );
  }
// this hard code to get
  /* Center(
              child: Column(
                children: (Dimensions.isSmallScreen)
                    ? List.generate(((images!.length / 2) + 1).toInt(),
                        (index) => getRow(start: index * 2, end: index * 2 + 2))
                    : List.generate(
                        ((images!.length / 3) + 1).toInt(),
                        (index) =>
                            getRow(start: index * 3, end: index * 3 + 3)),
              ),
            ),*/

// hard functions to use
/*
  late List<Widget> items;

  bool isLoaded = false;

  void get loading {
    itemsList;
  }

  List<Widget> get itemsList {
    items = images!.asMap().entries.map((e) {
      // print("path is: ${e.value}");
      return featureItem(name: names![e.key], path: "assets/images/" + e.value);
    }).toList();
    return items;
  }

  Widget getRow({required int start, required int end}) {
    // print("start is: $start\t end is: $end");
    if (end > images!.length) end = images!.length;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.sublist(start, end));
  }

  Widget featureItem({required String name, required String path}) {
    double itemWidth = Dimensions.isSmallScreen
        ? Dimensions.screenWidth * .43
        : Dimensions.screenWidth * .29;
    double itemHeight = Dimensions.screenHeight * .3;
    return Container(
      width: itemWidth,
      height: itemHeight,
      margin: EdgeInsets.only(bottom: Dimensions.height20),
      decoration: BoxDecoration(),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // image
        Container(
          height: itemHeight * .85,
          width: itemWidth,
          decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(Dimensions.height20),
              image:
                  DecorationImage(image: AssetImage(path), fit: BoxFit.cover)),
          // child: Image.asset(images[2]),
        ),
        // text
        Center(
          child: Text(name),
        )
      ]),
    );
  }
*/
}
