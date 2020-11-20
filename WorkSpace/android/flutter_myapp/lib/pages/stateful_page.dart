import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class StatefulPage extends StatefulWidget {
  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  //底部导航栏当前选中状态
  int currentIndex = 0;

  //文字样式
  TextStyle textStyle =
      TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatefulPage",
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text("点我啊"),
        ),
        appBar: AppBar(
          leading: BackButton(),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                title: Text("首页"),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text("列表"),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                )),
          ],
        ),
        body: currentIndex == 0
            ? Container(
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
                    )
                  ],
                ),
              )
            : RefreshIndicator(
                //列表页面
                onRefresh: handRefresh,
                child: Container(
                  alignment: Alignment.center,
                  child: ListView(
                    children: <Widget>[
                      Image.asset(
                        "images/tupian.jpg",
                        width: 200,
                        height: 200,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "请输入账号信息",
                            hintStyle: TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future<Null> handRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
}
