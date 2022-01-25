import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app_api/pages/mydrawer.dart';
class GraphWeather extends StatelessWidget {
  const GraphWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        title:Text("GraphData",
          textAlign: TextAlign.start,
        ),
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            DateFormat()
                .add_MMMMEEEEd()
                .format(DateTime.now()),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily:
              'flutterfonts',
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
            ),
          ),
        ),
        ])


    );
  }
}
