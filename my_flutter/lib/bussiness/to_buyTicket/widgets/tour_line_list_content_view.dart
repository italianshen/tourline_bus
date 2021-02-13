import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TourLineContentDataListView extends StatefulWidget {
  @override
  _TourLineContentDataListViewState createState() => _TourLineContentDataListViewState();
}

class _TourLineContentDataListViewState extends State<TourLineContentDataListView> {

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
            return _createCenterEnteranceView(ctx,index);
          },
          itemCount: datas.length,
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

  /// 创建观光巴士线路
  _createCenterEnteranceView(BuildContext context,int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double picH = 260.0.h;
    return Container(
      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 24.0.h,bottom: index == (datas.length - 1)
          ? 28.0.h.toDouble()
          : 0.0),
      height: 260.0.h, decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                index == 0 ? 16.0.w.toDouble() : 0.0),
            topRight: Radius.circular(
                index == 0 ? 16.0.w.toDouble() : 0.0),
            bottomLeft: Radius.circular(index == (datas.length - 1)
                ? 16.0.w.toDouble()
                : 0.0),
            bottomRight: Radius.circular(index == (datas.length - 1)
                ? 16.0.w.toDouble()
                : 0.0),
          ),
        ),
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

}
