//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//HotelHomeScreen
class GeneralProfessionsScreen extends StatefulWidget {
  @override
  _GeneralProfessionsState createState() => _GeneralProfessionsState();
}

class _GeneralProfessionsState extends State<GeneralProfessionsScreen> {
  CategoryType categoryType = CategoryType.ui;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
