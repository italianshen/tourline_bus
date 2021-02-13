import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/bussiness/contact_us/widgets/nearby_attracts_list__content_view.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  /// banner
  List<String> bannerDatas = [];

  String _eventString = "no message";
  String _dataString = "d_dataString";

  static const methodChannel = MethodChannel('com.flutterToNative');
  static const eventChannel = EventChannel('com.nativeToFlutter');
  static const dataChannel = EventChannel('samples.flutter.io/message');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannerDatas.add("https://resources.ninghao.net/images/free_hugs.jpg");
    bannerDatas
        .add("https://resources.ninghao.net/images/childhood-in-a-picture.jpg");
    bannerDatas.add("https://resources.ninghao.net/images/contained.jpg");
    bannerDatas.add("https://resources.ninghao.net/images/dragon.jpg");
    bannerDatas.add("https://resources.ninghao.net/images/free_hugs.jpg");

//    //监听接收消息
//    dataChannel
//        .receiveBroadcastStream()
//        .listen(_getDataData, onError: _getError);
//
//    eventChannel.receiveBroadcastStream().listen(_getData, onError: _getError);
  }

  //获得到xiaoxi
  void _getData(dynamic data) {
    //更新状态
    setState(() {
      _eventString = data.toString();
    });
  }

  void _getDataData(dynamic data) {
    //更新状态
    setState(() {
      _dataString = data.toString();
    });
  }

  //获取到错误
  void _getError(Object err) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('联系我们'),
          // actions: [
          //   InkWell(
          //     child: Container(
          //       padding: EdgeInsets.only(right: 15.0),
          //       alignment: Alignment.centerLeft,
          //       child: Text('test'),
          //     ),
          //     onTap: () {
          //       // TestPage
          //       // _gotoTestPage();
          //     },
          //   )
          // ],
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return _createBannerView(ctx);
            } else if (index == 1) {
              return _createNoticeView(ctx);
            } else if (index == 2) {
              return _createCenterEnteranceView(ctx);
            } else if (index == 3) {
              return _createNearByTitleView(ctx);
            } else if (index == 4) {
              return _createNearByBodyView(context);
            } else if (index == 5) {
              return _createNearByAttractsTitleView(context);
            } else if (index == 6) {
              return NearByAttractsListContentView();
            }else {
              return Container();
            }
          },
        ));
  }

  /// 跳转到主页
  _gotoTestPage() async{
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return TestPage();
    // }));

    //相册
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    File image1 = await  ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);

    debugPrint("image1:$image1");
  }

  /// 创建banner https://zhuanlan.zhihu.com/p/88790923
  _createBannerView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 422.0.h,
      child: new Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          String image_url = bannerDatas[index];
          return new Image.network(
            image_url,
            fit: BoxFit.fitWidth,
            width: screenWidth,
            height: 422.0.h,
          );
        },
        itemCount: bannerDatas.length,
        pagination: new SwiperPagination(),
      ),
    );
  }

  /// 创建提示公告
  _createNoticeView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maqueueWidth = screenWidth - 64.0.w;
    return Container(
      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 24.0.h),
      color: Color(0xFFFCFCFC),
      child: Stack(
        alignment: AlignmentDirectional.center,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0.w),
            child: Container(
              padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
              alignment: Alignment.centerLeft,
              color: Color(0xFFFFEBD9),
              width: double.infinity,
              height: 72.0.h,
              child: Image.asset(
                'images/contact_us/icon_32_notice@2x.png',
                width: 32.0.w,
                height: 32.0.w,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 64.0.w,
            child: Container(
              width: maqueueWidth,
              height: 72.0.h,
              child: new MarqueeWidget(
                text: "亲爱游客，十一期间夜间中轴观光线路运营时间延长至…23:30",
                textStyle:
                    new TextStyle(fontSize: 24.0.sp, color: Color(0xFFFF7C00)),
                scrollAxis: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(
            width: 24.0.w,
          ),
        ],
      ),
    );
  }

  /// 创建观光巴士线路
  _createCenterEnteranceView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double picH = 260.0.h;
    return Container(
      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 24.0.h),
      height: 260.0.h,
      color: Color(0xFFFCFCFC),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0.w),
            child: Image.network(
              'https://resources.ninghao.net/images/free_hugs.jpg',
              width: screenWidth,
              height: picH,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: 28.0.w,
              bottom: 25.0.h,
              child: Text(
                '深圳观光巴士',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0.sp,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  /// 创建附近站点标题
  _createNearByTitleView(BuildContext context) {
    return _createTitleView(context, '附近站点');
  }

  /// 创建附近景点
  _createNearByAttractsTitleView(BuildContext context) {
    return _createTitleView(context, '附近景点');
  }

  /// 创建标题视图
  _createTitleView(BuildContext context, String title) {
    return Container(
      color: Color(0xF3f5F8),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: 24.0.w, right: 24.0, top: 36.0.h, bottom: 24.0.h),
      child: Text(title,
          style: TextStyle(
              color: Color(0xFF1B1B1B),
              fontSize: 32.0.sp,
              fontWeight: FontWeight.bold)),
    );
  }

  /// 创建附近站点标题
  _createNearByContentView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    debugPrint("screenWidth:$screenWidth");
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 0.0.h),
      child: Card(
        child: Column(
          children: [
            Container(
              height: 108.0.h,
              color: Colors.white,
              padding: EdgeInsets.only(left: 28.0.w, right: 28.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          'images/contact_us/icon_32_station@2x.png',
                          width: 32.0.w,
                          height: 32.0.w,
                          scale: 1.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                          child: Text(
                            "深南香蜜立交公交站",
                            style: TextStyle(
                                fontSize: 36.0.sp, color: Color(0xFF1B1B1B)),
                          ),
                        ),
                        Image.asset(
                          'images/contact_us/icon_36_address@2x.png',
                          width: 24.0.w,
                          height: 24.0.w,
                          scale: 1.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: Text(
                            "108米",
                            style: TextStyle(
                                fontSize: 24.0.sp, color: Color(0xFF999999)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/contact_us/icon_bar_daohang@2x.png',
                    width: 48.0.w,
                    height: 48.0.w,
                    scale: 1.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 1.0.h,
              width: double.infinity,
              color: Color(0xFFD8D8D8),
            ),
          ],
        ),
      ),
    );
  }

  /// 创建附件站点下面的内容
  _createNearByBodyView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
      color: Color(0xF3F5F8),
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
              color: Color(0x295D7092),
              blurRadius: 20.0.w,
              offset: Offset(0, 4.0.h))
        ], borderRadius: BorderRadius.all(Radius.circular(16.0.w.toDouble()))),
        child: Column(
          children: [
            Container(
              height: 108.0.h,
              color: Color(0xF3F5F8),
              child: Container(
                padding: EdgeInsets.only(left: 28.0.w, right: 28.0.w),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0.w.toDouble()),
                    topRight: Radius.circular(16.0.w.toDouble()),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/contact_us/icon_32_station@2x.png',
                            width: 32.0.w,
                            height: 32.0.w,
                            scale: 1.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding:
                                EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                            child: Text(
                              "深南香蜜立交公交站",
                              style: TextStyle(
                                  fontSize: 36.0.sp,
                                  fontFamily: "PingFangSC-Semibold",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1B1B1B)),
                            ),
                          ),
                          Image.asset(
                            'images/contact_us/icon_36_address@2x.png',
                            width: 24.0.w,
                            height: 24.0.w,
                            scale: 1.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: Text(
                              "108米",
                              style: TextStyle(
                                  fontSize: 24.0.sp, color: Color(0xFF999999)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'images/contact_us/icon_bar_daohang@2x.png',
                      width: 48.0.w,
                      height: 48.0.w,
                      scale: 1.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.0.h,
              width: double.infinity,
              color: Color(0xFFD8D8D8),
              child: Text(_dataString),
            ),
            Container(
              height: 152.0.h,
              color: Color(0xF3F5F8),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 76.0.h,
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 28.0.w, right: 16.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '深南大道观光线',
                          style: TextStyle(
                              color: Color(0xFF1B1B1B),
                              fontFamily: "PingFangSC-Medium",
                              fontSize: 32.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '12分钟',
                          style: TextStyle(
                              color: Color(0xFF3391E7),
                              fontFamily: "PingFangSC-Medium",
                              fontSize: 32.0.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75.0.h,
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 28.0.w, right: 28.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '下一站：华侨城',
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: "PingFangSC-Regular",
                              fontSize: 24.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '12分钟',
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: "PingFangSC-Regular",
                              fontSize: 24.0.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1.0.h,
                    width: double.infinity,
                    color: Color(0xFFD8D8D8),
                    child: Text(_dataString),
                  ),
                ],
              ),
            ),
            Container(
              height: 152.0.h,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 76.0.h,
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 28.0.w, right: 16.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '深南大道观光线',
                          style: TextStyle(
                              color: Color(0xFF1B1B1B),
                              fontFamily: "PingFangSC-Medium",
                              fontSize: 32.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '未运营',
                          style: TextStyle(
                              color: Color(0xFFCBCBCB),
                              fontFamily: "PingFangSC-Medium",
                              fontSize: 32.0.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75.0.h,
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0.w.toDouble()),
                        bottomRight: Radius.circular(16.0.w.toDouble()),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 28.0.w, right: 36.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '下一站：华侨城',
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: "PingFangSC-Regular",
                              fontSize: 24.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '12分钟',
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: "PingFangSC-Regular",
                              fontSize: 24.0.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
