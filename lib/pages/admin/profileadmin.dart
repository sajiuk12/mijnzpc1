//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/musers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:mijnzpc/all_translations.dart';
class Profileadmin extends StatefulWidget {

  Profileadmin(
      {@required this.data,this.backgroundcolor,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor
      });

  Color backgroundcolor;
  Color color;
  Color bottomcolor;
  Color cardcolor;
  Color shadowcolor;
  Color appbarcolor;
  Color titlecolor;
  Color textcolor;
  Color bottombarcolor;

  final Musers data;

  @override
  State<StatefulWidget> createState() => new ProfileadminState();

}

class ProfileadminState extends State<Profileadmin> with AutomaticKeepAliveClientMixin<Profileadmin> {
  bool get wantKeepAlive => true;

  String first_name = '';
  String last_name = '';
  String registeras = '';
  String pic ='https://mijnzpc.com/deeee.jpg';
  String email = '';
  final String tell ='';
  String mobile = '';
  String kvk = '';
  String adress = '';
  String homenumber = '';
  String postalcode = '';
  String city = '';
  String birthdate = '';
  String gender = '';
  String educationtitle = '';
  String companyname = '';
  String ibannumber = '';
  String ibanholder = '';
  String btwnumber = '';
  String addressextra = '';
  String state = '';
  String country = '';
  String joinedat = '';
  String role = '';


  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    super.build(context);
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: new Text(allTranslations.text('Profile'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: Colors.white,

      ),
      backgroundColor: Colors.white.withOpacity(0.90),
      bottomSheet: SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 55,
    child:   new Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 30,
                child:  Padding(
                  padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                  child:  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child:  DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xff425626),
                                    Color(0xff89B44B),
                                  ]),
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]
                          ),
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: (){
                                // Navigator.push(context, new MaterialPageRoute(builder: (context) => new Mainregister()));
                              },
                              child: Padding(
                                padding:EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child:Center(
                                  child: Text(allTranslations.text('Upate Profile') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 14)),
                                ),
                              )
                          )
                      )
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text("".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
              Expanded(
                flex: 30,
                child:  Padding(
                  padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                  child:  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child:  DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xff425626),
                                    Color(0xff89B44B),
                                    //add more colors
                                  ]),
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]
                          ),
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: (){
                                // Navigator.push(context, new MaterialPageRoute(builder: (context) => new Mainregister()));
                              },
                              child: Padding(
                                padding:EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child:Center(
                                  child: Text(allTranslations.text('Deactivate') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 14)),
                                ),
                              )
                          )
                      )

                  ),
                ),
              ),
            ],
          ),
        ]
    ),
    ),
      body: Container(
      width: double.infinity,
      child: new SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xff425626),
                          Color(0xff89B44B),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 3.75),
                          color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                          blurRadius: 5
                      )
                    ],
                  ),
                  child:Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,5,0,0),
                        child: new  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 12,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                      child:  new  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 10, 2, 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(
                                                    child:
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: new Text(
                                                        first_name+" "+last_name,
                                                        textAlign: TextAlign.left,
                                                        style: const TextStyle(
                                                          //fontWeight: FontWeight.w700,
                                                          fontSize: 20.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0,0,0,15),
                                      child:  new  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 0, 2, 0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(
                                                    child:
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: new Text(
                                                        allTranslations.text(registeras),
                                                        textAlign: TextAlign.left,
                                                        style: const TextStyle(
                                                          //fontWeight: FontWeight.w500,
                                                          fontSize: 15.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 135,
                alignment: Alignment.center,
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:10.0,left: 10,right: 10),
                      child:   Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(0.0),
                          ),
                        ),
                        child:  new SingleChildScrollView(
                          child:new Column(
                              children: <Widget>[
                                new Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top:10,left:10,right: 10,bottom: 10),
                                      child:  new Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 0.0),
                                            child: new Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: new BoxDecoration(
                                                    image: new DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: new NetworkImage(
                                                          pic
                                                      ),
                                                    )
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 20,
                    child: Text(''),
                  ),
                  Expanded(
                    flex: 8,
                    child:    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      width: 50,
                      height: 50,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.settings_phone, color: Color(0xff89B44B)),
                            // onPressed:()=> _launchPhoneURL('09210886905'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child:    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      width: 50,
                      height: 50,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: new  Icon(Icons.alternate_email, color: Color(0xff89B44B),),
                            // onPressed:()=> _launchEmailURL('sajiuk12@gmail.com'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child:    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      width: 50,
                      height: 50,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.question_answer, color: Color(0xff89B44B)),
                            // onPressed:()=> _launchWhatsapp(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Text(''),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: new Column(
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                        },
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Theme(
                              data: ThemeData().copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.grey,
                                iconColor: Colors.grey,
                                title: Text(allTranslations.text('Personal information'),style: TextStyle(color: Colors.grey,
                                //fontWeight: FontWeight.w700,
                                  fontSize: 18.0,),),
                                children: <Widget>[
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('First name :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(first_name,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Last name :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(last_name,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //information collapse
              //contact collapse
              Padding(
                padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: new Column(
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                        },
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Theme(
                              data: ThemeData().copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.grey,
                                iconColor: Colors.grey,
                                title: Text(allTranslations.text('Contact information'),style: TextStyle(color: Colors.grey,
                                //fontWeight: FontWeight.w700,
                                  fontSize: 18.0,),),
                                children: <Widget>[
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Email :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        InkWell(
                                          onTap: () async {
                                            String url = 'mailto:' + email.toString();
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child:  Text( email.toString() ,style: TextStyle(color: Colors.grey,
                                            fontSize: 15.0,)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Phonenumber :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        InkWell(
                                          onTap: () async {
                                            String url = 'tel:' +tell.toString();
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child:  Text( tell.toString() ,style: TextStyle(color: Colors.grey,
                                            fontSize: 15.0,)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider(
                      //     color: Colors.amberAccent[400]
                      // ),
                    ],
                  ),
                ),
              ),
              //contact collapse
              //company collapse
              Padding(
                padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: new Column(
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                        },
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Theme(
                              data: ThemeData().copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.grey,
                                iconColor: Colors.grey,
                                title: Text(allTranslations.text('Company information'),style: TextStyle(color: Colors.grey,
                                //fontWeight: FontWeight.w700,
                                  fontSize: 18.0,),),
                                // subtitle: Text('Trailing expansion arrow icon'),
                                children: <Widget>[
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Kvk-number :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(kvk,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //company collapse
              //adress collapse
              Padding(
                padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 70),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: new Column(
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                        },
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Theme(
                              data: ThemeData().copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.grey,
                                iconColor: Colors.grey,
                                title: Text(allTranslations.text('Adress information'),style: TextStyle(color: Colors.grey,
                                //fontWeight: FontWeight.w700,
                                  fontSize: 18.0,),),
                                // subtitle: Text('Trailing expansion arrow icon'),
                                children: <Widget>[
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Adress :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(adress + " "+addressextra,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Homenumber :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(homenumber,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Postalcode :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(postalcode,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('City :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(city,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('State :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(state,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                    child:
                                    Row(
                                      children: <Widget>[
                                        Text(allTranslations.text('Country :'),style: TextStyle(color: Colors.grey[600],
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                        Text(country,style: TextStyle(color: Colors.grey,
                                        //fontWeight: FontWeight.w700,
                                          fontSize: 15.0,)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider(
                      //     color: Colors.amberAccent[400]
                      // ),
                    ],
                  ),
                ),
              ),
              //adress collapse
            ]),
    ),
    ),
    );
  }

  //  get data from server
  void initState() {
    super.initState();
    getdet();
  }
  //  get data from server

  Widget listIsEmpty() {
    return new Center(
      child: new Text(allTranslations.text('searching'),style:TextStyle(color: Colors.grey,)),
    );
  }

  gettoz(string)
  {
    if(string==null)
    {
      return "-";
    }
    else
    {
      return string;
    }
  }



  getdet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detuser?token='+token+'&id='+widget.data.id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      if(responseBody['assignment'].toList().length > 0)
      {
        setState(() {
            first_name = responseBody['assignment'][0]['totalpayrate'];
            last_name = responseBody['assignment'][0]['totalpayrate'];
            registeras = responseBody['assignment'][0]['totalpayrate'];
            pic =responseBody['assignment'][0]['totalpayrate'];
            email = responseBody['assignment'][0]['totalpayrate'];
            mobile = responseBody['assignment'][0]['totalpayrate'];
            kvk = responseBody['assignment'][0]['totalpayrate'];
            adress = responseBody['assignment'][0]['totalpayrate'];
            homenumber = responseBody['assignment'][0]['totalpayrate'];
            postalcode = responseBody['assignment'][0]['totalpayrate'];
            city = responseBody['assignment'][0]['totalpayrate'];
            birthdate = responseBody['assignment'][0]['totalpayrate'];
            gender = responseBody['assignment'][0]['totalpayrate'];
            educationtitle = responseBody['assignment'][0]['totalpayrate'];
            companyname = responseBody['assignment'][0]['totalpayrate'];
            ibannumber = responseBody['assignment'][0]['totalpayrate'];
            ibanholder = responseBody['assignment'][0]['totalpayrate'];
            btwnumber = responseBody['assignment'][0]['totalpayrate'];
            addressextra = responseBody['assignment'][0]['totalpayrate'];
            state = responseBody['assignment'][0]['totalpayrate'];
            country = responseBody['assignment'][0]['totalpayrate'];
            joinedat = responseBody['assignment'][0]['totalpayrate'];
            role = responseBody['assignment'][0]['totalpayrate'];
        });
      }

    }

  }


}
