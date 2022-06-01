import 'package:flutter/material.dart';

 
import 'package:web_app/utils/dimensions.dart';
import 'package:web_app/widgets/animated_smooth_indicator_widget.dart';
import 'package:web_app/widgets/large_nav_bar.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return (Dimensions.isSmallScreen)
        ? AnimatedSmoothIndicatorWidget()
        :   LargeNavBar() ;
  }
}
