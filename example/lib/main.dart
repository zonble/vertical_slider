import 'package:flutter/material.dart';
import 'package:vertical_slider/vertical_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical Slider Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Vertical Slider Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
          color: Colors.black,
          child: Center(
              child: Container(
                  width: 100,
                  height: 300,
                  child: VerticalSlider(
                    backgroundColor: Colors.white38,
                    foregroundColor: Colors.white,
                    value: 0.5,
                    onValueChanged: (value) {
                      print(value);
                    },
                  )))));
}
