import 'package:flutter/material.dart';

class TweenSequenceAnimationDemo extends StatefulWidget {
  @override
  _TweenSequenceAnimationDemoState createState() => _TweenSequenceAnimationDemoState();
}

class _TweenSequenceAnimationDemoState extends State<TweenSequenceAnimationDemo>  with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  Animation _colorAnimation;

  Animation _sizeAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(vsync: this,duration: Duration(
      seconds: 5
    ))..addListener(() {
      setState(() {});
    });

    _colorAnimation = ColorTween(begin: Colors.red,end: Colors.blue).animate(
        CurvedAnimation(parent: _animationController,
            curve: Interval(0.0,0.5)));

    /// sizeAnimation
    _sizeAnimation = Tween(begin: 100.0,end: 300.0).animate(
        CurvedAnimation(parent: _animationController,
            curve: Interval(0.5,1.0)));

    /// 开始动画
    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Sequence Animation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _sizeAnimation.value,
              width: _sizeAnimation.value,
              color: _colorAnimation.value
            )
          ],
        ),
      ),

    );
  }
}
