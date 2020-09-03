import 'package:get_it/get_it.dart';
import 'package:our_future/dominio/i_dominio/dom_app_logic.dart';
import 'package:our_future/dominio/i_dominio/dom_login.dart';
import 'package:our_future/infraestructura/app_logic/infra_app_logic.dart';
import 'package:our_future/infraestructura/data_source/infra_login.dart';
import 'package:our_future/presentacion/dependency_injection/depen_app_logic/depen_app_logic.dart';
import 'package:our_future/presentacion/dependency_injection/depen_login/depen_login.dart';

GetIt locator = GetIt.instance;

void setupInjector() {
  locator.registerFactory<ValidaLogin>(() => InfraValidaLogin());
  locator.registerFactory<LogicApp>(() => InfraObtenerIp());

  locator.registerSingleton(Depenlogin(repository: locator.get<ValidaLogin>()));
  locator.registerSingleton(DepenAppLogic(repository: locator.get<LogicApp>()));
}
