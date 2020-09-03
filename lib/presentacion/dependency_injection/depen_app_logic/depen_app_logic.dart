import 'package:our_future/infraestructura/app_logic/infra_app_logic.dart';
//import 'package:our_future/infraestructura/data_source/infra_login.dart';

class DepenAppLogic {
  DepenAppLogic({InfraObtenerIp repository}) : _repository = repository;

  InfraObtenerIp _repository;

  void returgetIp() => _repository.getIp();
}
