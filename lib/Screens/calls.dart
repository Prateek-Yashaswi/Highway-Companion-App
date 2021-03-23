import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class calls extends StatefulWidget {
  @override
  _callsState createState() => _callsState();
}

class _callsState extends State<calls> {

  int groupValue = 0;
  int tele=0;

  finalizePhone(int groupValue){
    if(groupValue==0){
      tele=null;
    }
    else if(groupValue==1){
      tele=100;
    }
    else if(groupValue==2){
      tele=1800116062;
    }
    else if(groupValue==3){
      tele=102;
    }
    else if(groupValue==4){
      tele=101;
    }
    else if(groupValue==5){
      tele=1033;
    }
    else if(groupValue==6){
      tele=1078;
    }
    else if(groupValue==7){
      tele=9540161344;
    }
    else if(groupValue==8){
      tele=1073;
    }
    else if(groupValue==8){
      tele=1363;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
          title: Text("Hotlines"),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              GFRadioListTile(
                titleText: 'Police Station',
                subtitleText: 'Call 100',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),
                ),
                size: 25,
                activeBorderColor: Colors.black,
                focusColor: Colors.black,
                radioColor:Colors.black,
                type: GFRadioType.basic,
                value: 1,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'National Highway Authority',
                subtitleText: 'Call 1800-11-6062',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 2,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'Ambulance',
                subtitleText: 'Call 102',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 3,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'Fire Department',
                subtitleText: 'Call 101',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 4,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'National Highway Helpline',
                subtitleText: 'Call 1033',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 5,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'Disaster Management',
                subtitleText: 'Call 1078',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 6,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'Air Ambulance',
                subtitleText: 'Call 9540161344',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 7,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'Road Accident Emergency',
                subtitleText: 'Call 1073',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 8,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
              GFRadioListTile(
                titleText: 'Tourist Helpline',
                subtitleText: 'Call 1363',
                avatar: GFAvatar(
                  backgroundImage: AssetImage('lib/Assets/Images/call.png'),

                ),
                size: 25,
                activeBorderColor: Colors.black,
                radioColor:Colors.black,
                focusColor: Colors.black,
                type: GFRadioType.basic,
                value: 9,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
                inactiveIcon: null,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            height: 50,
            child: GFButton(
              onPressed: groupValue==0 ? null  : () async{
                await finalizePhone(groupValue);
                (tele==null) ? print("Error Generating The Phone Number....") : launch("tel://$tele");
                },
              shape: GFButtonShape.pills,
              size: GFSize.LARGE,
              text: groupValue==0 ? "Please Select An Option" : "Make The Call",
              textStyle: TextStyle(fontSize: 20),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
