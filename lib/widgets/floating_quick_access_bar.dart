import 'package:flutter/material.dart';
import 'package:web_app/utils/dimensions.dart';
import 'package:web_app/widgets/small_text.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({Key? key}) : super(key: key);

  @override
  State<FloatingQuickAccessBar> createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  final List<String> sections = ["History", "Science", "Philosephy", "Novels"];
  final List<IconData> icons = [
    Icons.location_on_sharp,
    Icons.calendar_month,
    Icons.group,
    Icons.wb_sunny_rounded
  ];
  double floatinQuickAccessBarWidth = (Dimensions.isSmallScreen)
      ? Dimensions.screenWidth * .9
      : Dimensions.screenWidth * .6;
  double floatinQuickAccessBarHeight = Dimensions.screenHeight * .1;
  int? hoveringIndex, pressedIndex;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dimensions.isSmallScreen
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: sections
                  .asMap()
                  .entries
                  .map((element) => smallScreenItem(
                      icon: icons[element.key], title: element.value))
                  .toList(),
            )
          : Container(
              // color: Colors.blue,
              width: floatinQuickAccessBarWidth,
              height: floatinQuickAccessBarHeight,
              margin: EdgeInsets.only(bottom: Dimensions.height20),
              // padding: EdgeInsets.all(Dimensions.screenHeight * .03),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0),
                    blurRadius: 7,
                    spreadRadius: 1,
                  )
                ],
                borderRadius: BorderRadius.circular(Dimensions.height10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: getElemets,
              ),
            ),
    );
  }

  // for small screen
  Widget smallScreenItem({required IconData icon, required String title}) {
    return Center(
      child: Container(
        width: Dimensions.screenWidth * .9,
        height: Dimensions.screenHeight * .08,
        margin: EdgeInsets.only(bottom: Dimensions.height10 * 1.5),
        child: Card(
          elevation: 5,
          child: Container(
            // color: Colors.amber[100],
            padding: EdgeInsets.only(left: Dimensions.height20),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: Dimensions.height20),
                SmallText(text: title, size: Dimensions.font16 * 1.15),
              ],
            ),
          ),
        ),
      ),
    );
  }
// for large screen

  List<Widget> get buttons {
    return sections.asMap().entries.map((element) {
      return InkWell(
        onHover: (value) {
          hoveringIndex = (value) ? element.key : -1;
          setState(() {});
        },
        onTap: () {
          pressedIndex = element.key;
          setState(() {});
        },
        child: Container(
          height: floatinQuickAccessBarHeight * .5,
          // width: Dimensions.screenWidth * .6 / sections.length,
          child: Center(
            child: Text(
              element.value,
              style: TextStyle(
                fontSize: Dimensions.font20 * .9,
                fontWeight: FontWeight.w600,
                color: (element.key == pressedIndex ||
                        element.key == hoveringIndex)
                    ? Colors.grey[900]
                    : Colors.grey[700],
              ),
            ),
          ),
          /*    decoration: BoxDecoration(
            // color: Colors.amber,
            border: (element.key < sections.length - 1)
                ? Border(
                    right: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  )
                : Border(),
          ),*/
        ),
      );
    }).toList();
  }

  Widget get divider {
    return SizedBox(
      height: floatinQuickAccessBarHeight * .8,
      child: VerticalDivider(
        width: 1,
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }

  List<Widget> get getElemets {
    List<Widget> elements = [];
    for (int i = 0; i < buttons.length - 1; i++) {
      elements.add(buttons[i]);
      elements.add(divider);
    }
    elements.add(buttons[buttons.length - 1]);
    return elements;
  }
}
