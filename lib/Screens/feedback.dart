import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class feedBack extends StatefulWidget {
  @override
  _feedBackState createState() => _feedBackState();
}

class _feedBackState extends State<feedBack> {

  var groupValue1=0;
  var groupValue2=1;
  var groupValue3=2;
  var gender=null;
  bool filled=false;
  var driverType=null;
  var ageGrp=null;

  @override
  void initState() {
    // TODO: implement initState
    gender=null;
    filled=false;
    driverType=null;
    ageGrp=null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Recommendations"),
          centerTitle: true,
        ),
        body: filled==false ? SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(55),bottomRight: Radius.circular(95)),
                  color: Colors.black,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(child: Image.asset("lib/Assets/gif/ZUiY.gif")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:28.0),
                      child: Container(
                        child: Center(child: Text("We Are Waiting For Your Response",style: TextStyle(color: Colors.white,fontSize: 20),)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 10,),
                    Text("Please State Your Gender",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.04),),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              //male and female
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text("Male"),
                      SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                      //male
                      GFRadio(
                        
                        size: GFSize.SMALL,
                        value: 1,
                        groupValue: groupValue1,
                        onChanged: (value) {
                          setState(() {
                            groupValue1 = value;
                            print(value);
                            gender="Male";
                            print(gender);
                          });
                        },
                        inactiveIcon: null,
                        activeBorderColor: Colors.black,
                        radioColor: Colors.black,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Female"),
                      SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                      //male
                      GFRadio(
                        
                        size: GFSize.SMALL,
                        value: 2,
                        groupValue: groupValue1,
                        onChanged: (value) {
                          setState(() {
                            groupValue1 = value;
                            print(value);
                            gender="Female";
                            print(gender);
                          });
                        },
                        inactiveIcon: null,
                        activeBorderColor: Colors.black,
                        radioColor: Colors.black,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              //Type Of Driver
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.airport_shuttle),
                    SizedBox(width: 10,),
                    Text("What Kind Of Vehicle Do You Drive",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.04),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Commercial"),
                        GFRadio(
                          
                          size: GFSize.SMALL,
                          value: 3,
                          groupValue: groupValue2,
                          onChanged: (value) {
                            setState(() {
                              groupValue2 = value;
                              print(value);
                              driverType="Commercial";
                              print(driverType);
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: Colors.black,
                          radioColor: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Family"),
                        GFRadio(
                          
                          size: GFSize.SMALL,
                          value: 4,
                          groupValue: groupValue2,
                          onChanged: (value) {
                            setState(() {
                              groupValue2 = value;
                              print(value);
                              driverType="Family";
                              print(driverType);
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: Colors.black,
                          radioColor: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Single"),
                        GFRadio(
                          
                          size: GFSize.SMALL,
                          value: 5,
                          groupValue: groupValue2,
                          onChanged: (value) {
                            setState(() {
                              groupValue2 = value;
                              print(value);
                              driverType="Single";
                              print(driverType);
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: Colors.black,
                          radioColor: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //AGE GROUP
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cake),
                    SizedBox(width: 10,),
                    Text("Which Age Group Do You Belong To",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.04),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("20 to 40"),
                        //male
                        GFRadio(
                          
                          size: GFSize.SMALL,
                          value: 6,
                          groupValue: groupValue3,
                          onChanged: (value) {
                            setState(() {
                              groupValue3 = value;
                              print(value);
                              ageGrp="20to40";
                              print(ageGrp);
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: Colors.black,
                          radioColor: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("40 to 60"),
                        //male
                        GFRadio(
                          size: GFSize.SMALL,
                          value: 7,
                          groupValue: groupValue3,
                          onChanged: (value) {
                            setState(() {
                              groupValue3 = value;
                              print(value);
                              ageGrp="40to60";
                              print(ageGrp);
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: Colors.black,
                          radioColor: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Others"),
                        GFRadio(
                          size: GFSize.SMALL,
                          value: 8,
                          groupValue: groupValue3,
                          onChanged: (value) {
                            setState(() {
                              groupValue3 = value;
                              print(value);
                              ageGrp="Others";
                              print(ageGrp);
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: Colors.black,
                          radioColor: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: 50,
                  child: GFButton(
                    onPressed: gender==null || driverType==null || ageGrp==null ? null :(){
                      setState(() {
                        filled=true;
                      });
                    },
                    text: "Submit",textStyle: TextStyle(fontSize: 20),
                    fullWidthButton: true,
                    shape: GFButtonShape.pills,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ):Container(
          child: Text("Filled Data Here"),
        ),
      ),
    );
  }
}
