import 'package:flutter/material.dart';
import 'package:weather_app_api/pages/mydrawer.dart';
import 'package:weather_app_api/services/notifyservice.dart';




class NotifyPage extends StatefulWidget {
  const NotifyPage({Key key}) : super(key: key);

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  String notificationTitle = 'No Title';
  String notificationBody = 'No Body';
  String notificationData = 'No Data';

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    super.initState();
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        title:Text("Notification",
        textAlign: TextAlign.start,
      )
          ,
      ),
      //drawer: MainDrawer(),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
              color: Colors.grey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                notificationTitle,
                style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25),
              ),
              Text(
                notificationBody,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                notificationData,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}