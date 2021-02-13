import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tags/flutter_tags.dart';
class TourLineShuttleBusContentListView extends StatefulWidget {
  @override
  _TourLineShuttleBusContentListViewState createState() => _TourLineShuttleBusContentListViewState();
}

class _TourLineShuttleBusContentListViewState extends State<TourLineShuttleBusContentListView> {

  List<String> datas = [];

  List<String> tags = [];

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

    tags.add("深南大道观光线");
    tags.add("滨海休闲线");
    tags.add("夜景中轴线");
    tags.add("Andorid");
    tags.add("Swift");
    tags.add("JavaScript");
    tags.add("Angular JS");
    tags.add("React Native");
    tags.add("Flutter");
    tags.add("Vue JS");
    tags.add("Spring");
    tags.add("Python");
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
              return _createListViewItem(context, idx);
            }
          },
          itemCount: datas.length * 2,
        ),
      ),
    );
  }
  
  /// 构建内容视图列表项
  Widget _createListViewItem(BuildContext context,int index) {
    double picWidth = 160.0.w;
    double picHeight = 120.h;
    final List<Widget> chips = tags.map<Widget>((String tag) {
      return Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        key: ValueKey<String>(tag),
        backgroundColor: Colors.white,
        label: Text(
          tag,
          style: new TextStyle(fontSize: 14.0),
        ),
      );
    }).toList();

    return Container(
      height: 246.0.h,
      padding: EdgeInsets.only(
          left: 28.0.w, right: 28.0.w, top: 36.0.h, bottom: 36.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft:
          Radius.circular(index == 0 ? 16.0.w.toDouble() : 0.0),
          topRight:
          Radius.circular(index == 0 ? 16.0.w.toDouble() : 0.0),
          bottomLeft: Radius.circular(
              index == (datas.length - 1) ? 16.0.w.toDouble() : 0.0),
          bottomRight: Radius.circular(
              index == (datas.length - 1) ? 16.0.w.toDouble() : 0.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text('观光线路24小时车票',style: TextStyle(
                                  fontSize: 32.0.sp,
                                  color: Color(0xFF1B1B1B),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "PingFangSC-Semibold"),),
                              padding: EdgeInsets.only(top: 0.0.h),
                              color: Colors.white,
                            ),

                            Expanded(
                              child: Container(color: Colors.orange,),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 176.0.w,
                      height: 246.0.h,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text('购票须知',style: TextStyle(
                          fontSize: 24.0.sp,
                          color: Color(0xFF5D7092),
                          fontWeight: FontWeight.w400,
                          fontFamily: "PingFangSC-Regular"),),
                            padding: EdgeInsets.only(top: 0.0.h),
                            color: Colors.white,
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 28.0.w, right: 28.0.w),
                            margin: EdgeInsets.only(top: 35.0.h),
                            height: 56.0.h,
                            width: double.infinity,
                            child: FlatButton(
                              color: Color(0xFF3391E7),
                              textColor: Colors.white,
                              child: Text('购票',style: TextStyle(
                                  color: Colors.white,
                                  fontSize:26.sp
                              ),),
                              onPressed: (){
                                debugPrint('点击购票');

                              },),
                          ),
                          Container(
                            color: Colors.white,
                            child: Text('￥ 30',style: TextStyle(
                                fontSize: 24.0.sp,
                                color: Color(0xFF5D7092),
                                fontWeight: FontWeight.w400,
                                fontFamily: "PingFangSC-Regular"),),
                            padding: EdgeInsets.only(top: 10.0.h),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
    
  }

}

