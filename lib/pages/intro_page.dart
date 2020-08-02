import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurante_app/repository/user_repository/user_repositroy.dart';
import 'package:restaurante_app/services/client_http_service.dart';
import 'package:restaurante_app/services/shared_local_storage_service.dart';
import 'package:restaurante_app/stores/user_store/user_store.dart';
import 'package:restaurante_app/utils/global_const.dart';


class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  UserStore _userStore;

  @override
  void initState() {
    super.initState();
    _userStore = UserStore(
        repository: UserRepositroy(client: ClientHttpService()),
        storage: SharedLocalStorageService());

    _userStore.mainPage();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: globalIntroPage,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/background.png",
                      ))),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0.5),
                        Color(0xFFF032A7B).withOpacity(0.80)
                      ])),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Image.asset(
                            "assets/logo.png",
                            height: 300,
                          ),
                        ),
                      
                      Expanded(
                        child: Observer(builder: (_) {
                           return _userStore.loading?
                        Container(child: Center(child: CircularProgressIndicator(),),):Container( child: Center(child: Text("Verificando dados de acesso", style: TextStyle(color: Colors.white),)),);
                        },
                        ),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}
