import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:our_future/presentacion/Utils/constants/app_theme.dart';

class MyIconSpinner extends StatefulWidget {
  MyIconSpinner({Key key, this.title, this.color = Colors.blue})
      : super(key: key);

  final String title;
  final Color color;

  @override
  _MyIconSpinnerState createState() => _MyIconSpinnerState();
}

class _MyIconSpinnerState extends State<MyIconSpinner>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFE0F7FA),
                      Color(0xFFE0F7FA),
                      Color(0xFFE0F7FA),
                      Color(0xFFE0F7FA),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: ClipRRect(
                    //borderRadius:
                    //    const BorderRadius.all(Radius.circular(60.0)),

                    child: Image.asset('assets/images/loaderrrunscreen.gif'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //value: SystemUiOverlayStyle.light),
    );
  }
}
