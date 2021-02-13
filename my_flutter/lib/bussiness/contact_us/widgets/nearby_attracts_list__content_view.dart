import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearByAttractsListContentView extends StatefulWidget {
  @override
  _NearByAttractsListContentViewState createState() =>
      _NearByAttractsListContentViewState();
}

class _NearByAttractsListContentViewState
    extends State<NearByAttractsListContentView> {
  List<String> datas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    datas.add("1");
    datas.add("2");
    datas.add("3");
    datas.add("4");
    datas.add("5");
    datas.add("6");
    datas.add("7");
    datas.add("8");
    datas.add("9");
    datas.add("10");
    datas.add("11");
    datas.add("12");
  }

  @override
  Widget build(BuildContext context) {
    double picWidth = 160.0.w;
    double picHeight = 120.h;
    return Container(
      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, bottom: 24.0.w),
      color: Color(0xF3F5F8),
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
              color: Color(0x295D7092),
              blurRadius: 20.0.w,
              offset: Offset(0, 4.0.h))
        ], borderRadius: BorderRadius.all(Radius.circular(16.0.w.toDouble()))),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (ctx, index) {
            if (index.isOdd) {
              return Divider(
                color: Color(0xFFD8D8D8),
                height: 1.0,
              );
            } else {
              int idx = index ~/ 2;
              return Container(
                height: 192.0.h,
                padding: EdgeInsets.only(
                    left: 24.0.w, right: 24.0.w, top: 36.0.h, bottom: 36.0.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(idx == 0 ? 16.0.w.toDouble() : 0.0),
                    topRight:
                        Radius.circular(idx == 0 ? 16.0.w.toDouble() : 0.0),
                    bottomLeft: Radius.circular(
                        idx == (datas.length - 1) ? 16.0.w.toDouble() : 0.0),
                    bottomRight: Radius.circular(
                        idx == (datas.length - 1) ? 16.0.w.toDouble() : 0.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Image.network(
                      'https://resources.ninghao.net/images/candy-shop.jpg',
                      fit: BoxFit.cover,
                      width: picWidth,
                      height: picHeight,
                    ),
                    SizedBox(
                      width: 16.0.w,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.topLeft,
                      color: Colors.white,
                      padding: EdgeInsets.only(right: 9.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 50.0.h,
                                  child: Row(
                                    children: [
                                      Text(
                                        "深圳市市民中心",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 32.0.sp,
                                            color: Color(0xFF1B1B1B),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PingFangSC-Medium"),
                                      ),
                                      SizedBox(
                                        width: 16.0.w,
                                      ),
                                      Text(
                                        "108米",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 24.0.sp,
                                            color: Color(0xFF999999),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "PingFangSC-Regular"),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "深圳市民中心是集政府、人大、博物馆、会堂等多功能为一体…",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 24.0.sp,
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "PingFangSC-Regular"),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.0.w,
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment(0, 0),
                              width: 100.0.w,
                              height: 48.0.h,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(24.0.h.toDouble())),
                                  border: Border.all(
                                    width: 1.0.w,
                                    color: Color(0xFF3391E7)
                                  ),
                              ),
                              child: Text("解说",
                                  style: TextStyle(
                                      fontSize: 24.0.sp,
                                      color: Color(0xFF3391E7),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "PingFangSC-Regular")),
                            ),
                            onTap: () {
                              debugPrint("解说");
                            },
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              );
            }
          },
          itemCount: datas.length * 2,
        ),
      ),
    );
  }

  /// 构建底部视图
  Widget _createBottomView(BuildContext context) {
    return Container(
      height: 25.0,
      color: Colors.brown,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Text(
              'xxxvvv',
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Text(
            "xxxx",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ))
        ],
      ),
    );
  }
}
