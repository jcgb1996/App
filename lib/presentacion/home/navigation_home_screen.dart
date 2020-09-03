//import 'dart:io';
//import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:our_future/presentacion/Utils/constants/app_theme.dart';
import 'package:our_future/presentacion/home/custom_drawer/drawer_user_controller.dart';
import 'package:our_future/presentacion/home/custom_drawer/home_drawer.dart';
//import 'package:our_future/presentacion/home/custom_drawer/home_drawer.dart';
//import 'package:our_future/custom_drawer/drawer_user_controller.dart';
//import 'package:our_future/custom_drawer/home_drawer.dart';
import 'package:our_future/presentacion/home/help_screen.dart';
import 'package:our_future/presentacion/home/home_screen.dart';

String usuarioLog;

class NavigationHomeScreen extends StatefulWidget {
  //const NavigationHomeScreen({Key key, this.nombrePersona}) : super(key: key);
  //final String nombrePersona;
  //void initState() {
  //  usuarioLog = nombrePersona;
  //}

  @override
  _NavigationHomeScreen createState() => _NavigationHomeScreen();
}

class _NavigationHomeScreen extends State<NavigationHomeScreen> {
  //const _NavigationHomeScreen({Key key, this.nombrePersona}) : super(key: key);
  Widget screenView;
  DrawerIndex drawerIndex;
  //final String nombrePersona;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          //screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          //screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
