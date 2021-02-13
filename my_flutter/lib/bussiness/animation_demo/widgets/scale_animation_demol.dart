import 'package:flutter/material.dart';

class ScaleAnimationDemo extends StatefulWidget {
  @override
  _ScaleAnimationDemoState createState() => _ScaleAnimationDemoState();
}

class _ScaleAnimationDemoState extends State<ScaleAnimationDemo>
    with SingleTickerProviderStateMixin {
  /// 尺寸
  double _size = 100;

  /// 动画控制器
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..addListener(() {
            setState(() {
              _size = 100 + 100 * _controller.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              _controller.forward();
            } else if (status == AnimationStatus.completed) {
              _controller.reverse();
            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('比例动画'),
        actions: [
          IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                print("回退");
                _controller.reverse();
              })
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            height: _size,
            width: _size,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '点我放大',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
