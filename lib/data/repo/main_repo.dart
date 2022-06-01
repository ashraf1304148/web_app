import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainRepo {
  final SharedPreferences sharedPreferences;
  MainRepo({required this.sharedPreferences});

  // String assetPath = "assets/images/";

  List<String> topBarItems = [
    "Home",
    "About",
    "Cooprate",
    "Contact",
  ];

  List<String> sliderImages = [
    "africa.jpeg",
    "aisa.jpeg",
    "antarctica.jpeg",
    "australia.jpeg",
    "north america.jpeg",
    "south america.jpeg",
    "urope.jpeg",
  ];
  List<String> sliderPlaces = [
    "Africa",
    "Aisa",
    "Antarctica",
    "Australia",
    "North America",
    "South America",
    "Europe",
  ];
  // List<String> featureImages =List.generate(160, (index) => "$index.jpg");
  // List<String> featureNames =List.generate(160, (index) => "$index.jpg");

  List<String> featureImages = [
    "africa.jpeg",
    "aisa.jpeg",
    "antarctica.jpeg",
    "australia.jpeg",
    "north america.jpeg",
    "south america.jpeg",
    "urope.jpeg",
  ];
  List<String> featureNames = [
    "Africa",
    "Aisa",
    "Antarctica",
    "Australia",
    "North America",
    "South America",
    "Europe",
  ];

  List<Widget> generateImagesTiles() {
    return sliderImages.map((element) {
      // print(element);
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/$element",
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList();
  }
}
