import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter/bussiness/contact_us/widgets/contact_us.dart';
import 'package:my_flutter/bussiness/message/widgets/message.dart';
import 'package:my_flutter/bussiness/style/app_style.dart';
import 'package:my_flutter/bussiness/tickets/widgets/my_tickets.dart';
import 'package:my_flutter/bussiness/to_buyTicket/widgets/to_buy_ticket.dart';
class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with AutomaticKeepAliveClientMixin{

  /// 当前索引号
  var currentIndex = 0;
  /// 联系我们
  ContactUsPage contactUsPage;
  /// 消息
  MessagePage messagePage;
  /// 我的车票
  MyTicketsPage myTicketsPage;
  /// 去购票
  ToBuyTicketPage toBuyTicketPage;

  /// 当前显示的页面
  Widget currentPage(){
    switch (currentIndex) {
      case 0:
        if (contactUsPage == null){
          contactUsPage = ContactUsPage();
        }
        return contactUsPage;
      case 1:
        if (messagePage == null){
          messagePage = MessagePage();
        }
        return messagePage;
      case 2:
        if (myTicketsPage == null){
          myTicketsPage = MyTicketsPage();
        }
        return myTicketsPage;
      case 3:
        if (toBuyTicketPage == null){
          toBuyTicketPage = ToBuyTicketPage();
        }
        return toBuyTicketPage;
      default:
        return Container();
    }
  }

  /// 底部tabBar
  List<BottomNavigationBarItem> tabBarItems(){
    return [
      new BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 0
                ? "images/tabBar/icon_bar_kefu@2x.png"
                : "images/tabBar/icon_bar_kefu@2x.png",
            color: currentIndex == 0
                ? tabSelColor
                : tabNormalColor,
            scale: 1.0,
            width: 32.0,
            height: 32.0,
          ),
          label: '联系我们',
      ),
      new BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 1
                ? "images/tabBar/icon_bar_message@2x.png"
                : "images/tabBar/icon_bar_message@2x.png",
            color: currentIndex == 1
                ? tabSelColor
                : tabNormalColor,
            scale: 1.0,
            width: 32.0,
            height: 32.0,
          ),
        label: '消息',
      ),
      new BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 2
                ? "images/tabBar/icon_bar_my_ticket@2x.png"
                : "images/tabBar/icon_bar_my_ticket@2x.png",
            color: currentIndex == 2
                ? tabSelColor
                : tabNormalColor,
            width: 32,height: 32,
            scale: 1.0,
          ),
          label: '我的车票',
      ),
      new BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 3
                ? "images/tabBar/icon_bar_buy_ticket@2x.png"
                : "images/tabBar/icon_bar_buy_ticket@2x.png",
            color: currentIndex == 3
                ? tabSelColor
                : tabNormalColor,
            scale: 1.0,
            width: 32.0,
            height: 32.0,
          ),
         label: '去购票',
      )
    ];
  }



  /// 页面构造方法
  @override
  Widget build(BuildContext context) {
    _initScreenUtils(context);
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: tabBarItems(),
        unselectedItemColor: tabNormalColor,
        selectedItemColor: tabSelColor,
        unselectedIconTheme: IconThemeData(color: tabNormalColor),
        selectedIconTheme: IconThemeData(color: tabSelColor),
        currentIndex: currentIndex,
        elevation: 0,
        iconSize: 32.0,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ) ,
      body: currentPage(),
    );
  }

  /// 初始化scrrenUtil
  _initScreenUtils(BuildContext context){
    //fill in the screen size of the device in the design
    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
      //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context,width: 750.0,height: 1334.0);
    //If you want to set the font size is scaled according to the system's "font size" assist option
    ScreenUtil.init(context,width: 750.0,height: 1334.0,allowFontScaling: false);
  }

  @override
  bool get wantKeepAlive => true;
}
