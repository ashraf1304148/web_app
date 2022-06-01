import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/controller/main_controller.dart';
import 'package:web_app/widgets/bottom_bar_widget.dart';
import 'package:web_app/utils/dimensions.dart';
import 'package:web_app/widgets/background_widget.dart';
import 'package:web_app/widgets/featured_wedget.dart';
import 'package:web_app/widgets/floating_quick_access_bar.dart';
import 'package:web_app/widgets/menu_drawer.dart';
import 'package:web_app/widgets/slider_header.dart';
import 'package:web_app/widgets/slider_widget.dart';
import 'package:web_app/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _mainController = Get.find<MainController>();
  @override
  void initState() {
    super.initState();
    _mainController.initLoad;
    _mainController.pageController.addListener(() {
      setState(() {
        _mainController.pageController
            .jumpTo(_mainController.currentNabBarIndex.toDouble());
      });
    });
    _mainController.scrollController.addListener(() {
      setState(() {
        _mainController.appBarOpacityupdate(
            _mainController.scrollController.position.pixels);
      });
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: Dimensions.isSmallScreen
          ? AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xff077bd7)),
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Library',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize:
                  Size(Dimensions.screenWidth, Dimensions.screenHeight * .1),

              // color: Colors.red.withOpacity(.1),
              child: TopBar(),
            ),
      drawer: MenuDrawer(),
      body: Center(
        child: Container(
          width: Dimensions.screenWidth * 1,
          child: ListView(
            controller: _mainController.scrollController,
            children: [
              BackgroundWidget(),
              FloatingQuickAccessBar(),
              Featuredwidget(),
              SliderHeader(),
              SliderWidget(),
              BottomBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
