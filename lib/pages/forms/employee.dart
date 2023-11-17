//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mijnzpc/pages/confirmtrgister.dart';
import 'package:mijnzpc/pages/forms/addressforemployee.dart';
import 'package:mijnzpc/pages/login_screen.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:validators/validators.dart';
import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/all_translations.dart';
class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}
class Employee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EmployeeState();
}
enum Fruit { MALE, FEMALE }
class EmployeeState extends State<Employee> with SingleTickerProviderStateMixin {


  TextEditingController textFieldControlleraddress = new TextEditingController();
  TextEditingController textFieldControllerhomenumber = new TextEditingController();
  TextEditingController textFieldControllerexteraaddress = new TextEditingController();
  TextEditingController textFieldControllerpostalcode = new TextEditingController();
  TextEditingController textFieldControllercity = new TextEditingController();
  TextEditingController textFieldControllerstate = new TextEditingController();
  TextEditingController textFieldControllercountry = new TextEditingController();

  static List<Animal> _animals = [
    Animal(id: 1, name: allTranslations.text("healthcare")),
    Animal(id: 2, name: allTranslations.text("healthcare security")),
  ];

  static List<Animal> _animals2 = [
    Animal(id: 1, name: "MBO1"),
    Animal(id: 2, name: "MBO2"),
    Animal(id: 3, name: "MBO3"),
    Animal(id: 4, name: "MBO4"),
    Animal(id: 5, name: "SPV"),
    Animal(id: 6, name: "Doktersassistente 4"),
    Animal(id: 7, name: "ANIOS"),
    Animal(id: 8, name: "SPW 4"),
    Animal(id: 9, name: "MW 4"),
    Animal(id: 10, name: "Agoog 4"),
    Animal(id: 11, name: "VPK 4"),
    Animal(id: 12, name: "IG 3"),
    Animal(id: 13, name: "SMD 4"),
    Animal(id: 14, name: "MWD 5"),
    Animal(id: 15, name: "MZ 4"),
    Animal(id: 16, name: "PB 4"),
    Animal(id: 17, name: "Psycholoog"),
    Animal(id: 18, name: "VPK Interselection"),
    Animal(id: 19, name: "SW 5"),
    Animal(id: 20, name: "IG"),

  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();

  final _items2 = _animals2
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  AnimationController _loginButtonController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String first_name="";
  String last_name="";
  String date_of_birth="";
  String phone="";
  String mobile="";
  String company_name="";
  String kvk_number;
  String btw_number;
  String iban_number;
  String iban_holder;
  String address;
  String home_number;
  String address_extra="";
  String postcode;
  String city;
  String state;
  String country;
  String email;
  String password;
  String addressvalue="";
  String addressid="";

  TextEditingController birthdate = TextEditingController();
  String registeras1;
  String registeras2;
  String edu1;
  String edu2;
  String edu3;
  String edu4;
  String edu5;
  Fruit _fruit = Fruit.MALE;
  String gender = "MALE";


  bool checkedValue= false;

  String lat;
  String lon;
  String housenumber;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginButtonController = new AnimationController(vsync: this , duration: new Duration(milliseconds: 3000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    timeDilation = .4;
    var page = MediaQuery.of(context).size;
    return new Scaffold(


      key: _scaffoldKey,
      bottomSheet: new  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 10,
              child:

              Padding(
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
                              //make color or elevated button transparent
                            ),

                            onPressed: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginScreen()));
                            },
                            child: Padding(
                              padding:EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              child:Center(
                                child: Text(allTranslations.text('Log in') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                              ),
                            )
                        )
                    )

                ),


              ),
            ),
          ]
      ),

      body:

      Container(
        color: Color(0xfff2f2f2),

        child: Container(

          // color: Colors.amber,
          alignment: Alignment.topCenter,
          child: new SingleChildScrollView(
            child:new Column(
              children: <Widget>[

                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 13,
                        ),

                      ],
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xff425626),
                          Color(0xff89B44B),

                        ],
                      )
                  ),

                  child:

                  Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top:50,left: 12,right: 12,bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                            Text(allTranslations.text("Create your account"),style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Colors.white,
                                fontSize: 20
                            ),),),
                        ),


                        Padding(
                          padding: EdgeInsets.only(top:5,left: 12,right: 12,bottom: 25),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                            Text(allTranslations.text("Fill in the needed information to rgister your account"),style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Colors.white,
                                fontSize: 11
                            ),),),
                        ),







                      ]),




                ),










                Container(

                  child:new Column(
                    children: <Widget>[


                      Padding(
                        padding: EdgeInsets.only(top:10.0,left: 15,right: 15),
                        child:

                        TextFormField(
                          onChanged: (text){first_name=text;},
                          decoration: InputDecoration(
                            hintText: allTranslations.text("First Name"),
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.person,color: Colors.grey,),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white, //<-- SEE HERE
                          ),
                          textAlign: TextAlign.left,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return allTranslations.text('Please Fill Out This Field');
                            }
                            return null;
                          },
                        ),






                      ),




                      Padding(
                        padding: EdgeInsets.only(top:10,left: 15,right: 15),
                        child:  new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[


                                  TextFormField(
                                    onChanged: (text){last_name=text;},
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline,color: Colors.grey,),
                                      hintText: allTranslations.text("Last name"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      child:Text("")
                                  ),

                                  TextField(
                                    controller: birthdate, //editing controller of this TextField
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_today,color: Colors.grey,),
                                      hintText: allTranslations.text("Birth Date"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    readOnly: true,  //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      selectDate(context,19);
                                    },
                                  ),
                                  MultiSelectDialogField(
                                    items: _items,
                                    title: Text(allTranslations.text("RegisterAs")),
                                    selectedColor: Colors.grey[700],
                                    buttonText: Text(
                                      allTranslations.text("RegisterAs"),
                                    ),
                                    confirmText: Text(
                                      allTranslations.text("ok"),
                                    ),
                                    cancelText: Text(
                                      allTranslations.text("Cancel"),
                                    ),
                                    onConfirm: (results) {
                                      _selectedAnimals = results;
                                      if(_selectedAnimals.length==0)
                                      {
                                        registeras1="";
                                        registeras2="";
                                      }
                                      if(_selectedAnimals.length==1)
                                      {
                                        registeras1=_selectedAnimals[0].name;
                                        registeras2="";
                                      }
                                      if(_selectedAnimals.length==2)
                                      {
                                        registeras1=_selectedAnimals[0].name;
                                        registeras2=_selectedAnimals[1].name;
                                      }
                                    },
                                  ),
                                  MultiSelectDialogField(
                                    items: _items2,
                                    selectedColor: Colors.grey[700],
                                    title: Text(allTranslations.text("Education title")),
                                    confirmText: Text(
                                      allTranslations.text("ok"),
                                    ),
                                    cancelText: Text(
                                      allTranslations.text("Cancel"),
                                    ),
                                    buttonText: Text(
                                      allTranslations.text("Education title"),
                                    ),

                                    onConfirm: (results) {
                                      _selectedAnimals2 = results;
                                      if(_selectedAnimals2.length==0)
                                      {
                                        edu1="";
                                        edu2="";
                                        edu3="";
                                        edu4="";
                                        edu5="";
                                      }
                                      if(_selectedAnimals2.length==1)
                                      {
                                        edu1=_selectedAnimals2[0].name;
                                        edu2="";
                                        edu3="";
                                        edu4="";
                                        edu5="";
                                      }
                                      if(_selectedAnimals2.length==2)
                                      {
                                        edu1=_selectedAnimals2[0].name;
                                        edu2=_selectedAnimals2[1].name;
                                        edu3="";
                                        edu4="";
                                        edu5="";
                                      }
                                      if(_selectedAnimals2.length==3)
                                      {
                                        edu1=_selectedAnimals2[0].name;
                                        edu2=_selectedAnimals2[1].name;
                                        edu3=_selectedAnimals2[2].name;
                                        edu4="";
                                        edu5="";
                                      }
                                      if(_selectedAnimals2.length==4)
                                      {
                                        edu1=_selectedAnimals2[0].name;
                                        edu2=_selectedAnimals2[1].name;
                                        edu3=_selectedAnimals2[2].name;
                                        edu4=_selectedAnimals2[3].name;
                                        edu5="";
                                      }
                                      if(_selectedAnimals2.length==5)
                                      {
                                        edu1=_selectedAnimals2[0].name;
                                        edu2=_selectedAnimals2[1].name;
                                        edu3=_selectedAnimals2[2].name;
                                        edu4=_selectedAnimals2[3].name;
                                        edu5=_selectedAnimals2[4].name;
                                      }
                                    },
                                  ),



                                  Row(
                                      children: <Widget>[



                                        Expanded(
                                          flex: 12,
                                          child: Container(
                                            child: Center(
                                              child:  ListTile(
                                                title:   Text(allTranslations.text('MALE'),
                                                    style: TextStyle(fontSize: 13)),
                                                leading: Radio<Fruit>(
                                                  fillColor: MaterialStateColor.resolveWith((states) => Colors.grey[700]),
                                                  value: Fruit.MALE,
                                                  groupValue: _fruit,
                                                  onChanged: (Fruit value) {
                                                    setState(() {
                                                      _fruit = value;
                                                      gender="MALE";
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 15,
                                          child: Container(
                                            child: Center(
                                              child:    ListTile(
                                                title:   Text(allTranslations.text('FEMALE'),
                                                    style: TextStyle(fontSize: 13)),
                                                leading: Radio<Fruit>(
                                                  fillColor: MaterialStateColor.resolveWith((states) => Colors.grey[700]),
                                                  value: Fruit.FEMALE,
                                                  groupValue: _fruit,
                                                  onChanged: (Fruit value) {
                                                    setState(() {
                                                      _fruit = value;
                                                      gender="FEMALE";
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            width: 200,
                                          ),
                                        ),

                                      ]
                                  ),



                                  Padding(
                                    padding: EdgeInsets.only(top:15),
                                    child:     Column(children: <Widget>[
                                      Row(children: <Widget>[
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                              child: Divider(
                                                color: Color(0xff7F8285),
                                                thickness: 2,
                                              )),
                                        ),
                                        Text(allTranslations.text("Company information")),
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                              child: Divider(
                                                color: Color(0xff7F8285),
                                                thickness: 2,
                                              )),
                                        ),
                                      ]),
                                    ]),
                                  ),
                                  SizedBox(
                                      child:Text("")
                                  ),



                                  TextFormField(
                                    onChanged: (text){company_name=text;},
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.account_balance,color: Colors.grey,),
                                      hintText: allTranslations.text("Company name"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),


                                  TextFormField(
                                    onChanged: (text){kvk_number=text;},
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                      hintText: allTranslations.text("KVK number"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      if(text .length > 8)
                                      {
                                        return 'Must Be 8';
                                      }
                                      if(text .length < 8)
                                      {
                                        return 'Must Be 8';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){btw_number=text;},
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                      hintText: allTranslations.text("btw number"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      child:Text("")
                                  ),


                                  TextFormField(
                                    onChanged: (text){iban_number=text;},
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.money,color: Colors.grey,),

                                      hintText: allTranslations.text("iban number"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){iban_holder=text;},
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.person,color: Colors.grey,),
                                      hintText: allTranslations.text("iban holder"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top:15),
                                    child:     Column(children: <Widget>[
                                      Row(children: <Widget>[
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                              child: Divider(
                                                color: Color(0xff7F8285),
                                                thickness: 2,
                                              )),
                                        ),
                                        Text(allTranslations.text("Adress information")),
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                              child: Divider(
                                                color: Color(0xff7F8285),
                                                thickness: 2,
                                              )),
                                        ),
                                      ]),
                                    ]),
                                  ),
                                  SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    controller: textFieldControlleraddress,
                                    onChanged: (text) {
                                      if(text!=addressvalue)
                                      {
                                        addressvalue=text;
                                        _awaitReturnValueFromSecondScreen(text);
                                      }
                                    },
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.assistant_navigation,color: Colors.grey,),
                                      hintText: allTranslations.text("Address"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    controller: textFieldControllerhomenumber,
                                    onChanged: (text){home_number=text;},
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.assistant_photo_outlined,color: Colors.grey,),
                                      hintText: allTranslations.text("Home Number"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){address_extra=text;},
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.assignment_turned_in,color: Colors.grey,),

                                      hintText: allTranslations.text("Address extra (optional)"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      // if (text == null || text.isEmpty) {
                                      //   return allTranslations.text('Please Fill Out This Field');
                                      // }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){postcode=text;},
                                    controller: textFieldControllerpostalcode,
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.local_post_office,color: Colors.grey,),
                                      hintText: allTranslations.text("Postal code"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){city=text;},
                                    controller: textFieldControllercity,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.location_city,color: Colors.grey,),

                                      hintText: allTranslations.text("City"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),

                                  TextFormField(
                                    onChanged: (text){country=text;},
                                    controller: textFieldControllercountry,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.location_history_outlined,color: Colors.grey,),

                                      hintText: allTranslations.text("Country"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:15),
                                    child:     Column(children: <Widget>[
                                      Row(children: <Widget>[
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                              child: Divider(
                                                color: Color(0xff7F8285),
                                                thickness: 2,
                                              )),
                                        ),
                                        Text(allTranslations.text("Contact information")),
                                        Expanded(
                                          child: new Container(
                                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                              child: Divider(
                                                color: Color(0xff7F8285),
                                                thickness: 2,
                                              )),
                                        ),
                                      ]),
                                    ]),
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),


                                  TextFormField(
                                    onChanged: (text){phone=text;},
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.perm_phone_msg_outlined,color: Colors.grey,),
                                      hintText: allTranslations.text("Phone"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){mobile=text;},
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.send_to_mobile,color: Colors.grey,),
                                      hintText: allTranslations.text("Mobile"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){email=text;},
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.alternate_email,color: Colors.grey,),

                                      hintText: allTranslations.text("E-Mail address"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      if(! isEmail(text)) {
                                        return 'Its Not Valid';
                                      }
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.alternate_email,color: Colors.grey,),
                                      hintText: allTranslations.text("Confirm E-Mail address"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      if(! isEmail(text)) {
                                        return 'Its Not Valid';
                                      }
                                      if (text != email) {
                                        return 'Emails Arent same';
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    onChanged: (text){password=text;},
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.password,color: Colors.grey,),

                                      hintText: allTranslations.text("Password"),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      if(text .length < 6)
                                      {
                                        return 'Must Be More Than 5';
                                      }
                                      return null;
                                    },
                                  ),                              SizedBox(
                                      child:Text("")
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                      hintText: allTranslations.text("Confirm Password"),
                                      hintStyle: TextStyle(color: Colors.grey),

                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.white, //<-- SEE HERE
                                    ),
                                    textAlign: TextAlign.left,
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return allTranslations.text('Please Fill Out This Field');
                                      }
                                      if (text != password) {
                                        return 'Passwords Arent same';
                                      }
                                      return null;
                                    },
                                    onChanged: (input) async {
                                      password=input;
                                    },
                                    // onSaved:(input) => _repasswordValue =  input  ,
                                  ),





                                  Row(
                                    children: <Widget>[

                                      Checkbox(
                                        value: checkedValue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            checkedValue = value;
                                          });
                                        },
                                      ),

                                      Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () async{

                                                final payUrl = 'https://mijnzpc.com/nl/legals/temrs-and-conditions?nl';
                                                print(payUrl);
                                                var urllaunchable = await canLaunch(payUrl); //canLaunch is from url_launcher package
                                                if(urllaunchable){
                                                  await launch(payUrl); //launch is from url_launcher package to launch URL
                                                }else{
                                                  print("URL can't be launched.");
                                                }

                                              },
                                              child:   Row(
                                                  children: <Widget>[
                                                    new Text(allTranslations.text("         I agree to "),textAlign: TextAlign.left,),
                                                    new Text(allTranslations.text("terms and conditions ,"),textAlign: TextAlign.left,style: TextStyle(
                                                      color: Colors.blue,
                                                    ),),
                                                  ]),

                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                final payUrl = 'https://mijnzpc.com/nl/legals/privacy-and-policy?nl';
                                                print(payUrl);
                                                var urllaunchable = await canLaunch(payUrl); //canLaunch is from url_launcher package
                                                if(urllaunchable){
                                                  await launch(payUrl); //launch is from url_launcher package to launch URL
                                                }else{
                                                  print("URL can't be launched.");
                                                }

                                              },
                                              child: new Text(allTranslations.text("privacy policy and cookies."),textAlign: TextAlign.left,style: TextStyle(
                                                color: Colors.blue,
                                              ),),
                                            ),

                                          ]),



                                      SizedBox(width: 2), //SizedBox
                                      /** Checkbox Widget **/
                                      //Checkbox
                                    ], //<Widget>[]
                                  ), //Row







                                ],
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ],),
                ),

                new Padding(
                  padding: EdgeInsets.only(bottom: 80,top:10),
                  child:
                  SizedBox(
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
                                //make color or elevated button transparent
                              ),

                              onPressed: (){


                                if(checkedValue==false)
                                {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: new AlertDialog(
                                              title: new Text(allTranslations.text('Hoppla')),
                                              content: new Text(allTranslations.text("please confirm terms and conditions")),
                                              actions: <Widget>[

                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        );
                                      }
                                  ) ?? false;
                                }


                                if(registeras1==null)
                                {
                                  if(registeras2==null)
                                  {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return new Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: new AlertDialog(
                                                title: new Text(allTranslations.text('Hoppla')),
                                                content: new Text(allTranslations.text("please select registeras")),
                                                actions: <Widget>[

                                                  new FlatButton(
                                                      onPressed: () {
                                                        // exit(0);
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                          fontWeight: FontWeight.bold, color: Colors.red),)
                                                  ),
                                                ],
                                              )
                                          );
                                        }
                                    ) ?? false;
                                  }

                                }

                                if(edu1==null)
                                {
                                  if(edu2==null)
                                  {
                                    if(edu3==null)
                                    {
                                      if(edu4==null)
                                      {
                                        if(edu5==null)
                                        {
                                          return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return new Directionality(
                                                    textDirection: TextDirection.ltr,
                                                    child: new AlertDialog(
                                                      title: new Text(allTranslations.text('Hoppla')),
                                                      content: new Text(allTranslations.text("please select education title")),
                                                      actions: <Widget>[

                                                        new FlatButton(
                                                            onPressed: () {
                                                              // exit(0);
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                                fontWeight: FontWeight.bold, color: Colors.red),)
                                                        ),
                                                      ],
                                                    )
                                                );
                                              }
                                          ) ?? false;
                                        }
                                      }
                                    }
                                  }
                                }
                                if (_formKey.currentState.validate()) {
                                  print(registeras1);

                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(

                                            child: new Directionality(
                                                textDirection: TextDirection.ltr,
                                                child: new AlertDialog(
                                                  title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                  content: new Text(allTranslations.text('You are about to register a account. Proceed?'),style: TextStyle(color: Colors.grey)),
                                                  actions: <Widget>[
                                                    new FlatButton(
                                                        onPressed: () => Navigator.of(context).pop(false),
                                                        child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                                    ),
                                                    new FlatButton(
                                                        onPressed: () {
                                                          sendDataForRegister();
                                                          Navigator.pop(context);
                                                        },
                                                        child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                                    ),
                                                  ],
                                                )
                                            )
                                        );
                                      }
                                  ) ?? false;







                                }

                              },
                              child: Padding(
                                padding:EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child:Center(
                                  child: Text(allTranslations.text('Submit') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                ),
                              )
                          )
                      )

                  ),
                ),




              ],
            ),
          ),

        ),
      ),



    );
  }



  void _awaitReturnValueFromSecondScreen(String text) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Addressforemployee(text)));
    print(result);
    setState(() {
      if(result!=null)
      {
        addressid = result['addressid'];
        housenumber = result['housenumber'];

      }
    });
    getplaceid(addressid);
  }



  getplaceid(String placeid) async{
    String url ='https://mijnzpc.com/api/v1/getaddress?ttt='+placeid+'&lat='+lat.toString()+'&lon='+lon.toString();
    print(url);
    final response = await  http.get(Uri.parse(url));
    var responseBody = json.decode(response.body);

    setState(() {
      address=responseBody['features'][0]['properties']['street'];
      postcode=responseBody['features'][0]['properties']['postcode'];
      country=responseBody['features'][0]['properties']['country'];
      city=responseBody['features'][0]['properties']['city'];
      state=responseBody['features'][0]['properties']['state'];
      home_number=responseBody['features'][0]['properties']['housenumber'];
      home_number=housenumber;
    });


    textFieldControlleraddress.text=responseBody['features'][0]['properties']['street'];
    textFieldControllerpostalcode.text=responseBody['features'][0]['properties']['postcode'];
    textFieldControllercountry.text=responseBody['features'][0]['properties']['country'];
    textFieldControllercity.text=responseBody['features'][0]['properties']['city'];
    textFieldControllerstate.text=responseBody['features'][0]['properties']['state'];
    textFieldControllerhomenumber.text=housenumber;
  }

  checknull(String text){
    return text != null ? text : "-";
  }

  sendDataForRegister() async {

    Map response = await (new AuthService()).sendDataToRegisteremployee({
      "registeras1" : registeras1,
      "registeras2" : registeras2,
      "edu1" : edu1,
      "edu2" : edu2,
      "edu3" : edu3,
      "edu4" : edu4,
      "edu5" : edu5,
      "first_name" : checknull(first_name),
      "last_name" : checknull(last_name),
      "date_of_birth" : checknull(birthdate.text),
      "gender":gender,
      "phone" : checknull(phone),
      "mobile" : checknull(mobile),
      "company_name" : checknull(company_name),
      "kvk_number" : checknull(kvk_number),
      "btw_number" : checknull(btw_number),
      "iban_number" : checknull(iban_number),
      "iban_holder" : checknull(iban_holder),
      "address" : checknull(address),
      "home_number" : checknull(home_number),
      "address_extra" : checknull(address_extra),
      "postcode" : checknull(postcode),
      "city" : checknull(city),
      "state" : checknull(state),
      "country" : checknull(country),
      "email" : checknull(email),
      "password" : checknull(password),
      "user_type" : "EMPLOYEE",
    });


    if(response['data']['err']=='-1' || response['data']['err']==-1)//has error
        {
      return showDialog(
          context: context,
          builder: (context) {
            return new Directionality(
                textDirection: TextDirection.ltr,
                child: new AlertDialog(
                  title: new Text(allTranslations.text('Hoppla')),
                  content: new Text(allTranslations.text(response['data']['msg'].toString())),
                  actions: <Widget>[

                    new FlatButton(
                        onPressed: () {
                          // exit(0);
                          Navigator.of(context).pop();
                        },
                        child: new Text(allTranslations.text('Ok'), style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),)
                    ),
                  ],
                )
            );
          }
      ) ?? false;
    }
    else
    {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new Confirmverify())

      );

    }






  }


  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.grey,
          width: 1,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.grey,
          width: 1,
        )
    );
  }

  Future<Null> selectDate(BuildContext context,int variable) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly, // <- this
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {



        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff89B44B), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.grey[700], // body text color
            ),

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.grey, // button text color
              ),
            ),
          ),
          child: child,
        );

      },
    );



    setState(() {
      birthdate.text  = "${picked.year}-${picked.month}-${picked.day}";
    });









  }


}


