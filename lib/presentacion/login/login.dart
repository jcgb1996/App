import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:get_ip/get_ip.dart';
//import 'package:our_future/infraestructura/app_logic/infra_app_logic.dart';
//import 'package:our_future/infraestructura/app_logic/infra_app_logic.dart';
import 'package:our_future/presentacion/Utils/constants/constants.dart';
import 'package:our_future/presentacion/dependency_injection/Injector.dart';
import 'package:our_future/presentacion/dependency_injection/depen_app_logic/depen_app_logic.dart';
import 'package:our_future/presentacion/dependency_injection/depen_login/depen_login.dart';
import 'package:our_future/presentacion/home/navigation_home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();
  final iLogin = locator.get<Depenlogin>();
  final iAppLogic = locator.get<DepenAppLogic>();
  //String _ip = 'Unknown';
  //bool esSesionIniciada = false;
  //String _email;
  //String _password;
  @override
  void initState() {
    iAppLogic.returgetIp();
    super.initState();
    //initPlatformState();
  }

  //Future<void> initPlatformState() async {
  //  String ipAddress;
  //  //String _ip = "";
  //  // Platform messages may fail, so we use a try/catch PlatformException.
  //  try {
  //    ipAddress = await GetIp.ipAddress;
  //  } on PlatformException {
  //    ipAddress = 'Failed to get ipAdress.';
  //  }
//
  //  if (!mounted) return;
//
  //  setState(() {
  //    //_ip = ipAddress;
  //  });
  //}

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }

  //@override
  //void initState() {
  //  super.initState();
  //  //initPlatformState();
  //  //sSesionIniciada = iLogin.returValidaSesionIniciada(_ip);
  //}

  //Text box correo
  Widget _buildUsuarioTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Usuario",
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: usuarioController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: 14.0,
              ),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Ingrese su Usuario',
              hintStyle: kHintTextStyle,
            ),
            //validator: (value) => value.isEmpty ? 'Correo vacio' : null,
          ),
        )
      ],
    );
  }

//text box contraseña
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: contrasenaController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Ingrese su Contraseña',
              hintStyle: kHintTextStyle,
            ),
            //validator: (value) => value.isEmpty ? 'Contraseña vacia' : null,
          ),
        ),
      ],
    );
  }

//olvido su contraseña
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          '¿Se te olvidó tu contraseña?',
          style: kLabelStyle,
        ),
      ),
    );
  }

//btn iniciar sesion
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (usuarioController.text.isNotEmpty) {
            if (contrasenaController.text.isNotEmpty) {
            } else {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Recupera el texto que el usuario ha digitado utilizando nuestro
                    // TextEditingController
                    content: Text("Ingrese la contraseña"),
                  );
                },
              );
            }
            //String ip = _ip;
            if (iLogin.returValidaLogin(
              usuarioController.text,
              contrasenaController.text,
            )) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigationHomeScreen(),
                ),
              );
            } else {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Recupera el texto que el usuario ha digitado utilizando nuestro
                    // TextEditingController
                    content: Text("El usuario y contraseña son requeridos"),
                  );
                },
              );
            }
          } else {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Recupera el texto que el usuario ha digitado utilizando nuestro
                  // TextEditingController
                  content: Text("Ingrese el nombre de usuario"),
                );
              },
            );
          }
        }, //() =>print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Iniciar sesión',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

//Registrarse
  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '¿No tienes una cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Regístrate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Form(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Inicia Sesión',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildUsuarioTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildLoginBtn(),
                        _buildSignupBtn(),
                      ],
                    ),
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
