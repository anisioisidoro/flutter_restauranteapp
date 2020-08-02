import 'package:flutter/material.dart';
import 'package:restaurante_app/models/login_model.dart';
import 'package:restaurante_app/pages/home_page/home_page.dart';
import 'package:restaurante_app/repository/user_repository/user_repositroy.dart';
import 'package:restaurante_app/services/client_http_service.dart';
import 'package:restaurante_app/services/shared_local_storage_service.dart';
import 'package:restaurante_app/shared_widget/shared_widget.dart';
import 'package:restaurante_app/stores/user_store/user_store.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  TextEditingController _telemovel;
  TextEditingController _senha;

  UserStore _userStore;

  @override
  void initState() {
    _telemovel = TextEditingController();
    _senha = TextEditingController();

    _userStore = UserStore(
        repository: UserRepositroy(client: ClientHttpService()),
        storage: SharedLocalStorageService());

    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 1, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.translationValues(
                animation.value * size.width, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                SharedWidget.textFildLogin(
                    hint: "Nome de Usuario ou Telemovel",
                    controller: _telemovel),
                SharedWidget.textFildLogin(hint: "Senha", controller: _senha),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 150,
                  child: RaisedButton(
                    color: Color(0xFFFED145B),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (BuildContext context) => HomePage()

                      _userStore.login(
                        modelToJson: LoginModel(
                          telemovel: _telemovel.text,
                          senha: _senha.text
                        )
                      );
                      // ));
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Center(
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), height: 2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: RaisedButton(
                            color: Colors.white,
                            child: Text(
                              "Facebook",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 120,
                        child: RaisedButton(
                            color: Colors.white,
                            child: Text(
                              "Google",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {}),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Não tenho uma conta",
                        style: TextStyle(color: Colors.blue.withOpacity(0.7)),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("Clica",
                          style: TextStyle(color: Color(0xFFFED145B))),
                      SizedBox(
                        width: 2,
                      ),
                      Text("para registar",
                          style: TextStyle(color: Colors.blue.withOpacity(0.7)))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
