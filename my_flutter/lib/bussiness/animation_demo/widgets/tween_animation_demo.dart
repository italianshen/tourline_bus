import 'package:flutter/material.dart';

class TweenAnimationDemo extends StatefulWidget {
  @override
  _TweenAnimationDemoState createState() => _TweenAnimationDemoState();
}

class _TweenAnimationDemoState extends State<TweenAnimationDemo> with SingleTickerProviderStateMixin{
  /// 尺寸
  double _size = 200;
  /// 动画控制器
  AnimationController _controller;

  /// 开始颜色
  Color _startColor = Colors.blue;
  /// 结束颜色
  Color _endColor = Colors.red;

  Color _color = Colors.blue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 5000))
      ..addListener(() {
        setState(() {
//          _size = 100 + 100 * _controller.value;
        /// lerp 在两个颜色之间实现插值
           _color = Color.lerp(_startColor, _endColor, _controller.value);
        });
      })
      ..addStatusListener((status) {
        if(status == AnimationStatus.dismissed){
          _controller.forward();
        }else if (status == AnimationStatus.completed){
//          _controller.reverse();
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
        title: Text('差值动画'),
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
            height: _size,
            width: _size,
            color: _color,
            alignment: Alignment.center,
            child: Text('点我变色',style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
            ),),
          ),
        ),
      ),
    );
  }
}
