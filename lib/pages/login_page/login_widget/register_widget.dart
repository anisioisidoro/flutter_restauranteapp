import 'package:flutter/material.dart';
import 'package:restaurante_app/shared_widget/shared_widget.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWisgetState createState() => _RegisterWisgetState();
}

class _RegisterWisgetState extends State<RegisterWidget>  with  SingleTickerProviderStateMixin{
  
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
   
    
    animationController = AnimationController(vsync: this, duration: Duration(
      seconds: 1
    ));

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(parent: animationController, 
    curve: Curves.fastOutSlowIn));

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
   
    super.dispose();
    animationController.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(animation: animationController, 
    builder: (BuildContext context, Widget child) {
      return Transform(
        transform: Matrix4.translationValues(animation.value * size.width, 0.0, 0.0),
        child: Column(
      children: <Widget>[
        SharedWidget.textFildLogin(hint: "Username"),
        SharedWidget.textFildLogin(hint: "Password"),
        SharedWidget.textFildLogin(hint: "Confirm Password"),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 150,
          child: RaisedButton(
              color: Color(0xFFFED145B),
              onPressed: () {},
              child: Text(
                "REGISTER",
                style: TextStyle(color: Colors.white),
              ),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
        ),

        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            children: <Widget>[
              Text("Já tenho uma conta", style: TextStyle(color: Colors.blue.withOpacity(0.7)),),
              SizedBox(width: 2,),
              Text("Clica",style: TextStyle(color: Color(0xFFFED145B))),
              SizedBox(width: 2,),
              Text("para entrar", style: TextStyle(color: Colors.blue.withOpacity(0.7)))
            ],
          ),
        )
      ],
    ),
      );
      }, 

    );
  }
}
