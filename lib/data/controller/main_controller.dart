import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/data/repo/main_repo.dart';

class MainController extends GetxController {
  final MainRepo mainRepo;

  final CarouselController carouselController = CarouselController();
  final PageController pageController = PageController();
  final ScrollController scrollController = ScrollController();
  bool appBarVisability = true;
  double lastScrollPosition = 0, currentScrollPosition = 0, appBarOpacity = 1;
  int currentNabBarIndex = 0;
  List<String>? sliderImages;
  List<String>? sliderPlaces;
  List<String>? topBarItems;
  List<Widget>? generateImagesTiles;
  int? sliderPlacesLength;
  List<String>? featureImages;
  List<String>? featureNames;
  MainController({required this.mainRepo}) {
    initLoad;
  }

  void get initLoad {
    sliderImages = mainRepo.sliderImages;
    sliderPlaces = mainRepo.sliderPlaces;
    topBarItems = mainRepo.topBarItems;
    generateImagesTiles = mainRepo.generateImagesTiles();
    sliderPlacesLength = sliderPlaces!.length;
    featureImages = mainRepo.featureImages;
    featureNames = mainRepo.featureNames;
  }

  void get sliderUpdate {
    carouselController.jumpToPage(currentNabBarIndex);
  }

//app bar
  void appBarOpacityupdate(double position) {
    if (position >= currentScrollPosition) {
      lastScrollPosition = currentScrollPosition;
      currentScrollPosition = position;
    } else {
      appBarOpacity = 1;
      appBarVisability = true;
      currentScrollPosition = position;
    }

    (appBarOpacity < 0.5) ? appBarVisability = false : appBarOpacity -= 0.25;
  }
}
