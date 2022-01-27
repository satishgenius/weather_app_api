import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_api/pages/graph_screen.dart';
import 'package:weather_app_api/pages/home_screen.dart';
import 'package:weather_app_api/pages/notifypage.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(accountName: Text("Satish"), accountEmail: Text("Satishcool4026@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("SK"),
            ),
          ),
          SizedBox(

            height: 5,
          ),
          ListTile(
            onTap: (){
              Get.off(HomeScreen());
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            onTap: (){
              Get.off(NotifyPage());
            },
            leading: Icon(Icons.notifications),
            title: Text("Notification"),
          ),
          ListTile(
            onTap: (){
              Get.off(GraphScreen());
            },
            leading: Icon(Icons.lock),
            title: Text("GraphScreen"),
          )
        ],
      ),
    );
  }
}