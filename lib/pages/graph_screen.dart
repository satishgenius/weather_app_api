import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_api/pages/mydrawer.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final List<Feature> features = [
    Feature(
      title: 'India',
      color: Colors.red,
      data: [0.1, 0.1, 0.8, 0.9, 1, 1.2],
    ),
    Feature(
      title: 'Germany',
      color: Colors.black,
      data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
    ),
    Feature(
      title: 'Usa',
      color: Colors.orange,
      data: [0.4, 0.2, 0.9, 0.5, 0.6, 0.4],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        title:Text("GraphData",
          textAlign: TextAlign.start,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              "FiveDays data",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20,),
          LineGraph(
            features: features,
            size: Size(420, 420),
            labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', ],
            labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
            showDescription: true,
            graphColor: Colors.black87,
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}