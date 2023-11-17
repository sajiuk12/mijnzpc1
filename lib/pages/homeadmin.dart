//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/dashboard/invoices/managedocumentsbyhome.dart';
import 'package:mijnzpc/pages/select_language_secreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/admin/freelancer.dart';
import 'package:mijnzpc/pages/calendermonth.dart';
import 'package:mijnzpc/pages/createassignmentadmin.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/pages/dashboard/assignments/fullassignment.dart';
import 'package:mijnzpc/pages/dashboard/assignments/homecartassignment.dart';
import 'package:mijnzpc/pages/dashboard/invoices/homecartinvoice.dart';
import 'package:mijnzpc/pages/dashboard/invoices/managedocuments.dart';
import 'package:mijnzpc/pages/dashboard/invoices/uploaddocuments.dart';
import 'package:mijnzpc/pages/dashboard/openassignments/detassignment.dart';
import 'package:mijnzpc/pages/dashboard/openassignments/openassignment.dart';
import 'package:mijnzpc/pages/dashboard/times/homecarttimes.dart';
import 'package:mijnzpc/pages/notifications.dart';
import 'package:mijnzpc/services/assignmentservices.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:mijnzpc/pages/admin/admins.dart';
import 'package:mijnzpc/pages/admin/agreements.dart';
import 'package:mijnzpc/pages/admin/clients.dart';
import 'package:mijnzpc/pages/admin/departments.dart';
import 'package:mijnzpc/pages/admin/financialdepartments.dart';
import 'package:mijnzpc/pages/admin/scheduledepartments.dart';
import 'package:mijnzpc/all_translations.dart';

import 'package:mijnzpc/pages/profile.dart';
import 'package:mijnzpc/pages/profileadmin.dart';
import 'package:mijnzpc/pages/selectcolor.dart';
import 'package:mijnzpc/pages/setting_screen.dart';

import 'package:flutter/gestures.dart';
import 'package:mijnzpc/all_translations.dart';
class Homeadmin extends StatefulWidget {

  Homeadmin(
      {@required this.gradiantcolor,this.backgroundcolor,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,this.allassignments
      });

  Color backgroundcolor;
  Color color;
  Color gradiantcolor;
  Color bottomcolor;
  Color cardcolor;
  Color shadowcolor;
  Color appbarcolor;
  Color titlecolor;
  Color textcolor;
  Color bottombarcolor;
  List<Massignment> allassignments;

  @override
  _HomeadminState createState() => _HomeadminState();
  final GlobalKey _scaffoldKey = new GlobalKey();
}

class _HomeadminState extends State<Homeadmin> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String searchmsg="Searching";
  String searchmsg1="Searching";

  String notifcount='0';
  bool     notifcountshow = false;


  bool     darkmode = true;
  int clientid=-1;
  String clientname="All";

  int departmentid=-1;
  String departmentname="All";

  int employeeid=-1;
  String employeename="All";

  int jobtitleid=-1;
  String jobtitlename="All";

  int yearid=-1;
  String yearname="All";

  int monthid=-1;
  String monthname="All";

  int sortid=-1;
  String sortname="All";

  int startdateid=-1;
  String startdatename="All";

  int statusid=-1;
  String statusname="All";

  String name = '';
  String credit = '';
  String pic = 'https://mijnzpc.com/deeee.jpg';



  String countsenttimes = '';
  String countallsenttimes = '';


  bool   admincheck = false;
  bool   freelancercheck = false;

  bool caninsert = false;
  bool showdoc = false;


//employee
  String countassignment='0';//done
  String counttimes='0';
  String countcansendinvoice='0';
//employee

//both
  String countopenassignment='0';//done
//both


//admin
  String numberoffreelancers='0';//done
  String numberofhours='0';//done
  String countprogresstimes='0';
//admin





  @override
  void initState() {
    checkdarkmode();
    _name();
    super.initState();
    checkshowstatus();
    _getrecords();
    _getrecords1();
    _name();
    gettotalearningss();
    checkfreelancer();
    checkadmin();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        key: _scaffoldKey,
        drawer:Container(
          decoration:   BoxDecoration(
            color:widget.backgroundcolor,
          ),
          child:


          new Drawer(
            child: Stack(
              children: [

                Container(
                  decoration:   BoxDecoration(
                    color:widget.backgroundcolor,
                  ),
                  child:
                  new ListView(
                    children: <Widget>[
                      new Container(
                        height: 90.0,
                        child: new DrawerHeader(
                            padding: EdgeInsets.fromLTRB(0,0, 0,0),
                            child: new Container(
                              decoration: new BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      widget.gradiantcolor,
                                      widget.color,
                                      //add more colors
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.0, 3.75),
                                      color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                      blurRadius: 5
                                  )
                                ],
                              ),
                              child: new Stack(
                                children: <Widget>[


                                  GestureDetector(
                                    onTap: () async {

                                      SharedPreferences prefs = await SharedPreferences.getInstance();

                                      String type = prefs.getString('user.type');
                                      if(type=='EMPLOYEE'){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Profile(
                                            backgroundcolor: widget.backgroundcolor,
                                            color: widget.color,
                                            gradiantcolor:widget.gradiantcolor,
                                            cardcolor:widget.cardcolor,
                                            shadowcolor:widget.shadowcolor,
                                            appbarcolor: widget.appbarcolor,
                                            titlecolor:widget.titlecolor,
                                            bottombarcolor:widget.bottombarcolor,
                                            textcolor:widget.textcolor,
                                          )),
                                        );
                                      }
                                      else
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Profileadmin(
                                            backgroundcolor: widget.backgroundcolor,
                                            color: widget.color,
                                            gradiantcolor:widget.gradiantcolor,
                                            cardcolor:widget.cardcolor,
                                            shadowcolor:widget.shadowcolor,
                                            appbarcolor: widget.appbarcolor,
                                            titlecolor:widget.titlecolor,
                                            textcolor:widget.textcolor,
                                            bottombarcolor:widget.bottombarcolor,
                                          )),
                                        );
                                      }
                                    }, // Image tapped
                                    child:   Padding(
                                      padding: EdgeInsets.fromLTRB(0,0,15,0),
                                      child:     new Align(
                                        alignment: Alignment.center,
                                        child: new ListTile(
                                          leading: new CircleAvatar(
                                            backgroundImage:
                                            NetworkImage(pic),
                                            backgroundColor: Colors.grey,
                                          ),
                                          title: new Text(allTranslations.text(greeting()), style: TextStyle(color: Colors.grey[300],fontSize: 12)),
                                          subtitle: Text(name, style: TextStyle(color: Colors.white,fontSize: 18)),
                                        ),
                                      ),
                                    ),
                                  ),




                                ],
                              ),
                            )
                        ),
                      ),








                      admincheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.receipt_long_sharp,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Agreements(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Agreement"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),
                      admincheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.maps_home_work,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Departments(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Departments"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),
                      admincheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.group_outlined,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Freelancers(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Freelancers"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),
                      admincheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.apartment,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Clients(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Clients"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),
                      admincheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.calendar_today,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Scheduledepartments(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Schedules"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),
                      admincheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.account_balance_outlined,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Financialdepartments(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Financials"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),
                      admincheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.manage_accounts_outlined,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Admins(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Admins"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),



                      freelancercheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.calendar_today,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Calendermonth(
                                    backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    data : widget.allassignments,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Calendar"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),
                      freelancercheck ?  Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.file_copy_outlined,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Managedocumentbyhome(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Documents"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):new Container(),

                      Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(
                                Icons.circle_notifications,color: widget.color,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifications(backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    // gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    bottombarcolor:widget.bottombarcolor,
                                    textcolor:widget.textcolor,)));
                                },
                                child: new Text(
                                  allTranslations.text("Notifications"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),




                      Divider(
                        color:Colors.grey,
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                      ),

                      // Padding(
                      //   padding: EdgeInsets.only(top:0,left: 0,right:0,bottom: 0),
                      //   child:
                      //   Row(
                      //     children: <Widget>[
                      //
                      //
                      //
                      //
                      //       Expanded(
                      //         flex: 2,
                      //         child:Icon(Icons.dark_mode_outlined,color: widget.color,),
                      //       ),
                      //       Expanded(
                      //         flex: 8,
                      //         child:InkWell(
                      //           onTap: () {
                      //
                      //           },
                      //           child: new Text(
                      //             allTranslations.text("Dark Mode"),
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(
                      //               // fontWeight: FontWeight.w700,
                      //                 color: Colors.grey,
                      //                 fontSize: 17
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //
                      //       Expanded(
                      //         flex: 2,
                      //         child: Center(
                      //           child: Switch(
                      //             value: darkmode,
                      //             inactiveThumbColor:Colors.grey[500],
                      //             inactiveTrackColor: Colors.grey[500],
                      //             activeColor: Colors.white,
                      //             activeTrackColor:  Colors.grey,
                      //             onChanged: (bool value) async {
                      //               savedarkmode(value);
                      //               darkmode = value;
                      //               if(darkmode==true)
                      //               {
                      //                 setState(()  {
                      //                   widget.backgroundcolor = Color(0xff1a1d21);
                      //                   widget.cardcolor=Color(0xff212529);
                      //                   widget.shadowcolor=Colors.black;
                      //                   widget.titlecolor=Colors.grey[700];
                      //                   widget.textcolor=Colors.grey[500];
                      //                   widget.bottombarcolor=Color(0xff1a1d21);
                      //                 });
                      //               }
                      //               else
                      //               {
                      //                 setState(() {
                      //                   widget.backgroundcolor=Colors.white.withOpacity(0.90);
                      //                   widget.cardcolor=Colors.white;
                      //                   widget.shadowcolor=Colors.black;
                      //                   widget.appbarcolor=Colors.white;
                      //                   Color titlecolor=Colors.grey[700];
                      //                   Color textcolor=Colors.grey[500];
                      //                   widget.bottombarcolor=Colors.white;
                      //                 });
                      //               }
                      //
                      //
                      //             },
                      //           ),
                      //         ),
                      //       ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //       //Checkbox
                      //     ], //<Widget>[]
                      //   ), //Row
                      //   //Row
                      // ),
                      //
                      //
                      // Padding(
                      //   padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Expanded(
                      //         flex: 1,
                      //         child:Icon(Icons.palette_outlined,color: widget.color,),
                      //       ),
                      //       Expanded(
                      //         flex: 5,
                      //         child:InkWell(
                      //           onTap: () {
                      //             Navigator.push(context, new MaterialPageRoute(builder: (context) => new Selectcolor(
                      //               backgroundcolor: widget.backgroundcolor,
                      //               color: widget.color,
                      //               gradiantcolor:widget.gradiantcolor,
                      //               cardcolor:widget.cardcolor,
                      //               shadowcolor:widget.shadowcolor,
                      //               appbarcolor: widget.appbarcolor,
                      //               titlecolor:widget.titlecolor,
                      //               textcolor:widget.textcolor,
                      //               bottombarcolor:widget.bottombarcolor,
                      //             )));
                      //           },
                      //           child: new Text(
                      //             allTranslations.text("Select Color"),
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(
                      //               // fontWeight: FontWeight.w700,
                      //                 color: Colors.grey,
                      //                 fontSize: 17
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),


                      Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom:10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.build_circle_outlined,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SelectLanguageScreen(
                                    backgroundcolor: widget.backgroundcolor,
                                    color: widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor: widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                  )));
                                },
                                child: new Text(
                                  allTranslations.text("Select language"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child:Icon(Icons.logout,color: widget.color,),
                            ),
                            Expanded(
                              flex: 5,
                              child:InkWell(
                                onTap: () {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(
                                          decoration:   BoxDecoration(
                                            color:widget.backgroundcolor,
                                          ),
                                          child: new Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: new AlertDialog(
                                                backgroundColor: widget.bottombarcolor,
                                                title: new Text(allTranslations.text('Are you sure you want to leave?'),style: TextStyle(color: Colors.grey)),
                                                content: new Text(allTranslations.text('Selecting the Yes option will exit the application'),style: TextStyle(color: Colors.grey)),
                                                actions: <Widget>[
                                                  new FlatButton(
                                                      onPressed: () => Navigator.of(context).pop(false),
                                                      child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                                  ),
                                                  new FlatButton(
                                                      onPressed: () async{
                                                        // Navigator.pop(context);
                                                        // Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                        await prefs.remove('user.api_token');

                                                        Navigator.of(context).pushReplacementNamed('/login');
                                                      },
                                                      child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                                  ),
                                                ],
                                              )
                                          ),
                                        );
                                      }
                                  ) ?? false;
                                },
                                child: new Text(
                                  allTranslations.text("Log out"),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),),

                freelancercheck ?   Align(
                  alignment: Alignment.bottomCenter,
                  child:  new Container(
                      color: Colors.green,
                      height: 50.0,
                      child: new Container(
                        decoration: new BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                widget.gradiantcolor,
                                widget.color,
                                //add more colors
                              ]),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 3.75),
                                color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                blurRadius: 5
                            )
                          ],
                        ),
                        child: new Stack(
                          children: <Widget>[

                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: Text(''),
                                ),

                                Expanded(
                                  flex: 8,
                                  child:    Container(
                                    margin: const EdgeInsets.only(right: 5.0,top:0),

                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        new IconButton(
                                          icon: new  Icon(Icons.email_outlined, color: Colors.white,),
                                          onPressed:()=> _launchEmailURL('support@zorgpuntconnect.nl'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 8,
                                  child:    Container(
                                    margin: const EdgeInsets.only(right: 5.0,top:0),

                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        new IconButton(
                                          icon: new Icon(Icons.settings_phone, color: Colors.white),
                                          onPressed:()=> _launchPhoneURL('0031614866447'),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),


                                Expanded(
                                  flex: 5,
                                  child: Text(''),
                                ),


                              ],
                            ),

                          ],
                        ),
                      )
                  ),

                ) :new Container(),
              ],
            ),
          ),),
        backgroundColor: widget.backgroundcolor,
        body:SingleChildScrollView(
          child: Container(


            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
                        child:


                        Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 140.0,
                          decoration: BoxDecoration(

                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  widget.gradiantcolor,
                                  widget.color,
                                  //add more colors
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


                              new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[





                                    Expanded(
                                      flex: 13,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(4,36,0,0),
                                        child: new Align(
                                          alignment: Alignment.centerLeft,
                                          child:IconButton(
                                            icon: Icon(Icons.apps,color: Colors.white),
                                            onPressed: (){
                                              _scaffoldKey.currentState.openDrawer();
                                            },
                                          ),



                                        ),
                                      ),

                                    ),


                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0,40,0,0),
                                        child: new Align(
                                            alignment: Alignment.centerRight,
                                            child:IconButton(
                                              color: Colors.blue,
                                              onPressed: () {
                                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Selectcolor(
                                                  backgroundcolor: widget.backgroundcolor,
                                                  color: widget.color,
                                                  gradiantcolor:widget.gradiantcolor,
                                                  cardcolor:widget.cardcolor,
                                                  shadowcolor:widget.shadowcolor,
                                                  appbarcolor: widget.appbarcolor,
                                                  titlecolor:widget.titlecolor,
                                                  textcolor:widget.textcolor,
                                                  bottombarcolor:widget.bottombarcolor,
                                                )));
                                              },
                                              icon: Icon(Icons.color_lens,color: Colors.white,size: 24,),
                                            )



                                        ),
                                      ),

                                    ),



                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0,40,10,0),
                                        child: new Align(
                                          alignment: Alignment.centerRight,
                                          child : IconButton(
                                            color: Colors.blue,
                                            onPressed: () async {

                                              if(darkmode==true){
                                                darkmode = false;
                                              }
                                              else
                                              {
                                                darkmode = true;
                                              }

                                              savedarkmode(darkmode);

                                              if(darkmode==true)
                                              {
                                                setState(()  {
                                                  widget.backgroundcolor = Color(0xff1a1d21);
                                                  widget.cardcolor=Color(0xff212529);
                                                  widget.shadowcolor=Colors.black;
                                                  widget.titlecolor=Colors.grey[700];
                                                  widget.textcolor=Colors.grey[500];
                                                  widget.bottombarcolor=Color(0xff1a1d21);
                                                });
                                              }
                                              else
                                              {
                                                setState(() {
                                                  widget.backgroundcolor=Colors.white.withOpacity(0.90);
                                                  widget.cardcolor=Colors.white;
                                                  widget.shadowcolor=Colors.black;
                                                  widget.appbarcolor=Colors.white;
                                                  Color titlecolor=Colors.grey[700];
                                                  Color textcolor=Colors.grey[500];
                                                  widget.bottombarcolor=Colors.white;
                                                });
                                              }

                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
                                                backgroundcolor: widget.backgroundcolor,
                                                color: widget.color,
                                                gradiantcolor:widget.gradiantcolor,
                                                cardcolor:widget.cardcolor,
                                                shadowcolor:widget.shadowcolor,
                                                appbarcolor: widget.appbarcolor,
                                                titlecolor:widget.titlecolor,
                                                textcolor:widget.textcolor,
                                                bottombarcolor:widget.bottombarcolor,
                                              )));

                                            },
                                            icon: darkmode ? Icon(Icons.dark_mode,color: Colors.white,size: 24,) : Icon(Icons.dark_mode_outlined,color: Colors.white,size: 24,) ,
                                          ),

                                        ),
                                      ),

                                    ),



                                  ]
                              ),





                              Padding(
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child: new  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[


                                      Expanded(
                                        flex: 12,
                                        child:     Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0,0,0,0),
                                              child:  new  Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[

                                                  Expanded(
                                                    flex: 8,
                                                    child: Padding(
                                                      padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            child:
                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: new Text(
                                                                allTranslations.text( greeting()),
                                                                textAlign: TextAlign.left,
                                                                style: const TextStyle(
                                                                  // fontWeight: FontWeight.w700,
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

                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0,0,0,10),
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
                                                                name,
                                                                textAlign: TextAlign.left,
                                                                style: const TextStyle(
                                                                  fontWeight: FontWeight.w500,
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





                                          ],
                                        ),



                                      ),



                                      Expanded(
                                        flex: 2,
                                        child:  GestureDetector(
                                          onTap: () async{


                                            SharedPreferences prefs = await SharedPreferences.getInstance();

                                            String type = prefs.getString('user.type');
                                            if(type=='EMPLOYEE'){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Profile(
                                                  backgroundcolor: widget.backgroundcolor,
                                                  color: widget.color,
                                                  gradiantcolor:widget.gradiantcolor,
                                                  cardcolor:widget.cardcolor,
                                                  shadowcolor:widget.shadowcolor,
                                                  appbarcolor: widget.appbarcolor,
                                                  titlecolor:widget.titlecolor,
                                                  bottombarcolor:widget.bottombarcolor,
                                                  textcolor:widget.textcolor,
                                                )),
                                              );
                                            }
                                            else
                                            {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Profileadmin(
                                                  backgroundcolor: widget.backgroundcolor,
                                                  color: widget.color,
                                                  gradiantcolor:widget.gradiantcolor,
                                                  cardcolor:widget.cardcolor,
                                                  shadowcolor:widget.shadowcolor,
                                                  appbarcolor: widget.appbarcolor,
                                                  titlecolor:widget.titlecolor,
                                                  textcolor:widget.textcolor,
                                                  bottombarcolor:widget.bottombarcolor,
                                                )),
                                              );
                                            }

                                          }, // Image tapped
                                          child:   Padding(
                                            padding: EdgeInsets.fromLTRB(0,0,15,0),
                                            child: new Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                // width: 30,
                                                // height: 30,
                                                alignment: Alignment.center,
                                                child:   CircleAvatar(
                                                  backgroundImage:
                                                  NetworkImage(pic),
                                                  backgroundColor: Colors.grey,
                                                ),
                                              ),


                                            ),
                                          ),
                                        ),


                                      ),






                                    ]
                                ),


                              ),







                            ],
                          ),
                        ),


                      ),







                      Expanded(
                        flex: 10,
                        child:  Padding(
                          padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                          child:  SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ElevatedButton(

                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    primary: Colors.grey,
                                    onSurface: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    //make color or elevated button transparent
                                  ),

                                  onPressed: (){

                                  },
                                  child: Padding(
                                    padding:EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:Center(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(Icons.delete, size: 25),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
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
                              height: 40,
                              child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  primary: Colors.grey,
                                  onSurface: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  //make color or elevated button transparent
                                ),

                                onPressed: (){

                                },
                                child: Center(
                                  child: Text(""),
                                ),

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
                        flex: 10,
                        child:  Padding(
                          padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                          child:  SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  primary: Colors.grey,
                                  onSurface: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  //make color or elevated button transparent
                                ),

                                onPressed: (){

                                },
                                child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(Icons.create_rounded, size: 25),
                                          ),
                                        ],
                                      ),
                                    )
                                ),

                              )





                          ),


                        ),
                      ),


                    ]
                ),







                //admincart
                admincheck ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child:Row(
                      children: [



                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child:  Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 5, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    numberoffreelancers,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,3,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.groups_outlined,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("Freelancers"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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

                              onTap: () {

                              },
                            )


                        ),

                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child:  Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 10, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    countopenassignment,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,3,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.format_list_bulleted_rounded,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("OpenAssignment"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Openassignment(
                                    backgroundcolor:widget.backgroundcolor,
                                    color : widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor:widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                  ),
                                  ),
                                );
                              },
                            )


                        ),



                      ],
                    ),
                  ),


                ):new Container(),
                admincheck ?Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child:Row(
                      children: [



                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child:  Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 5, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    counttimes,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,5,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.access_time,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("times"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomecartTimes(
                                    backgroundcolor:widget.backgroundcolor,
                                    color : widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor:widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                  )),
                                );
                              },
                            )



                        ),
                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 10, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    numberofhours,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,5,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.access_time,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("Number of hours"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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
                              onTap: () {

                              },
                            )



                        ),




                      ],
                    ),
                  ),


                ):new Container(), //admincart
                // admincart




                //freelancercart
                freelancercheck ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child:Row(
                      children: [



                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child:  Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 5, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    countassignment,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,3,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.format_list_bulleted_rounded,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("Accept assignments"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomecrtAssignment(
                                    backgroundcolor:widget.backgroundcolor,
                                    color : widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor:widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                  ),
                                  ),
                                );
                              },
                            )


                        ),

                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child:  Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 10, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    countopenassignment,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,3,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.format_list_bulleted_rounded,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("OpenAssignment"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Openassignment(
                                    backgroundcolor:widget.backgroundcolor,
                                    color : widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor:widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                  ),
                                  ),
                                );
                              },
                            )


                        ),



                      ],
                    ),
                  ),


                ):new Container(),
                freelancercheck ?Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child:Row(
                      children: [



                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child:  Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 5, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    counttimes,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,5,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.access_time,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("send times"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomecartTimes(
                                    backgroundcolor:widget.backgroundcolor,
                                    color : widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor:widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                  )),
                                );
                              },
                            )



                        ),
                        Expanded(
                            flex: 3,
                            child:InkWell(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 10, 2),
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                decoration: BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        widget.gradiantcolor,
                                        widget.color,
                                        //add more colors
                                      ]),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 5
                                    )
                                  ],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[


                                      new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[





                                            Expanded(
                                              flex: 15,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                child: new  Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    countcansendinvoice,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 25.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ),


                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0,5,5,0),
                                                child: new Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(Icons.description_outlined,color: Colors.grey[300],size: 35,),


                                                ),
                                              ),

                                            ),





                                          ]
                                      ),





                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child: new  Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[


                                              Expanded(
                                                flex: 12,
                                                child:     Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                                                      child:  new  Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[

                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding: const EdgeInsets.fromLTRB(10, 5, 2, 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    child:
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: new Text(
                                                                        allTranslations.text("Create & Send"),
                                                                        textAlign: TextAlign.left,
                                                                        style: const TextStyle(
                                                                          // fontWeight: FontWeight.w700,
                                                                          fontSize: 14.0,
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomecartInvoice(
                                    backgroundcolor:widget.backgroundcolor,
                                    color : widget.color,
                                    gradiantcolor:widget.gradiantcolor,
                                    cardcolor:widget.cardcolor,
                                    shadowcolor:widget.shadowcolor,
                                    appbarcolor:widget.appbarcolor,
                                    titlecolor:widget.titlecolor,
                                    textcolor:widget.textcolor,
                                    bottombarcolor:widget.bottombarcolor,
                                  )),
                                );
                              },
                            )



                        ),




                      ],
                    ),
                  ),


                ):new Container(), //admincart
                // freelancercart






                //admin box
                admincheck ? Padding(
                  padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child:Row(
                      children: [


                        Expanded(
                          flex: 3,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 5, 5, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0,10),
                              child: Column(
                                children: <Widget>[


                                  new GestureDetector(
                                    onTap: ()async{
                                      
                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new createassignmentadmin(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));
                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.playlist_add,color: widget.color,size: 40,),


                                    ),

                                  ),









                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          flex: 3,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0,10),
                              child: Column(
                                children: <Widget>[


                                  new GestureDetector(
                                    onTap: ()async{
                                      setState((){
                                        notifcount = '0';
                                        notifcountshow = false;
                                      });
                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifications(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));

                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child:Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Icon(
                                            Icons.circle_notifications,color: widget.color,size: 40,
                                          ),

                                          notifcountshow?    Positioned(
                                            top: 0,
                                            right: 6,
                                            child: Container(
                                              height: 22,
                                              width: 22,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              child:  Center(
                                                  child: Text(
                                                    notifcount,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                      color:Colors.white,
                                                    ),
                                                  )),
                                            ),
                                          ): new Container(),
                                        ],
                                      ),

                                      // Icon(Icons.circle_notifications,color: widget.color,size: 40,),


                                    ),

                                  ),









                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          flex: 3,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0,10),
                              child: Column(
                                children: <Widget>[


                                  new GestureDetector(
                                    onTap: ()async{
                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Freelancers(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));
                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.groups_outlined,color: widget.color,size: 40,),


                                    ),

                                  ),









                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          flex: 3,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 5, 10, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0,10),
                              child: Column(
                                children: <Widget>[


                                  new GestureDetector(
                                    onTap: ()async{
                                      return showDialog(
                                          context: context,
                                          builder: (context) {
                                            return new Container(
                                              decoration:   BoxDecoration(
                                                color:widget.backgroundcolor,
                                              ),
                                              child: new Directionality(
                                                  textDirection: TextDirection.ltr,
                                                  child: new AlertDialog(
                                                    backgroundColor: widget.bottombarcolor,
                                                    title: new Text(allTranslations.text('Are you sure you want to leave?'),style: TextStyle(color: Colors.grey)),
                                                    content: new Text(allTranslations.text('Selecting the Yes option will exit the application'),style: TextStyle(color: Colors.grey)),
                                                    actions: <Widget>[
                                                      new FlatButton(
                                                          onPressed: () => Navigator.of(context).pop(false),
                                                          child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                                      ),
                                                      new FlatButton(
                                                          onPressed: () async{
                                                            // Navigator.pop(context);
                                                            // Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
                                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                                            await prefs.remove('user.api_token');

                                                            Navigator.of(context).pushReplacementNamed('/login');
                                                          },
                                                          child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            );
                                          }
                                      ) ?? false;
                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.logout,color: widget.color,size: 40,),


                                    ),

                                  ),









                                ],
                              ),
                            ),
                          ),

                        ),

                      ],
                    ),
                  ),


                ) : new Container(),
                //admin box



                //freelancer box
                freelancercheck ? Padding(
                  padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child:Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child: Text("".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),

                        Expanded(
                          flex: 8,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0,10),
                              child: Column(
                                children: <Widget>[


                                  new GestureDetector(
                                    onTap: ()async{

                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Calendermonth(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        data : widget.allassignments,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));
                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.calendar_today,color: widget.color,size: 40,),


                                    ),

                                  ),









                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          flex: 1,
                          child: Text("".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),

                        Expanded(
                          flex: 8,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Column(
                                children: <Widget>[


                                  new GestureDetector(
                                    onTap: ()async{

                                      setState((){
                                        notifcount = '0';
                                        notifcountshow = false;
                                      });

                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifications(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));

                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child:Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Icon(
                                            Icons.circle_notifications,color: widget.color,size: 40,
                                          ),

                                          notifcountshow?  Positioned(
                                            top: 0,
                                            right: 3,
                                            child: Container(
                                              height: 18,
                                              width: 18,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              child:  Center(
                                                  child: Text(
                                                    notifcount,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                      color:Colors.white,
                                                    ),
                                                  )),
                                            ),
                                          ) : new Container(),
                                        ],
                                      ),


                                    ),

                                  ),









                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          flex: 1,
                          child: Text("".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),

                        Expanded(
                          flex: 8,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Column(
                                children: <Widget>[


                                  new GestureDetector(
                                    onTap: ()async{
                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Managedocumentbyhome(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));
                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.file_copy_outlined,color: widget.color,size: 40,),


                                    ),

                                  ),









                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          flex: 1,
                          child: Text("".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),


                        Expanded(
                          flex: 8,
                          child:

                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),

                            decoration: BoxDecoration(
                              color: widget.cardcolor,


                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.0, 3.75),
                                    color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                    blurRadius: 5
                                )
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Column(
                                children: <Widget>[


                                  caninsert ?    new GestureDetector(
                                    onTap: ()async{

                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new createassignmentadmin(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));

                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.playlist_add,color: widget.color,size: 40,),


                                    ),

                                  ):new Container(),




                                  showdoc ?    new GestureDetector(
                                    onTap: ()async{

                                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Upload(backgroundcolor:widget.backgroundcolor,
                                        color : widget.color,
                                        gradiantcolor:widget.gradiantcolor,
                                        cardcolor:widget.cardcolor,
                                        shadowcolor:widget.shadowcolor,
                                        appbarcolor:widget.appbarcolor,
                                        titlecolor:widget.titlecolor,
                                        textcolor:widget.textcolor,
                                        bottombarcolor:widget.bottombarcolor,)));

                                    },
                                    child: new Align(
                                      alignment: Alignment.center,
                                      child: Icon(Icons.attach_file,color: widget.color,size: 40,),


                                    ),

                                  ):new Container(),






                                ],
                              ),
                            ),
                          ),

                        ),
                        Expanded(
                          flex: 1,
                          child: Text("".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),

                      ],
                    ),
                  ),


                ): new Container(),
                //freelancer box


                //Upcoming Assignments
                admincheck ? new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[





                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,10,0,0),
                          child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Text(allTranslations.text("Upcoming Assignments"),style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Colors.grey[700],
                                fontSize: 15
                            ),),


                          ),
                        ),

                      ),


                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0,10,20,0),
                          child: new Align(
                            alignment: Alignment.centerRight,
                            child: Text("-",style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: widget.color,
                                fontSize: 30
                            ),),


                          ),
                        ),

                      ),





                    ]
                ):new Container(),
                freelancercheck ? new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[





                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,10,0,0),
                          child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Text(allTranslations.text("My assignments"),style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Colors.grey[700],
                                fontSize: 15
                            ),),


                          ),
                        ),

                      ),


                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0,10,20,0),
                          child: new Align(
                            alignment: Alignment.centerRight,
                            child: Text("-",style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: widget.color,
                                fontSize: 30
                            ),),


                          ),
                        ),

                      ),





                    ]
                ):new Container(),
                Container(
                  height: 161,
                  // color: Colors.red,
                  child: _recordsdata.length == 0 ? listIsEmpty() : new
                  RefreshIndicator(
                    onRefresh: _pullRefresh,
                    child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
                        itemExtent: 340.0,
                        controller: _listScrollController,
//              padding: const EdgeInsets.only(top: 0),
                        itemCount: _recordsdata.length,
                        itemBuilder: (BuildContext context , int index)
                        {

                          return  GestureDetector(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                                data: _recordsdata[index],
                                backgroundcolor:widget.backgroundcolor,
                                color : widget.color,
                                gradiantcolor:widget.gradiantcolor,
                                cardcolor:widget.cardcolor,
                                shadowcolor:widget.shadowcolor,
                                appbarcolor:widget.appbarcolor,
                                titlecolor:widget.titlecolor,
                                textcolor:widget.textcolor,
                                bottombarcolor:widget.bottombarcolor,
                              )));
                              // Navigator.push(context,
                              //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                              // );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top:10,left: 10,right: 0,bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: widget.cardcolor,
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          offset: Offset(0.0, 3.75),
                                          color: Color.fromRGBO(0, 0, 0, 0.5), //shadow for button
                                          blurRadius: 5) //blur radius of shadow
                                    ]
                                ),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child:   new Column(
                                  children: <Widget>[

                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5.0,
                                        ),

                                        SizedBox(
                                          height: 35,
                                          child:   Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                              child:Text(_recordsdata[index].title.toString(),style: TextStyle(
                                                color: Colors.grey[700],
                                                // fontWeight: FontWeight.w700,
                                                fontSize: 14.0,
                                              ),),
                                            ),
                                          ),
                                        ),





                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                            child: Text(_recordsdata[index].company_name, style: TextStyle(
                                              color: Colors.grey,
                                              // fontWeight: FontWeight.w700,
                                              fontSize: 11.0,
                                            ),),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                            child:  Wrap(
                                              crossAxisAlignment: WrapCrossAlignment.center,
                                              children: [
                                                Icon(Icons.calendar_today,color: widget.color,size: 18,),
                                                Padding(
                                                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                    child: Text(eurodate(_recordsdata[index].start_date).toString(),
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        // fontWeight: FontWeight.w700,
                                                        fontSize: 15.0,
                                                      ),
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        ListTile(
                                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                          dense:true,
                                          contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                          title:        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child:   Wrap(
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: [
                                                  Icon(Icons.access_time,color: widget.color,size: 19,),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                    child:Text(allTranslations.text(gettoz(_recordsdata[index].maintime_from)+"-"+gettoz(_recordsdata[index].maintime_to)),style: TextStyle(
                                                      color: Colors.grey,
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 14.0,
                                                    ),),),
                                                ],
                                              ),

                                            ),
                                          ),
                                          trailing: Text("€ "+gettoz(_recordsdata[index].totalpayrate),style: TextStyle(
                                            color: widget.color,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                            fontFamily: 'Montserrat-Bold',
                                          ),),
                                        )




                                      ],
                                    ),


                                  ],
                                ),

                              ),
                            ), );




                        }
                    ),
                  ),
                ),
                //Upcoming Assignments

                //Open Assignments
                new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[





                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10,0,0,0),
                          child: new Align(
                            alignment: Alignment.centerLeft,
                            child: Text(allTranslations.text("Open Assignments"),style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: Colors.grey[700],
                                fontSize: 15
                            ),),


                          ),
                        ),

                      ),


                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0,10,20,0),
                          child: new Align(
                            alignment: Alignment.centerRight,
                            child: Text("-",style: TextStyle(
                              // fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: widget.color,
                                fontSize: 30
                            ),),


                          ),
                        ),

                      ),





                    ]
                ),
                Container(
                  height: 161,
                  // color: Colors.red,
                  child: _recordsdata1.length == 0 ? listIsEmpty1() : new
                  RefreshIndicator(
                    onRefresh: _pullRefresh,
                    child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
                        itemExtent: 340,
                        controller: _listScrollController1,
//              padding: const EdgeInsets.only(top: 0),
                        itemCount: _recordsdata1.length,
                        itemBuilder: (BuildContext context , int index)
                        {

                          return  GestureDetector(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detopenassignment(
                                data: _recordsdata1[index],
                                backgroundcolor:widget.backgroundcolor,
                                color : widget.color,
                                gradiantcolor:widget.gradiantcolor,
                                cardcolor:widget.cardcolor,
                                shadowcolor:widget.shadowcolor,
                                appbarcolor:widget.appbarcolor,
                                titlecolor:widget.titlecolor,
                                textcolor:widget.textcolor,
                                bottombarcolor:widget.bottombarcolor,
                              )));
                              // Navigator.push(context,
                              //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                              // );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top:10,left: 10,right: 0,bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: widget.cardcolor,
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          offset: Offset(0.0, 3.75),
                                          color: Color.fromRGBO(0, 0, 0, 0.5), //shadow for button
                                          blurRadius: 5) //blur radius of shadow
                                    ]
                                ),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child:   new Column(
                                  children: <Widget>[

                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 35,
                                          child:
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                            child:Text(_recordsdata1[index].title.toString(),style: TextStyle(
                                              color: Colors.grey[700],
                                              // fontWeight: FontWeight.w700,
                                              fontSize: 14.0,
                                            ),),
                                          ),
                                        ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                            child: Text(_recordsdata1[index].company_name, style: TextStyle(
                                              color: Colors.grey,
                                              // fontWeight: FontWeight.w700,
                                              fontSize: 12.0,
                                            ),),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                            child:  Wrap(
                                              crossAxisAlignment: WrapCrossAlignment.center,
                                              children: [
                                                Icon(Icons.calendar_today,color: widget.color,size: 18,),
                                                Padding(
                                                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                    child: Text(eurodate(_recordsdata1[index].start_date).toString(),
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        // fontWeight: FontWeight.w700,
                                                        fontSize: 15.0,
                                                      ),
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        freelancercheck? ListTile(
                                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                          dense:true,
                                          contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                          title:        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child:   Wrap(
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: [
                                                Icon(Icons.access_time,color: widget.color,size:19),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                child:Text(allTranslations.text(gettoz(_recordsdata1[index].maintime_from)+"-"+gettoz(_recordsdata1[index].maintime_to)),style: TextStyle(
                                                  color: Colors.grey,
                                                  // fontWeight: FontWeight.w700,
                                                  fontSize: 14.0,
                                                ),),),
                                                ],
                                              ),

                                            ),
                                          ),
                                          trailing: Text("€ "+gettoz(_recordsdata1[index].temptotalpayrate),style: TextStyle(
                                            color: widget.color,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                            fontFamily: 'Montserrat-Bold',
                                          ),),
                                        ):new Container(),

                                        admincheck ? ListTile(
                                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                          dense:true,
                                          contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                          title:        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child:   Wrap(
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: [
                                                  Icon(Icons.access_time,color: widget.color,size:19),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                    child:Text(allTranslations.text(gettoz(_recordsdata1[index].maintime_from)+"-"+gettoz(_recordsdata1[index].maintime_to)),style: TextStyle(
                                                      color: Colors.grey,
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 14.0,
                                                    ),),),
                                                ],
                                              ),

                                            ),
                                          ),

                                        ):new Container(),


                                      ],
                                    ),


                                  ],
                                ),

                              ),
                            ), );




                        }
                    ),
                  ),
                ),
                //Open Assignments



                SizedBox(
                  height: 10,

                ),
              ],
            ),
          ),
        ),
      );
  }



  //  all needs variable
  List<Massignment> _recordsdata = [];
  List<Massignment> _recordsdata1= [];
  int _currentPage = 1;
  bool _viewStream = true;
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  ScrollController _listScrollController1 = new ScrollController();
  //  all needs variable

  //if user pull to refresh page
  Future<Null> _pullRefresh() async {
    await _getrecords(refresh: true);
    return null;
  }
//if user pull to refresh page

  //  getting data from model
  _getrecords({ int page : 1 , bool refresh : false}) async
  {
    setState(() {
      _isLoading = true;
    });
    var response = await classgetservicesassignment.actiongetupcomingssignment();
    setState(() {
      if(refresh) _recordsdata.clear();
      _recordsdata.addAll(response['recordsdata']);
      if(_recordsdata.length == 0)
      {
        searchmsg="no data found";
      }
      _currentPage = response["current_page"];
      _isLoading = false;
    });
  }
//  getting data from model


  //  getting data from model
  _getrecords1({ int page : 1 , bool refresh : false}) async
  {
    setState(() {
      _isLoading = true;
    });
    var response = await classgetservicesassignment.actiongetupcomingopenssignment();
    setState(() {
      if(refresh) _recordsdata1.clear();
      _recordsdata1.addAll(response['recordsdata']);
      if(_recordsdata1.length == 0)
      {
        searchmsg1="no data found";
      }
      _currentPage = response["current_page"];
      _isLoading = false;
    });
  }
//  getting data from model



  Widget listIsEmpty() {
    return new Center(
      child: new Text(allTranslations.text(searchmsg),style:TextStyle(color: Colors.grey,)),
    );
  }

  Widget listIsEmpty1() {
    return new Center(
      child: new Text(allTranslations.text(searchmsg1),style:TextStyle(color: Colors.grey,)),
    );
  }


  //if user pull to refresh page
  Future<Null> _handleRefresh() async {
    await _getrecords(refresh: true);
    return null;
  }
//if user pull to refresh page



  _name() async{
    final prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString('user.api_token');
    String fcmtoken = prefs.getString('user.fcmtoken');
    var url ='https://mijnzpc.com/api/v1/checkuser?token=' + apiToken+'&fcmtoken='+fcmtoken;
    final response = await http.get(Uri.parse(url));
    var responseBody = json.decode(response.body)['data'];
    setState((){
      name = prefs.getString('user.first_name') ?? 'default';
      pic = responseBody['pic'];
    });
  }



  gettotalearningss() async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/dashboard?token='+token;
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      setState((){
        numberoffreelancers=responseBody['numberoffreelancers'].toString();//
        numberofhours=responseBody['numberofhours'].toString();//
        countassignment = responseBody['countassignment'].toString();//
        countopenassignment = responseBody['countopenassignment'].toString();//
        counttimes = responseBody['counttimes'].toString();
        countcansendinvoice = responseBody['countcansendinvoice'].toString();
        countprogresstimes = responseBody['countprogresstimes'].toString();
        notifcount = responseBody['notifs'].toString();

      });

if(notifcount!='0')
  {
    setState((){
      notifcountshow = true;
    });
  }








    }

  }

  Future<String> getclientname(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['client_name'].toString();
      }
      else
      {
        return '0';
      }

    }

  }

  Future<String> getdepartmentname(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();

    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['department_name'].toString();
      }
      else
      {
        return '0';
      }

    }

  }
  Future<String> getfrom(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();

    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['from'].toString()+"-"+responseBody['to'].toString();
      }
      else
      {
        return '0';
      }

    }

  }


  Future<String> getclientnameopen(String id) async
  {


    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+id.toString();

    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        return responseBody['profile'][0]['company_name'].toString();
      }
      else
      {
        return '0';
      }
    }
  }

  Future<String> getdepartmentnameopen(String id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/departmentinfo?token='+token+'&id='+id.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['department'].toList().length > 0)
      {
        return responseBody['department'][0]['title'].toString();
      }
      else
      {
        return '0';
      }
    }
  }
  Future<String> getfromopen(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detopenassignment?token='+token+'&id='+id.toString();


    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['from'].toString()+"-"+responseBody['to'].toString();
      }
      else
      {
        return '0';
      }

    }

  }


  Future<String> gettotalearnings(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();

    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['totalpayrate'].toString();
      }
      else
      {
        return '0';
      }

    }

  }


  checkadmin()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');


    if(type=='ADMIN')
    {
      setState(() {
        admincheck = true;
      });
    }


  }

  checkfreelancer()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');

    if(type=='EMPLOYEE')
    {
      setState(() {
        freelancercheck = true;
      });
    }


  }


  checkshowstatus()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    var caninsertassignment = prefs.getString('user.caninsertassignment');

    if(caninsertassignment=='1')
    {
      setState(() {
        caninsert = true;
        showdoc = false;
      });
    }
    else
    {
      setState(() {
        caninsert = false;
        showdoc = true;
      });
    }



  }

  eurodate(String date)
  {

    final splitted = date.split('-');
    return splitted[2]+"-"+splitted[1]+"-"+splitted[0];


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


  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    }
    if (hour < 18) {
      return 'Good afternoon';
    }
    return 'Good night';
  }
  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmailURL(String phoneNumber) async {
    String url = 'mailto:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  checkdarkmode()async{
    final prefs = await SharedPreferences.getInstance();
    var darkmodeee = prefs.getString('user.darkmode');
    if(darkmodeee=='1')
    {
      setState(() {
        darkmode = true;
      });
    }
    else {
      setState(() {
        darkmode=false;
      });
    }

  }
  savedarkmode(bool value) async{

    if(value==true)
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user.darkmode', '1');
    }
    else
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user.darkmode', '0');
    }




  }





}