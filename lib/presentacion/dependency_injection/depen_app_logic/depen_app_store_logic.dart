import 'package:our_future/dominio/models/category_store.dart';
import 'package:our_future/infraestructura/app_logic/infra_store_logic.dart';
//import 'package:our_future/infraestructura/app_logic/infra_store_logic.dart';
//import 'package:our_future/infraestructura/data_source/infra_login.dart';

class DepenAppStoreLogic {
  DepenAppStoreLogic({
    InfraStoreLogic repository,
  }) : _repository = repository;

  InfraStoreLogic _repository;

  List<CategoryStore> getCartegoria() => _repository.getCartegoria();
  List<CategoryStore> getPopularCartegoria() =>
      _repository.getPopularCartegoria();
}
