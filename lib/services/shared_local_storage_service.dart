
import 'package:restaurante_app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future get({String key}) async {
      var shared = await SharedPreferences.getInstance();
      return shared.get("token");
    }
  
    @override
    Future put ({String key, String value}) async{
      var shared = await SharedPreferences.getInstance();

      shared.setString("token", value);
  }
}