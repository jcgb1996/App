import 'package:our_future/dominio/i_dominio/dom_login.dart';
import 'package:our_future/dominio/models/login_models.dart';

class InfraValidaLogin extends ValidaLogin {
  InfraValidaLogin();

  @override
  bool validaLogin(String usuario, String contrasena) {
    LoginModels.nombreUsuario = "Jose Carlos";
    LoginModels.esSesionIniciada = true;
    return LoginModels.esSesionIniciada;
  }

  @override
  bool validaSesionIniciada(String ip) {
    LoginModels.nombreUsuario = "Jose Carlos Gonzalez";
    return false;
  }
}
