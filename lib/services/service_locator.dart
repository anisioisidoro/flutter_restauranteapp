import 'package:get_it/get_it.dart';
import 'package:restaurante_app/repository/menu_repository/menu_repository.dart';
import 'package:restaurante_app/repository/reserve_repository/reserve_repository.dart';
import 'package:restaurante_app/repository/restaurant_repository/restaurant_repository.dart';
import 'package:restaurante_app/repository/user_repository/user_repositroy.dart';
import 'package:restaurante_app/stores/menu_store/menu_store.dart';
import 'package:restaurante_app/stores/reserve_store/reserve_store.dart';
import 'package:restaurante_app/stores/restaurant_store/restaurant_store.dart';
import 'package:restaurante_app/stores/user_store/user_store.dart';
import 'client_http_service.dart';
import 'shared_local_storage_service.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(UserStore(repository: UserRepositroy(client: ClientHttpService()), storage: SharedLocalStorageService()));
  locator.registerSingleton(RestaurantStore(repository:RestaurantRepository(client: ClientHttpService()) ));
  locator.registerSingleton(MenuStore(repository: MenuRepository(client: ClientHttpService())));
  locator.registerSingleton(ReserveStore(repository: ReserveRepository(client: ClientHttpService())));
}
