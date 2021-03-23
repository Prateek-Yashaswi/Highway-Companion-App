import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class traffic extends StatefulWidget {
  @override
  _trafficState createState() => _trafficState();
}


class _trafficState extends State<traffic> {
  Position _currentPosition;
  bool getter=false;
  String _currentAddress=" ";
  var lat=null;
  var lon=null;
  bool sivin=false;
  var currentSpeed;
  var freeFlowSpeed;
  var currentTravelTime;
  var freeFlowTravelTime;
  dynamic confidence;
  bool roadClosure;
  var error="";
  bool bigoof=false;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        lat=position.latitude;
        lon=position.longitude;
      });
      _getAddressFromLatLng();
      getter=true;
    }).catchError((e) {
      print(e);
      setState(() {
        error=e;
        bigoof=true;
      });
    });
  }
  
  _getAddressFromLatLng() async {
    if(bigoof==false){
      try {
        List<Placemark> p = await geolocator.placemarkFromCoordinates(
            _currentPosition.latitude, _currentPosition.longitude);
        Placemark place = p[0];
        setState(() {
          _currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country}";
        });
      } catch (e) {
        print(e);
        bigoof=true;
      }
    }
  }

  Future getTrafficStatus() async {
    if(bigoof==false){
      http.Response response = await http.get("https://api.tomtom.com/traffic/services/4/flowSegmentData/absolute/10/json?point=$lat%2C$lon&unit=KMPH&key=1JGMsj0RqCoLpoI6pABXJPbt6YqW7FtJ");
      print("Lat = $lat && Lon = $lon");
      var results=jsonDecode(response.body);
      setState(() {
        sivin=true;
        print(results);
        this.roadClosure=results["flowSegmentData"]["roadClosure"];
        this.currentSpeed=results["flowSegmentData"]["currentSpeed"];
        this.freeFlowSpeed=results["flowSegmentData"]["freeFlowSpeed"];
        this.currentTravelTime=results["flowSegmentData"]["currentTravelTime"];
        this.freeFlowTravelTime=results["flowSegmentData"]["freeFlowTravelTime"];
        this.confidence=(results["flowSegmentData"]["confidence"])*100;
      });
    }
    else{
      error="Error Getting Data From API";
    }
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Traffic Details"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Image.asset("lib/Assets/gif/trafficlight.gif"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Colors.black,
                                  width: 4.0, // Underline thickness
                                ))
                            ),
                            alignment: Alignment.centerRight,
                            child: Text("Live Traffic \nStatus At \nYour Location",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 70,),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.black,
                              width: 2.0, // Underline thickness
                            ))
                        ),
                      child: Text("You Are Located At",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                    SizedBox(height: 10,),
                    getter==true ? Text(_currentAddress,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),) : Text("Loading...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),
              ),
              sivin==false ? GFButton(
                onPressed: (){
                  try{
                    getTrafficStatus();
                  }
                  catch(e){
                    print(e);
                    error="Error getting data from api";
                    setState(() {
                      bigoof=true;
                    });
                  }
                },
                text: "Get Status",
                color: Colors.black,
                shape: GFButtonShape.pills,
              ):
                bigoof ?
                  Text(error)
                  :
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Road Closure:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        Text("$roadClosure".toUpperCase()),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current Speed:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("$currentSpeed"+" KMPH"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Free Flow Speed:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("$freeFlowSpeed"+" KMPH"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current Travel Time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("$currentTravelTime"+" Min."),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Free Flow Travel Time:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("$freeFlowTravelTime"+" Min."),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Confidence:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("$confidence"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
