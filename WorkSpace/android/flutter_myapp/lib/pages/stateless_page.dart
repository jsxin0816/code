import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class MystatelessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //文字样式
    TextStyle textStyle = TextStyle(
        color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold);
    void goBack() {
      print("返回了");
      Future.delayed(new Duration(seconds: 5), () {
        print("延时操作执行了");
      });
    }

    return MaterialApp(
      title: 'StatelessWidge',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatelessWidgePage"),
          leading: BackButton(
            onPressed: goBack,
          ), //返回按钮
        ),
        body: Container(
          decoration:
              BoxDecoration(color: Color(ColorUtil.intColor("#eeeeee"))),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("I am text", style: textStyle),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Icon(
                  Icons.android,
                  size: 50,
                  color: Colors.red,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Chip(
                    avatar: Icon(Icons.print),
                    label: Text("小组件"),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 20),
                color: Colors.grey,
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("我是卡片控件"),
                ),
              ),
              AlertDialog(
                title: Text("提示"),
                backgroundColor: Colors.grey,
                content: Text("欢迎来到智慧柜台"),
              ),
              Image.asset(
                "images/tupian.jpg",
                width: 600,
                height: 600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
