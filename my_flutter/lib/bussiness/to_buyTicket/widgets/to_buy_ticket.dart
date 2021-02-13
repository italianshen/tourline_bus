
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter/bussiness/to_buyTicket/widgets/tour_line_list_content_view.dart';
import 'package:my_flutter/bussiness/to_buyTicket/widgets/tour_line_shuttle_list_content_view.dart';
class ToBuyTicketPage extends StatefulWidget {
  @override
  _ToBuyTicketPageState createState() => _ToBuyTicketPageState();
}

class _ToBuyTicketPageState extends State<ToBuyTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("深圳观光巴士"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return _createHeaderView(ctx);
          } else if (index == 1) {
            return TourLineContentDataListView();
          } else if (index == 2) {
            return TourLineShuttleBusContentListView();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  /// 头部视图
  Widget _createHeaderView(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double picH = 422.0.h;
    double containerTopMargin =  348.0.h;
    return Container(
      color: Color(0xF3F5F8),
      padding: EdgeInsets.only(bottom: 10.0),
      height: 638.0.h,
      child: Stack(
        children: [
          Container(child: Image.network(
            'https://resources.ninghao.net/images/free_hugs.jpg',
            width: screenWidth,
            height: picH,
            fit: BoxFit.cover,
          ),),
          Positioned(
            top: containerTopMargin,
            left: 24.0.w,
            right: 24.0.w,
            child: Container(
              padding: EdgeInsets.only(left: 28.0.w,right: 28.0,top:36.0.h,bottom: 36.0.h),
              decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                      color: Color(0x295D7092),
                      blurRadius: 20.0.w,
                      offset: Offset(0, 4.0.h))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:
                  Radius.circular(16.0.w.toDouble()),
                  topRight:
                  Radius.circular(16.0.w.toDouble() ),
                  bottomLeft: Radius.circular(
                      16.0.w.toDouble()),
                  bottomRight: Radius.circular(
                       16.0.w.toDouble()),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '深圳观光巴士',
                    style: TextStyle(
                      fontSize: 36.0.sp,
                      color: Color(0xFF1B1B1B),
                      fontWeight: FontWeight.bold,
                      fontFamily: "PingFangSC-Semibold"),
                  ),
                  SizedBox(height:24.0.h,),
                  Text(
                      '深圳市民中心是集政府、人大、博物馆、会堂等多功能为一体的综合性建筑，它的建筑风格简洁、明快、大方庄重而又不失活力，是深圳最具有标志性的建筑之一。',
                    style: TextStyle(
                        fontSize: 26.0.sp,
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.normal,
                        fontFamily: "PingFangSC-Regular"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}
