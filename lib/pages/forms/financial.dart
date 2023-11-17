//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mijnzpc/pages/confirmtrgister.dart';
import 'package:mijnzpc/pages/forms/addressforemployee.dart';
import 'package:mijnzpc/pages/login_screen.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:http/http.dart' as http;
// import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:validators/validators.dart';
import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}
class Financial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FinancialState();
}
enum Fruit { MALE, FEMALE }
class FinancialState extends State<Financial> with SingleTickerProviderStateMixin {


  TextEditingController textFieldControlleraddress = new TextEditingController();
  TextEditingController textFieldControllerhomenumber = new TextEditingController();
  TextEditingController textFieldControllerexteraaddress = new TextEditingController();
  TextEditingController textFieldControllerpostalcode = new TextEditingController();
  TextEditingController textFieldControllercity = new TextEditingController();
  TextEditingController textFieldControllerstate = new TextEditingController();
  TextEditingController textFieldControllercountry = new TextEditingController();

  static List<Animal> _animals = [
    Animal(id: 1, name: "healthcare"),
    Animal(id: 2, name: "healthcare security"),
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
  // final _items = _animals
  //     .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
  //     .toList();
  //
  // final _items2 = _animals2
  //     .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
  //     .toList();
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
  String birthdate;
  String registeras1;
  String registeras2;
  String edu1;
  String edu2;
  String edu3;
  String edu4;
  String edu5;
  Fruit _fruit = Fruit.MALE;
  String gender = "MALE"; bool checkedValue= false;

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
      bottomSheet: new  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 10,
              child:  Padding(
                padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                child:  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
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
                                child: Text('Log in' ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                              ),
                            )
                        )
                    )

                ),


              ),
            ),
          ]
      ),
      key: _scaffoldKey,
      // resizeToAvoidBottomPadding: false,
      body:

      Container(


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
                              Text("Create your account",style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                  color: Colors.white,
                                  fontSize: 25
                              ),),),
                          ),


                          Padding(
                            padding: EdgeInsets.only(top:5,left: 12,right: 12,bottom: 25),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                              Text("Fill in the needed information to rgister your account",style: TextStyle(
                                  fontWeight: FontWeight.w700,
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
                          padding: EdgeInsets.only(top:11.0,left: 12,right: 12),
                          child:

                          TextFormField(
                            onChanged: (text){first_name=text;},
                            decoration: InputDecoration(
                              hintText: "Firs Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.people,color: Colors.grey,),
                              border: myinputborder(),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder(),
                              filled: true, //<-- SEE HERE
                              fillColor: Colors.white, //<-- SEE HERE
                            ),
                            textAlign: TextAlign.left,

                          ),






                        ),



                        Padding(
                          padding: EdgeInsets.only(top:0,left: 15,right: 15),
                          child:  new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[

                                    SizedBox(
                                        child:Text("")
                                    ),
                                    TextFormField(
                                      onChanged: (text){last_name=text;},
                                      decoration: InputDecoration(

                                        hintText: "Last name",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                        filled: true, //<-- SEE HERE
                                        fillColor: Colors.white, //<-- SEE HERE
                                      ),
                                      textAlign: TextAlign.left,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
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
                                          Text("Company information"),
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

                                        hintText: "Company name",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                        filled: true, //<-- SEE HERE
                                        fillColor: Colors.white, //<-- SEE HERE
                                      ),
                                      textAlign: TextAlign.left,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
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
                                          Text("Contact information"),
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
                                      onChanged: (text){phone=text;},
                                      decoration: InputDecoration(

                                        hintText: "Phone",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                        filled: true, //<-- SEE HERE
                                        fillColor: Colors.white, //<-- SEE HERE
                                      ),
                                      textAlign: TextAlign.left,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
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

                                        hintText: "E-Mail address",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                        filled: true, //<-- SEE HERE
                                        fillColor: Colors.white, //<-- SEE HERE
                                      ),
                                      textAlign: TextAlign.left,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
                                        }
                                        if(! isEmail(text)) {
                                          return 'Its Not Valid';
                                        }
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
                                        }
                                        return null;
                                      },
                                    ),SizedBox(
                                        child:Text("")
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(

                                        hintText: "Confirm E-Mail address ",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                        filled: true, //<-- SEE HERE
                                        fillColor: Colors.white, //<-- SEE HERE
                                      ),
                                      textAlign: TextAlign.left,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
                                        }
                                        if(! isEmail(text)) {
                                          return 'Its Not Valid';
                                        }
                                        if (text != email) {
                                          return 'Emails Arent same';
                                        }
                                        return null;
                                      },
                                    ),SizedBox(
                                        child:Text("")
                                    ),
                                    TextFormField(
                                      onChanged: (text){password=text;},
                                      decoration: InputDecoration(

                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                        filled: true, //<-- SEE HERE
                                        fillColor: Colors.white, //<-- SEE HERE
                                      ),
                                      textAlign: TextAlign.left,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
                                        }
                                        if(text .length < 6)
                                        {
                                          return 'Must Be More Than 5';
                                        }
                                        return null;
                                      },
                                    ),SizedBox(
                                        child:Text("")
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(

                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                        filled: true, //<-- SEE HERE
                                        fillColor: Colors.white, //<-- SEE HERE
                                      ),
                                      textAlign: TextAlign.left,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Please Fill Out This Field';
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

                                        SizedBox(
                                          width: 2,
                                        ), //SizedBox
                                        Text(
                                          'I agree to terms and conditions , privacy policy and cookies.',
                                          style: TextStyle(fontSize: 11.0),
                                        ), //Text
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,0,0,80),
                    child:
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
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
                                  if (_formKey.currentState.validate()) {
                                    print(registeras1);
                                    sendDataForRegister();
                                  }
                                },
                                child: Padding(
                                  padding:EdgeInsets.only(
                                    top: 18,
                                    bottom: 18,
                                  ),
                                  child:Center(
                                    child: Text('Submit' ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
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
    setState(() {
      if(result!=null)
      {
        addressid = result;
      }
    });
    getplaceid(addressid);
  }



  getplaceid(String placeid) async{
    String url ='https://mijnzpc.com/api/v1/assignmentfilterclient?ttt='+placeid;
    final response = await  http.get(Uri.parse(url));
    var responseBody = json.decode(response.body);

    setState(() {
      address=responseBody['features'][0]['properties']['address_line1'];
      postcode=responseBody['features'][0]['properties']['postcode'];
      country=responseBody['features'][0]['properties']['country'];
      city=responseBody['features'][0]['properties']['city'];
      state=responseBody['features'][0]['properties']['state'];
      home_number=responseBody['features'][0]['properties']['housenumber'];
    });


    textFieldControlleraddress.text=responseBody['features'][0]['properties']['address_line1'];
    textFieldControllerpostalcode.text=responseBody['features'][0]['properties']['postcode'];
    textFieldControllercountry.text=responseBody['features'][0]['properties']['country'];
    textFieldControllercity.text=responseBody['features'][0]['properties']['city'];
    textFieldControllerstate.text=responseBody['features'][0]['properties']['state'];
    textFieldControllerhomenumber.text=responseBody['features'][0]['properties']['housenumber'];
  }

  checknull(String text){
    return text != null ? text : "-";
  }

  sendDataForRegister() async {

    Map response = await (new AuthService()).sendDataToRegisterclient({

      "first_name" : checknull(first_name),
      "last_name" : checknull(last_name),
      "phone" : checknull(phone),
      "mobile" : checknull(mobile),
      "client_company_name" : checknull(company_name),
      "email" : checknull(email),
      "password" : checknull(password),
      "user_type" : "FINANCIAL",
    });


    if(response['data']['err']=='-1' || response['data']['err']==-1)//has error
        {
      return showDialog(
          context: context,
          builder: (context) {
            return new Directionality(
                textDirection: TextDirection.ltr,
                child: new AlertDialog(
                  title: new Text('Hoppla'),
                  content: new Text(response['data']['msg'].toString()),
                  actions: <Widget>[

                    new FlatButton(
                        onPressed: () {
                          // exit(0);
                          Navigator.of(context).pop();
                        },
                        child: new Text('Ok', style: TextStyle(
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

}


