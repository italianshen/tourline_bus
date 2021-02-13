import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("测试页面"),
      ),
      body: Container(
        color: Colors.orange,
        padding: EdgeInsets.only(
            left: 12.0, right: 12.0, top: 18.0, bottom: 18.0),
        height: 96.0,
        child: Container(
//          height: 96.0,
          padding: EdgeInsets.only(
              left: 14.0, right: 14.0),
          color: Colors.blue,
          child: Row(
            children: [
              Image.network('https://resources.ninghao.net/images/free_hugs.jpg',width: 80.0,height: 60.0,fit: BoxFit.cover,),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    color: Colors.red,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 25.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "深圳市市民中心",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xFF1B1B1B),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PingFangSC-Medium"),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      "108米",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xFF999999),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "PingFangSC-Regular"),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 34.0,
                                child: Text(
                                  "深圳市民中心是集政府、人大、博物馆、会堂等多功能为一体…",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "PingFangSC-Regular"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        InkWell(
                          child: Container(
                            alignment: Alignment(0, 0),
                            width: 50.0,
                            height: 24.0,
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(12.0))),
                            child: Text("解说",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "PingFangSC-Regular")),
                          ),
                          onTap: () {
                            debugPrint("解说");
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        
      ),
    );
  }
}
