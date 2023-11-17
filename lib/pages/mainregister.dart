//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/animations/singin_animation.dart';
import 'package:mijnzpc/components/Form.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mijnzpc/pages/forgetpassword.dart';
import 'package:mijnzpc/pages/forms/client.dart';
import 'package:mijnzpc/pages/forms/employee.dart';
import 'package:mijnzpc/pages/forms/financial.dart';
import 'package:mijnzpc/pages/forms/schedule.dart';
import 'package:mijnzpc/pages/login_screen.dart';
import 'package:mijnzpc/pages/mainregister.dart';
import 'package:mijnzpc/pages/resetpassword.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:mijnzpc/all_translations.dart';
class Mainregister extends StatefulWidget {

  Mainregister(
      {@required this.backgroundcolor,
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


  @override
  State<StatefulWidget> createState() => new MainregisterState();

}

class MainregisterState extends State<Mainregister> with SingleTickerProviderStateMixin {
  AnimationController _loginButtonController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _emailValue;
  String _passwordValue;

  emailOnSaved(String value) {
    _emailValue = value;
  }

  passwordOnSaved(String value) {
    _passwordValue = value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setcolor();
    _loginButtonController = new AnimationController(vsync: this , duration: new Duration(milliseconds: 3000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonController.dispose();
    super.dispose();
  }
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    timeDilation = .4;
    var page = MediaQuery.of(context).size;

    return Scaffold(


      bottomSheet: new  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[






            Expanded(
              flex: 10,
              child:  Padding(
                padding: EdgeInsets.only(top:6,left: 0,right: 0,bottom: 6),
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
                                child: Text(allTranslations.text('Login') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
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
            child:
            new SingleChildScrollView(

              child: Form(
                key: _formKey,
                child:
                new Column(
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
                                  Text(allTranslations.text("Create An Account"),style: TextStyle(
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
                                  Text(allTranslations.text("Please select your jobtitle below"),style: TextStyle(
                                      // fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                      fontSize: 14
                                  ),),),
                              ),







                            ]),




                      ),



                      Container(

                        height: 70,


                        child:
                        Padding(
                          padding: EdgeInsets.only(top:30,left: 20,right: 15,bottom: 0),
                          child: Align(
                            alignment: Alignment.topLeft,

                            child: Text(allTranslations.text("Register as"),style: TextStyle(
                                // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Color(0xff89B44B),
                                fontSize: 20
                            ),),
                          ),
                        ),
                      ),




                      Padding(
                        padding: EdgeInsets.only(top:18.0,left: 0,right: 0),
                        child:   Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(0.0),
                            ),
                          ),

                          child:  new SingleChildScrollView(
                            child:new Column(
                                children: <Widget>[


                                  //freelancer
                                  new Directionality(
                                    textDirection: TextDirection.ltr,


                                    child:new Column(

                                      children: <Widget>[

                                        new GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                new MaterialPageRoute(builder: (context) => new Employee())

                                            );
                                          },
                                          child:

                                          Container(
                                            height: 100.0,
                                            child: ListView(
                                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  // height: 140.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(0.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset: Offset(0.0, 3.75),
                                                          color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                                          blurRadius: 5
                                                      )
                                                    ],
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(
                                                            10.0, 5.0, 20.0, 5.0),
                                                        child: new Container(
                                                            width: 70.0,
                                                            height: 70.0,
                                                            decoration: new BoxDecoration(
                                                                image: new DecorationImage(
                                                                  fit: BoxFit.fill,
                                                                  image: new AssetImage("assets/images/Z63_aCqA.png"),
                                                                )
                                                            )),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.only(top: 10.0, bottom: 0.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                        allTranslations.text("Freelancer") ,
                                                              style: TextStyle(
                                                                color: Color(0xff89B44B),
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 17.0,
                                                              ),
                                                            ),

                                                            Text(
                                                              " ",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 14.0,
                                                              ),
                                                            ),

                                                            Text(
                                                              allTranslations.text("click here to register"),
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 14.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              allTranslations.text("a freelancer account"),
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 14.0,
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
                                        // Divider(
                                        //     color: Colors.amberAccent[400]
                                        // ),
                                      ],

                                    ),


                                  ),
                                  //freelancer

                                  //client
                                  // new Directionality(
                                  //   textDirection: TextDirection.ltr,
                                  //
                                  //
                                  //   child:new Column(
                                  //
                                  //     children: <Widget>[
                                  //
                                  //       new GestureDetector(
                                  //         onTap: () {
                                  //           Navigator.push(context,
                                  //               new MaterialPageRoute(builder: (context) => new Client())
                                  //
                                  //           );
                                  //         },
                                  //         child:
                                  //
                                  //         Container(
                                  //           height: 100.0,
                                  //           child: ListView(
                                  //             padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  //             shrinkWrap: true,
                                  //             scrollDirection: Axis.horizontal,
                                  //             children: <Widget>[
                                  //               Container(
                                  //                 width: MediaQuery.of(context).size.width,
                                  //                 // height: 140.0,
                                  //                 decoration: BoxDecoration(
                                  //                   color: Colors.white,
                                  //                   borderRadius: BorderRadius.circular(0.0),
                                  //                   boxShadow: [
                                  //                     BoxShadow(
                                  //                         offset: Offset(0.0, 3.75),
                                  //                         color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                  //                         blurRadius: 5
                                  //                     )
                                  //                   ],
                                  //                 ),
                                  //                 child: Row(
                                  //                   children: <Widget>[
                                  //                     Container(
                                  //                       padding: EdgeInsets.fromLTRB(
                                  //                           10.0, 5.0, 20.0, 5.0),
                                  //                       child: new Container(
                                  //                           width: 70.0,
                                  //                           height: 70.0,
                                  //                           decoration: new BoxDecoration(
                                  //                               image: new DecorationImage(
                                  //                                 fit: BoxFit.fill,
                                  //                                 image: new AssetImage("assets/images/-zVoIZyc.png"),
                                  //                               )
                                  //                           )),
                                  //                     ),
                                  //                     Container(
                                  //                       padding:
                                  //                       EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  //                       child: Column(
                                  //                         crossAxisAlignment:
                                  //                         CrossAxisAlignment.start,
                                  //                         children: <Widget>[
                                  //                           Text(
                                  //                             "Client" ,
                                  //                             style: TextStyle(
                                  //                               color: Color(0xff89B44B),
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 17.0,
                                  //                             ),
                                  //                           ),
                                  //
                                  //                           Text(
                                  //                             " ",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //
                                  //                           Text(
                                  //                             "click here to register ",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //                           Text(
                                  //                             "a client account",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //       ),
                                  //       // Divider(
                                  //       //     color: Colors.amberAccent[400]
                                  //       // ),
                                  //     ],
                                  //
                                  //   ),
                                  //
                                  //
                                  // ),
                                  //client


                                  //schedue
                                  // new Directionality(
                                  //   textDirection: TextDirection.ltr,
                                  //
                                  //
                                  //   child:new Column(
                                  //
                                  //     children: <Widget>[
                                  //
                                  //       new GestureDetector(
                                  //         onTap: () {
                                  //           Navigator.push(context,
                                  //               new MaterialPageRoute(builder: (context) => new Schedule())
                                  //
                                  //           );
                                  //         },
                                  //         child:
                                  //
                                  //         Container(
                                  //           height: 100.0,
                                  //           child: ListView(
                                  //             padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  //             shrinkWrap: true,
                                  //             scrollDirection: Axis.horizontal,
                                  //             children: <Widget>[
                                  //               Container(
                                  //                 width: MediaQuery.of(context).size.width,
                                  //                 // height: 140.0,
                                  //                 decoration: BoxDecoration(
                                  //                   color: Colors.white,
                                  //                   borderRadius: BorderRadius.circular(0.0),
                                  //                   boxShadow: [
                                  //                     BoxShadow(
                                  //                         offset: Offset(0.0, 3.75),
                                  //                         color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                  //                         blurRadius: 5
                                  //                     )
                                  //                   ],
                                  //                 ),
                                  //                 child: Row(
                                  //                   children: <Widget>[
                                  //                     Container(
                                  //                       padding: EdgeInsets.fromLTRB(
                                  //                           10.0, 5.0, 20.0, 5.0),
                                  //                       child: new Container(
                                  //                           width: 70.0,
                                  //                           height: 70.0,
                                  //                           decoration: new BoxDecoration(
                                  //                               image: new DecorationImage(
                                  //                                 fit: BoxFit.fill,
                                  //                                 image: new AssetImage("assets/images/BFOPtlek.png"),
                                  //                               )
                                  //                           )),
                                  //                     ),
                                  //                     Container(
                                  //                       padding:
                                  //                       EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  //                       child: Column(
                                  //                         crossAxisAlignment:
                                  //                         CrossAxisAlignment.start,
                                  //                         children: <Widget>[
                                  //                           Text(
                                  //                             "Schedule department" ,
                                  //                             style: TextStyle(
                                  //                               color: Color(0xff89B44B),
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 17.0,
                                  //                             ),
                                  //                           ),
                                  //
                                  //                           Text(
                                  //                             " ",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //
                                  //                           Text(
                                  //                             "click here to register ",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //                           Text(
                                  //                             "a client account",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //       ),
                                  //       // Divider(
                                  //       //     color: Colors.amberAccent[400]
                                  //       // ),
                                  //     ],
                                  //
                                  //   ),
                                  //
                                  //
                                  // ),
                                  //schedue


                                  //financial
                                  // new Directionality(
                                  //   textDirection: TextDirection.ltr,
                                  //
                                  //
                                  //   child:new Column(
                                  //
                                  //     children: <Widget>[
                                  //
                                  //       new GestureDetector(
                                  //         onTap: () {
                                  //           Navigator.push(context,
                                  //               new MaterialPageRoute(builder: (context) => new Financial())
                                  //
                                  //           );
                                  //         },
                                  //         child:
                                  //
                                  //         Container(
                                  //           height: 100.0,
                                  //           child: ListView(
                                  //             padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  //             shrinkWrap: true,
                                  //             scrollDirection: Axis.horizontal,
                                  //             children: <Widget>[
                                  //               Container(
                                  //                 width: MediaQuery.of(context).size.width,
                                  //                 // height: 140.0,
                                  //                 decoration: BoxDecoration(
                                  //                   color: Colors.white,
                                  //                   borderRadius: BorderRadius.circular(0.0),
                                  //                   boxShadow: [
                                  //                     BoxShadow(
                                  //                         offset: Offset(0.0, 3.75),
                                  //                         color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                  //                         blurRadius: 5
                                  //                     )
                                  //                   ],
                                  //                 ),
                                  //                 child: Row(
                                  //                   children: <Widget>[
                                  //                     Container(
                                  //                       padding: EdgeInsets.fromLTRB(
                                  //                           10.0, 5.0, 20.0, 5.0),
                                  //                       child: new Container(
                                  //                           width: 70.0,
                                  //                           height: 70.0,
                                  //                           decoration: new BoxDecoration(
                                  //                               image: new DecorationImage(
                                  //                                 fit: BoxFit.fill,
                                  //                                 image: new AssetImage("assets/images/pIB2U7qw.png"),
                                  //                               )
                                  //                           )),
                                  //                     ),
                                  //                     Container(
                                  //                       padding:
                                  //                       EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  //                       child: Column(
                                  //                         crossAxisAlignment:
                                  //                         CrossAxisAlignment.start,
                                  //                         children: <Widget>[
                                  //                           Text(
                                  //                             "Financial department" ,
                                  //                             style: TextStyle(
                                  //                               color: Color(0xff89B44B),
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 17.0,
                                  //                             ),
                                  //                           ),
                                  //
                                  //                           Text(
                                  //                             " ",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //
                                  //                           Text(
                                  //                             "click here to register ",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //                           Text(
                                  //                             "a client account",
                                  //                             style: TextStyle(
                                  //                               color: Colors.black,
                                  //                               fontWeight: FontWeight.w400,
                                  //                               fontSize: 14.0,
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //       ),
                                  //       // Divider(
                                  //       //     color: Colors.amberAccent[400]
                                  //       // ),
                                  //     ],
                                  //
                                  //   ),
                                  //
                                  //
                                  // ),
                                  //financial




                                ]),
                          ),
                        ),
                      ),







                    ]
                ),
              ),

            )






        ),
      ),










    );
  }
  navigationToVerify() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int verify = prefs.getInt('user.verify');

    final response = await  http.get(Uri.parse('http://immer-kauf.de/api/v1/sendcode?token=' + verify.toString()));

    Navigator.of(context).pushReplacementNamed('/verify');
  }
  sendDataForLogin() async {

    Map response = await (new AuthService()).sendDataToLogin({ "email" : _emailValue  , "password" : _passwordValue });

    if( response['status'] == 'success' ) {
      await storeUserData(response['data']);


      // if(response['data']['verify']==0)
      //   {
      //     navigationToVerify();
      //   }
      // else
      //   {
      Navigator.pushReplacementNamed(context, "/home");
      //}



    } else {
      await _loginButtonController.reverse();

      return showDialog(
          context: context,
          builder: (context) {
            return new Directionality(
                textDirection: TextDirection.ltr,
                child: new AlertDialog(
                  title: new Text(allTranslations.text('Alert')),
                  content: new Text(allTranslations.text(response['data']['msg'])),
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

  setcolor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user.color', '0xff89B44B');
  }




  storeUserData(Map userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user.api_token', userData['token']);
    await prefs.setString('user.first_name', userData['first_name']+" "+userData['last_name']);
    await prefs.setString('user.pic', userData['pic']);
    await prefs.setString('user.email', userData['email']);
    await prefs.setString('user.type', userData['user_type']);
    await prefs.setString('user.caninsertassignment', userData['caninsertassignment']);
    await prefs.setInt('user.id', userData['user_id']);
    await prefs.setInt('user.is_activated', userData['is_activated']);
    await prefs.setString('user.email_verified', userData['email_verified']);
    await prefs.setString('user.color', '1');
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