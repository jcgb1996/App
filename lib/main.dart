import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ip/get_ip.dart';
import 'package:our_future/presentacion/Utils/constants/app_theme.dart';
import 'package:our_future/presentacion/dependency_injection/Injector.dart';
import 'package:our_future/presentacion/dependency_injection/depen_login/depen_login.dart';
import 'package:our_future/presentacion/home/navigation_home_screen.dart';
//import 'package:our_future/presentacion/home/navigation_home_screen.dart';
import 'package:our_future/presentacion/init_loading.dart';
import 'package:our_future/presentacion/login/login.dart';
//import 'package:our_future/presentacion/login/login.dart';
//import 'package:our_future/presentacion/login/login.dart';
//import 'package:our_future/login/login.dart';
//import 'package:our_future/navigation_home_screen.dart';

//import '../Utils/constants/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();

  // Ejecuta el arranque de la aplicacion de forma asincrona
  //Orientacion del dispositivo, muestra la imagen del disposito dependiente su orientacion
  //DeviceOrientation.portraitUp => si el dispositivo se gira a 90 gragos a corde a las manecillas del reloj
  //DeviceOrientation.portraitDown => si el dispositivo se gira a 180 gragos a corde a las manecillas del reloj
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: "Our Future",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: OurFurure(), //Login(), //NavigationHomeScreen(),
    );
  }
}

class OurFurure extends StatefulWidget {
  @override
  _OurFurureState createState() => _OurFurureState();
}

class _OurFurureState extends State<OurFurure> {
  //String _networkInterface;
  //String _ip = 'Unknown';
  bool tieneSesionIniciada = false;
  Widget screenView;
  final iLogin = locator.get<Depenlogin>();
  @override
  initState() {
    super.initState();
    initPlatformState();
    screenView = MyIconSpinner();
  }

  Future<void> initPlatformState() async {
    String ipAddress;
    bool sessionState = false;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ipAddress = await GetIp.ipAddress;
      var ll = iLogin.returValidaSesionIniciada(ipAddress);
      sessionState = ll;
    } on PlatformException {
      ipAddress = 'Failed to get ipAddress.';
      sessionState = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      //_ip = ipAddress;
      tieneSesionIniciada = sessionState;
      screenView = tieneSesionIniciada
          ? NavigationHomeScreen()
          : Login(); //OurFurure(), //Login(), //NavigationHomeScreen(),
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: "Our Future",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: screenView,
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
