//import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:our_future/presentacion/Utils/constants/app_theme.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 16,
                    right: 16),
                child: Image.asset('assets/images/helpImage.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '¿Cómo podemos ayudarte?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  'Si tienes algun problema con nuestro sistema \npongase en contacto con nosotros.\n\nEnviando un correo a soperte SoporteOurFuture@ourfuture.com \nque nosotros nos contactaremos con usted.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              //Expanded(
              //  //child: Padding(
              //  //  padding: const EdgeInsets.all(8.0),
              //  //  child: Center(
              //  //    child: Container(
              //  //      width: 140,
              //  //      height: 40,
              //  //      decoration: BoxDecoration(
              //  //        color: Colors.blue,
              //  //        borderRadius:
              //  //            const BorderRadius.all(Radius.circular(4.0)),
              //  //        boxShadow: <BoxShadow>[
              //  //          BoxShadow(
              //  //              color: Colors.grey.withOpacity(0.6),
              //  //              offset: const Offset(4, 4),
              //  //              blurRadius: 8.0),
              //  //        ],
              //  //      ),
              //  //      child: Material(
              //  //        color: Colors.transparent,
              //  //        child: InkWell(
              //  //          onTap: () {},
              //  //          child: Center(
              //  //            child: Padding(
              //  //              padding: const EdgeInsets.all(4.0),
              //  //              child: Text(
              //  //                'Habla con nosotros',
              //  //                style: TextStyle(
              //  //                  fontWeight: FontWeight.w500,
              //  //                  color: Colors.white,
              //  //                ),
              //  //              ),
              //  //            ),
              //  //          ),
              //  //        ),
              //  //      ),
              //  //    ),
              //  //  ),
              //  //),
              //)
            ],
          ),
        ),
      ),
    );
  }
}
