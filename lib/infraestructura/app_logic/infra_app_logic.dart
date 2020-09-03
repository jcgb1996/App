//Aqui se va a poner toda la logica que sea de aplicacion, como obtener IP, etc
import 'package:get_ip/get_ip.dart';
import 'package:our_future/dominio/i_dominio/dom_app_logic.dart';
//import 'package:our_future/dominio/i_dominio/dom_login.dart';

class InfraObtenerIp extends LogicApp {
  InfraObtenerIp();
  static String ip = "";

  @override
  void getIp() {
    initPlatformState();
  }

  void initPlatformState() async {
    //final ipAddress = "";
    try {
      var ipAddress = await GetIp.ipAddress;
      ip = ipAddress;
    } catch (ex) {
      var ipAddress = "";
      ip = ipAddress;
    }
  }
}
