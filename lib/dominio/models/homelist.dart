import 'package:flutter/cupertino.dart';
//import 'package:our_future/general_professions/generalProfessionsScreen.dart';

class HomeList {
  Widget navigateScreen;
  String imagePath;

  HomeList({
    this.navigateScreen,
    this.imagePath,
  });

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/construccion.png',

      //navigateScreen: GeneralProfessionsScreen(), //
    ),
    HomeList(
      imagePath: 'assets/images/Lubricadora.jpg',

      //navigateScreen: GeneralProfessionsScreen(), //
    ),
    HomeList(
      imagePath: 'assets/images/psicologos.jpg',

      //navigateScreen: GeneralProfessionsScreen(), //
    ),
    HomeList(
      imagePath: 'assets/images/sistema.jpg',

      //navigateScreen: GeneralProfessionsScreen(), //
    ),
    HomeList(
      imagePath: 'assets/images/buffet.jpg',

      //navigateScreen: GeneralProfessionsScreen(), //
    ),
    HomeList(
      imagePath: 'assets/images/Logo.jpg',

      //navigateScreen: GeneralProfessionsScreen(), //
    ),
    HomeList(
      imagePath: 'assets/images/finanzas.png',

      //navigateScreen: GeneralProfessionsScreen(), //
    ),
  ];
}
