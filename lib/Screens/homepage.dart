import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GFAppBar(
          backgroundColor: Colors.black,
          title: Text("Cube Highways"),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  child: GFButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/makecalls");
                    },
                    text: "Helplines",
                    textStyle: TextStyle(color: Colors.black,fontSize: 25),
                    shape: GFButtonShape.pills,
                    type: GFButtonType.outline2x,
                    fullWidthButton: true,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  child: GFButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/weather");
                    },
                    text: "Weather Details",
                    textStyle: TextStyle(color: Colors.black,fontSize: 25),
                    shape: GFButtonShape.pills,
                    type: GFButtonType.outline2x,
                    fullWidthButton: true,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  child: GFButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/feedback");
                    },
                    text: "Recommendations",
                    textStyle: TextStyle(color: Colors.black,fontSize: 25),
                    shape: GFButtonShape.pills,
                    type: GFButtonType.outline2x,
                    fullWidthButton: true,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  child: GFButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/traffic");
                    },
                    text: "Traffic Details",
                    textStyle: TextStyle(color: Colors.black,fontSize: 25),
                    shape: GFButtonShape.pills,
                    type: GFButtonType.outline2x,
                    fullWidthButton: true,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
