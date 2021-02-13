import 'package:flutter/material.dart';

class CurveAnimationdemo extends StatefulWidget {
  @override
  _CurveAnimationdemoState createState() => _CurveAnimationdemoState();
}

class _CurveAnimationdemoState extends State<CurveAnimationdemo>  with SingleTickerProviderStateMixin{

  /// 动画控制器
  AnimationController _controller;

  /// 动画
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500))
                  ..addListener(() {
                    setState(() {});
                  });

    _animation = Tween(
      begin: 100.0,
      end: 200.0
    ).chain(CurveTween(curve: Curves.linear))
        .animate(_controller);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('比例动画'),
        actions: [
          IconButton(icon: Icon(Icons.stop), onPressed: (){
            _controller.stop();
          })
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){

            _controller.forward();
          },
          child: Container(
            height: _animation.value,
            width: _animation.value,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('点我放大',style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
            ),),
          ),
        ),
      ),
    );
  }
}
