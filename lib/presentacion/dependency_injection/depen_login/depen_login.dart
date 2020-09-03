import 'package:our_future/infraestructura/data_source/infra_login.dart';

class Depenlogin {
  Depenlogin({InfraValidaLogin repository}) : _repository = repository;

  InfraValidaLogin _repository;

  bool returValidaLogin(usuario, constrasena) =>
      _repository.validaLogin(usuario, constrasena);

  bool returValidaSesionIniciada(ip) => _repository.validaSesionIniciada(ip);
}
