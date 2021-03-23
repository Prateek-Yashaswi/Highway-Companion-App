import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class weather extends StatefulWidget {
  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<weather> {

  @override
  void initState(){
    super.initState();
    _getCurrentLocation();
  }

  var temp;
  var humidity;
  var description;
  var currently;
  var windspeed;
  var lat;
  var lon;
  var visibility;
  Position _currentPosition;
  String _currentAddress=" ";
  bool status=false;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        lat=_currentPosition.latitude;
        lon=_currentPosition.longitude;
      });
      _getAddressFromLatLng();
      getWeather();
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {
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
    }
  }

  Future getWeather() async {
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=imperial&appid=8f1375b659ebde88d573f0489a729c20");
    print("Lat = $lat && Lon = $lon");
    var results=jsonDecode(response.body);
    setState(() {
      status=true;
      this.temp = results['main']["temp"];
      this.visibility=results["visibility"];
      this.description = results['weather'][0]["description"];
      this.currently = results['weather'][0]["main"];
      this.humidity = results['main']["humidity"];
      this.windspeed = results['wind']["speed"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Weather Details"),
          centerTitle: true,
          leading:  GFIconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            type: GFButtonType.transparent,
          ),
        ),

        body: status ? SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      status ? temp.toString()+"\u00B0F" : Text("Loading..."),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:40,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      _currentAddress!=null ? _currentAddress : Text("Loading..."),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0, // Underline thickness
                    ))
                ),
                child: Text("Current Conditions",style: TextStyle(fontSize: 24),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFListTile(
                  avatar: FaIcon(FontAwesomeIcons.eye,size: 30,),
                  icon: Text(status==true ? visibility.toString()+" m" : Text("Loading..."),style: TextStyle(fontSize: status ? 24 : 12),),
                  title: Text("  Visibility",style: TextStyle(fontSize: 24),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFListTile(
                  avatar: FaIcon(FontAwesomeIcons.cloud,size: 30,),
                  icon: Text(status==true ? currently.toString() : Text("Loading..."),style: TextStyle(fontSize: status ? 24 : 12),),
                  title: Text("  Weather",style: TextStyle(fontSize: 24),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFListTile(
                  avatar: FaIcon(FontAwesomeIcons.sun,size: 30,),
                  icon: Text(status==true ? humidity.toString() + " %" : Text("Loading..."),style: TextStyle(fontSize: status ? 24 : 12),),
                  title: Text("  Humidity",style: TextStyle(fontSize: 24),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFListTile(
                  avatar: FaIcon(FontAwesomeIcons.wind,size: 30,),
                  icon: Text(status==true ? windspeed.toString() + " mph" : Text("Loading..."),style: TextStyle(fontSize: status ? 24 : 12),),
                  title: Text("  Wind Speed",style: TextStyle(fontSize: 24),),
                ),
              ),
              SizedBox(height: 30,),
              status ? Padding(
                padding: const EdgeInsets.only(bottom:18.0),
                child: GFButton(
                  color: Colors.black,
                  onPressed: (){
                    Navigator.pushNamed(context, '/traffic');
                  },
                  text: "Get Traffic Details",
                  shape: GFButtonShape.pills,
                ),
              ) : Padding(
                padding: const EdgeInsets.only(bottom:18.0),
                child: Text("Turn On Your GPS And Come Again"),
              ) ,
            ],
          ),
        ) : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GFLoader(
              type: GFLoaderType.custom,
              duration: Duration(seconds: 5),
              child: Image(image: AssetImage("lib/Assets/gif/Loading2.gif"),
            )),
            SizedBox(height: 50,),
            Column(
              children: [
                Center(child: Text("Checking Weather Reports\n",style: TextStyle(fontWeight: FontWeight.bold),)),
                Center(child: Text("Note : Turn On Your GPS And Grant Location Access...",style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
