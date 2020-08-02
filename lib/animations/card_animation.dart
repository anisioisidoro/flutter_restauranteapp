import 'package:flutter/material.dart';

class CardAnimation extends StatefulWidget {
  final Widget child;
  final int index;

  const CardAnimation({Key key, this.child, this.index}) : super(key: key);
  @override
  _CardAnimationState createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation>
    with SingleTickerProviderStateMixin {
  Animation animationLeft;
  Animation animationRight;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animationLeft = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationRight = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  void dispose() {
     animationController.dispose();
    super.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Transform(
              transform: Matrix4.translationValues(
                  (widget.index % 2 == 0
                      ? animationLeft.value * size.width
                      : animationRight.value * size.width),
                  0.0,
                  0.0),
              child: widget.child);
        });
  }
}
