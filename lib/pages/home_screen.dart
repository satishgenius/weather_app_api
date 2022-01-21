import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_api/pages/notifypage.dart';
import 'package:weather_app_api/services/data_service.dart';
import 'package:weather_app_api/pages/model.dart';
import 'package:weather_app_api/widgets/city_textfeilds.dart';
import 'package:data_connection_checker/data_connection_checker.dart';


void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  WeatherResponse _response;

  @override
  void initState() {
    super.initState();
    checkInternet().checkConnection(context);
  }

  @override
  void dispose() {
    checkInternet().listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                    child: Column(
                      children: [
                        Image.network(_response.iconUrl,),
                        Text(
                          '${_response.tempInfo.temperature}°',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(_response.weatherInfo.description)
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child:
                    BCTextFieldWidget(
                      title: 'City :',
                      controller: _cityTextController,),
                  ),
                ),

                ElevatedButton(onPressed: _search, child: Text('Search',),style: ElevatedButton.styleFrom(primary: Colors.grey),),
                ElevatedButton(onPressed: (){Get.to(NotifyPage());},
                  child: Text('Notify',),style: ElevatedButton.styleFrom(primary: Colors.grey),)
              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}

/// for the network checking
class checkInternet{

  StreamSubscription<DataConnectionStatus> listener;
  var InternetStatus = "Unknown";
  var contentmessage = "Unknown";

  void _showDialog(String title,String content ,BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: new Text(title),
              content: new Text(content),
              actions: <Widget>[
                new FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child:new Text("Close") )
              ]
          );
        }
    );
}


  checkConnection(BuildContext context) async{
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status){
        case DataConnectionStatus.connected:
          InternetStatus = " Wow!! Connected";
          contentmessage = "Connected to the Internet";
          _showDialog(InternetStatus,contentmessage,context);
          break;
        case DataConnectionStatus.disconnected:
          InternetStatus = "Oops!! disconnected to the Internet. ";
          contentmessage = "Please check your internet connection";
          _showDialog(InternetStatus,contentmessage,context);
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;

  }

}