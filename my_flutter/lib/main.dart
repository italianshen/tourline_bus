import 'package:flutter/material.dart';
import 'package:my_flutter/app.dart';

import 'bussiness/animation_demo/widgets/animation_demo_home.dart';
import 'bussiness/animation_demo/widgets/color_tween_animation_demo.dart';
import 'bussiness/animation_demo/widgets/curve_animation.dart';
import 'bussiness/animation_demo/widgets/scale_animation_demol.dart';
import 'bussiness/animation_demo/widgets/tween_animation_demo.dart';
import 'bussiness/animation_demo/widgets/tween_sequence_anmation_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Map<String, WidgetBuilder> routes = {
    'animation_demo_home': (context) => AnimationDemoHome(),
    'scale_animation_demo': (context) => ScaleAnimationDemo(),
    'tween_animation':(context) => TweenAnimationDemo(),
    'color_tween_animation':(context) => TweenAnimationDemoPage(),
    'curve_animation':(context) => CurveAnimationdemo(),
    'sequence_animation_dmeo':(context) => TweenSequenceAnimationDemo()
  };


  // This widget is the root of your application.
  // JsonConvert
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      routes: routes,
//      initialRoute: 'sequence_animation_dmeo',
      home: AppPage(),
    );
  }
}

