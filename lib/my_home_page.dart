//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/pages/admin/admins.dart';
import 'package:mijnzpc/pages/admin/agreements.dart';
import 'package:mijnzpc/pages/admin/clients.dart';
import 'package:mijnzpc/pages/admin/departments.dart';
import 'package:mijnzpc/pages/admin/financialdepartments.dart';
import 'package:mijnzpc/pages/admin/freelancer.dart';
import 'package:mijnzpc/pages/admin/scheduledepartments.dart';
import 'package:mijnzpc/pages/calenderday.dart';
import 'package:mijnzpc/pages/calendermonth.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/pages/dashboard/assignments/homecartassignment.dart';
import 'package:mijnzpc/pages/dashboard/invoices/managedocumentsbyhome.dart';
import 'package:mijnzpc/pages/dashboard/openassignments/openassignment.dart';
import 'package:mijnzpc/pages/dashboard/invoices/managedocuments.dart';
import 'package:mijnzpc/pages/dashboard/invoices/uploaddocuments.dart';
import 'package:mijnzpc/pages/dashboard/times/homecarttimes.dart';
import 'package:mijnzpc/pages/dashboard/times/times.dart';
import 'package:mijnzpc/pages/dashboard/assignments/assignment.dart';
import 'package:mijnzpc/pages/dashboard/invoices/invoices.dart';
import 'package:mijnzpc/pages/createassignmentadmin.dart';
import 'package:mijnzpc/pages/homeadmin.dart';

import 'package:mijnzpc/pages/notifications.dart';
import 'package:mijnzpc/pages/notifroute.dart';
import 'package:mijnzpc/pages/profile.dart';
import 'package:mijnzpc/pages/profileadmin.dart';
import 'package:mijnzpc/pages/select_language_secreen.dart';
import 'package:mijnzpc/pages/selectcolor.dart';
import 'package:mijnzpc/pages/setting_screen.dart';
import 'package:mijnzpc/pages/suggestions.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/services/assignmentservices.dart';
import 'package:mijnzpc/services/getservices.dart';

import 'package:mijnzpc/all_translations.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import 'firebase_options.dart';
import 'message.dart';
import 'message_list.dart';
import 'permissions.dart';
import 'token_monitor.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class MyHomePages extends StatefulWidget {

  MyHomePages(
      {@required this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor
      });

    Color backgroundcolor;
    Color color;
    Color gradiantcolor;
    Color cardcolor;
    Color shadowcolor;
    Color appbarcolor;
    Color titlecolor;
  Color textcolor;
  Color bottombarcolor;
  @override
  State<StatefulWidget> createState() => MyHomePagesState();
  final GlobalKey _scaffoldKey = new GlobalKey();
}


class MyHomePagesState extends State<MyHomePages> {

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

  String notifcount='0';
  bool     notifcountshow = false;


  DateTime currentBackPressTime;
  String   date1='';
  String   starttime1='';
  String   endtime1='';
  bool     darkmode = true;
  bool     breake1 = false;
  bool     speedassignment1= false;


  String currentPageName = 'home';
  String name = '';
  String credit = '';
  String pic = 'https://mijnzpc.com/deeee.jpg';
  int _selectedIndex = 0;
  bool get wantKeepAlive => true;
  bool   admincheck = false;
  bool   freelancercheck = false;
  // We can detech the location of the card by this  GlobalKey<CartIconKey>

  int state=0;

  int canshownotifroute=1;


  var _cartQuantityItems = 5;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    if (1==1) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }


  void initState() {

    // This method will call when the app is in kill state
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message)  async {
      if (message != null) {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('user.api_token');

        String url = 'https://mijnzpc.com/api/v1/checknotification?token=' +
            token + '&assignments_id=' +
            message.data['assignments_id'].toString() + '&invoice_id=' +
            message.data['invoice_id'].toString() + '&agreement_id=' +
            message.data['agreement_id'].toString() + '&value=' +
            message.data['value'].toString() + '&key=' +
            message.data['key'].toString();

        final response = await http.get(Uri.parse(url),);

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body)['data'];
          if (responseBody['canshownotifroute'] == 0) {

            if (message != null) {

              if (message.data['screen'] == 'New assignment') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "New assignment",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'New open assignment') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "New open assignment",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'New open assignment admin') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "New open assignment admin",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'New multiple assignment') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new HomecrtAssignment(
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else
              if (message.data['screen'] == 'New multiple open assignment') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Openassignment(
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'New limit assignment') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "New open assignment",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else
              if (message.data['screen'] == 'New multiple limit assignment') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Openassignment(
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'open Assignment updated') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "New open assignment",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'limit Assignment updated') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "New open assignment",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'Assignment deleted') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new HomecrtAssignment(
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'open Assignment deleted') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Openassignment(
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'limit Assignment deleted') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Openassignment(
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'Send times') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new HomecartTimes(
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'Times approved') {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "Times approved",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'Times rejected') {
                Navigator.push(context, new MaterialPageRoute(builder: (
                    context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "Times approved",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'New candidate') {
                Navigator.push(context, new MaterialPageRoute(builder: (
                    context) =>
                new Suggestions(
                  assignment_id: int.parse(message.data['status']),
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else
              if (message.data['screen'] == 'Registration new freelancer') {
                Navigator.push(context, new MaterialPageRoute(builder: (
                    context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "Registration new freelancer",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'Registration new client') {
                Navigator.push(context, new MaterialPageRoute(builder: (
                    context) =>
                new Notifroute(
                  data_id: message.data['status'],
                  whatpage: "Registration new client",
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor: widget.gradiantcolor,
                  cardcolor: widget.cardcolor,
                  shadowcolor: widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor: widget.titlecolor,
                  textcolor: widget.textcolor,
                  bottombarcolor: widget.bottombarcolor,
                )));
              }
              else if (message.data['screen'] == 'Registration new financial') {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new Notifroute(
                      data_id: message.data['status'],
                      whatpage: "Registration new financial",
                      backgroundcolor: widget.backgroundcolor,
                      color: widget.color,
                      gradiantcolor: widget.gradiantcolor,
                      cardcolor: widget.cardcolor,
                      shadowcolor: widget.shadowcolor,
                      appbarcolor: widget.appbarcolor,
                      titlecolor: widget.titlecolor,
                      textcolor: widget.textcolor,
                      bottombarcolor: widget.bottombarcolor,
                    )));
              }
              else if (message.data['screen'] == 'Registration new Schdule') {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new Notifroute(
                      data_id: message.data['status'],
                      whatpage: "Registration new Schdule",
                      backgroundcolor: widget.backgroundcolor,
                      color: widget.color,
                      gradiantcolor: widget.gradiantcolor,
                      cardcolor: widget.cardcolor,
                      shadowcolor: widget.shadowcolor,
                      appbarcolor: widget.appbarcolor,
                      titlecolor: widget.titlecolor,
                      textcolor: widget.textcolor,
                      bottombarcolor: widget.bottombarcolor,
                    )));
              }
            }
          }
          else {
            print('cant show notif route');



          }
        }


      }

    });



    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data['screen']}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');


      }
    });



    //This method will call when the app is in background state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage  message) async{
      if (message != null) {
        var messageold=message;
         message=null;

        print('A new onMessageOpenedApp event was published! in background');
        print('in background state');
        print(messageold.data);
        print('call notif page2');

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('user.api_token');

        String url ='https://mijnzpc.com/api/v1/checknotification?token='+token+'&assignments_id='+messageold.data['assignments_id'].toString()+'&invoice_id='+messageold.data['invoice_id'].toString()+'&agreement_id='+messageold.data['agreement_id'].toString()+'&value='+messageold.data['value'].toString()+'&key='+messageold.data['key'].toString();
        print(url);
        final response = await http.get(Uri.parse(url),);
        if(response.statusCode == 200)
        {
          var responseBody = json.decode(response.body)['data'];
          if (responseBody['canshownotifroute'] == 0)
          {

            if(messageold.data['screen']=='New assignment')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "New assignment",
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
            }
            else
            if(messageold.data['screen']=='New open assignment')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "New open assignment",
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
            }
            else if (messageold.data['screen'] == 'New open assignment admin') {
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) =>
              new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "New open assignment admin",
                backgroundcolor: widget.backgroundcolor,
                color: widget.color,
                gradiantcolor: widget.gradiantcolor,
                cardcolor: widget.cardcolor,
                shadowcolor: widget.shadowcolor,
                appbarcolor: widget.appbarcolor,
                titlecolor: widget.titlecolor,
                textcolor: widget.textcolor,
                bottombarcolor: widget.bottombarcolor,
              )));
            }
            else
            if(messageold.data['screen']=='New multiple assignment')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomecrtAssignment(
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
            }
            else
            if(messageold.data['screen']=='New multiple open assignment')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
            }
            else
            if(messageold.data['screen']=='New limit assignment')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "New open assignment",
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
            }
            else
            if(messageold.data['screen']=='New multiple limit assignment')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
            }
            else
            if(messageold.data['screen']=='open Assignment updated')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "New open assignment",
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
            }
            else
            if(messageold.data['screen']=='limit Assignment updated')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "New open assignment",
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
            }
            else
            if(messageold.data['screen']=='Assignment deleted')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomecrtAssignment(
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
            }
            else
            if(messageold.data['screen']=='open Assignment deleted')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
            }
            else
            if(messageold.data['screen']=='limit Assignment deleted')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
            }
            else
            if(messageold.data['screen']=='Send times')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomecartTimes(
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
            }
            else
            if(messageold.data['screen']=='Times approved')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "Times approved",
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
            }
            else
            if(messageold.data['screen']=='Times rejected')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "Times approved",
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
            }
            else
            if(messageold.data['screen']=='New candidate')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Suggestions(
                assignment_id: int.parse(messageold.data['status']),
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
            }
            else
            if(messageold.data['screen']=='Registration new freelancer')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "Registration new freelancer",
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
            }
            else
            if(messageold.data['screen']=='Registration new client')
            {

              print('call notif page');
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "Registration new client",
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
            }
            else
            if(messageold.data['screen']=='Registration new financial')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "Registration new financial",
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
            }
            else
            if(messageold.data['screen']=='Registration new Schdule')
            {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
                data_id: messageold.data['status'],
                whatpage: "Registration new Schdule",
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
            }





          }










        }




      }
    });


    // FirebaseMessaging.onMessage.listen(showFlutterNotification);





    super.initState();
    _getallassignments();
    checkLogin();
    gettotalearningss();

    _name();

    checkdarkmode();
    checkfreelancer();
    checkadmin();
  }
  Future<bool> _onWillPop() {

    if(_selectedIndex!=0){
      setState(()   {
        state = 0;
        _selectedIndex = 0;
      });
      return Future.value(false);
      }
    else
      {
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
                        title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                        content: new Text(allTranslations.text('You are about to exit the application. Proceed?'),style: TextStyle(color: Colors.grey)),
                        actions: <Widget>[
                          new FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                          ),
                          new FlatButton(
                              onPressed: () {
                                // exit(0);
                                SystemNavigator.pop();
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






  }
  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString('user.api_token');
    if(apiToken == null)
    {navigationToLogin();}
  }
  navigationToLogin() {
    Navigator.of(context).pushReplacementNamed('/login');
  }
  navigationToHome() {
    Navigator.of(context).pushReplacementNamed('/');
  }
  final Map<String , Widget> children = <String , Widget>{
    // 'home' : new UserPage(),
    // 'search' : new UserPage(),
    // 'plus' : new UserPage(),
    // 'favorite' : new UserPage(),
    // 'profile' : new UserPage()
  };

  // final GlobalKey _scaffoldKey = new GlobalKey();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  changePage(String namePage) {
    setState(() {
      currentPageName = namePage;
    });
  }

  Widget pageCaller(int index) {

    setState(()   {
      state = index;
    });




    // getappbar(context).of(context).rebuild();

    switch (index) {
      // case 0:
      //   {
      //     return Openassignment(backgroundcolor:widget.backgroundcolor,
      //       color : widget.color,
      //       gradiantcolor:widget.gradiantcolor,
      //       cardcolor:widget.cardcolor,
      //       shadowcolor:widget.shadowcolor,
      //       appbarcolor:widget.appbarcolor,
      //       titlecolor:widget.titlecolor,
      //       textcolor:widget.textcolor,
      //     );
      //   }
      case 0:
        {



          return Homeadmin(backgroundcolor:widget.backgroundcolor,
            color : widget.color,
            gradiantcolor:widget.gradiantcolor,
            allassignments:_allassignments,
            cardcolor:widget.cardcolor,
            shadowcolor:widget.shadowcolor,
            appbarcolor:widget.appbarcolor,
            titlecolor:widget.titlecolor,
            textcolor:widget.textcolor,
            bottombarcolor:widget.bottombarcolor,
          );

       break;



        }
      case 1:
        {


        return Assignment(backgroundcolor:widget.backgroundcolor,
        color : widget.color,
        gradiantcolor:widget.gradiantcolor,
        cardcolor:widget.cardcolor,
        shadowcolor:widget.shadowcolor,
        appbarcolor:widget.appbarcolor,
        titlecolor:widget.titlecolor,
        textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,
        );

        }
      case 2:
        {


          return Times(backgroundcolor:widget.backgroundcolor,
            color : widget.color,
            gradiantcolor:widget.gradiantcolor,
            cardcolor:widget.cardcolor,
            shadowcolor:widget.shadowcolor,
            appbarcolor:widget.appbarcolor,
            titlecolor:widget.titlecolor,
            textcolor:widget.textcolor,
            bottombarcolor:widget.bottombarcolor,
          );
        }
      case 3:
        {


          return Invoices(backgroundcolor:widget.backgroundcolor,
            color : widget.color,
            gradiantcolor:widget.gradiantcolor,
            cardcolor:widget.cardcolor,
            shadowcolor:widget.shadowcolor,
            appbarcolor:widget.appbarcolor,
            titlecolor:widget.titlecolor,
            textcolor:widget.textcolor,
            bottombarcolor:widget.bottombarcolor,
          );
        }

    }
  }

  Widget getappbar(BuildContext context) {

    if(state==0)
    {

    }
    else
    {
    return AppBar(
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  // Color(0xff425626),
                  // Color(0xff89B44B),
                  //add more colors
                  widget.gradiantcolor,
                  widget.color,

                ]),
          ),
        ),
        // backgroundColor: widget.color,
        elevation: 1.0,
        actions: [

          GestureDetector(
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
                  width: 30,
                  height: 30,
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




          // IconButton(
          //   icon: Icon(
          //     Icons.supervisor_account,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Profile()),
          //     );
          //   },
          // )
        ],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.apps,color: Colors.white),
          onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title : SizedBox(
          height: 44,
          child: new Image.asset("assets/images/logo.png"),
        ),
        // actions: [
        //   // IconButton(
        //   //   icon: Icon(Icons.message_outlined,color: Colors.black,),
        //   //   onPressed: () {
        //   //     // Navigator.push(
        //   //     //   context,
        //   //     //   MaterialPageRoute(builder: (context) => Livechat()),
        //   //     // );
        //   //   },
        //   // ),
        // ],
      );
    }




  }

  @override
  Widget build(BuildContext context)  {
    return new WillPopScope(
        child:new Scaffold(
          key: _scaffoldKey,
          appBar:getappbar(context),
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
                                  data : _allassignments,
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
                            child:Icon(Icons.circle_notifications_outlined,color: widget.color,),
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
                    //                   Expanded(
                    //                     flex: 2,
                    //                     child:Icon(Icons.dark_mode_outlined,color: widget.color,),
                    //                   ),
                    //                   Expanded(
                    //                     flex: 8,
                    //                     child:InkWell(
                    //                       onTap: () {
                    //
                    //                       },
                    //                       child: new Text(
                    //                         allTranslations.text("Dark Mode"),
                    //                         textAlign: TextAlign.left,
                    //                         style: TextStyle(
                    //                           // fontWeight: FontWeight.w700,
                    //                             color: Colors.grey,
                    //                             fontSize: 17
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
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
                      padding: EdgeInsets.only(top:10,left: 0,right:0,bottom: 120),
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
          body:Center(
            child: pageCaller(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavyBar(
            containerHeight: 50.0,
            // showElevation: false,
            itemCornerRadius: 0,
            curve: Curves.easeIn,
            backgroundColor: widget.bottombarcolor,
            selectedIndex: _selectedIndex,
            showElevation: true,
            onItemSelected: (index) {
              setState(()   {
                state = index;
                _selectedIndex = index;
              });


            },
            items: <BottomNavyBarItem>[

              // BottomNavyBarItem(
              //   icon: Icon(Icons.toc_sharp,size: 25),
              //   title: Text('Open Assignment',style: TextStyle(fontSize: 12),),
              //   activeColor: widget.color,
              //   textAlign: TextAlign.center,
              // ),

              BottomNavyBarItem(

                icon: Icon(Icons.home_rounded,size: 25),
                title: Text(
                  allTranslations.text('Home'),style: TextStyle(fontSize: 12),
                ),
                activeColor:  widget.color,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.format_list_bulleted_rounded,size: 25),
                title: Text(allTranslations.text('Assignments'),style: TextStyle(fontSize: 12),),
                activeColor: widget.color,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.access_time,size: 25),
                title: Container(
                  padding: const EdgeInsets.only(left: 0.0,right: 0.0,),
                  child: Text(
                    allTranslations.text('Times'),style: TextStyle(fontSize: 12),
                  ),
                ),

                activeColor: widget.color,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.description_outlined,size: 25),
                title: Text(allTranslations.text('Invoices '),style: TextStyle(fontSize: 12),),
                activeColor: widget.color,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        onWillPop: _onWillPop
    );
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

print('er bserbrb');
print(responseBody['opentimealertapp']);

      var type = prefs.getString('user.type');


      if(type=='EMPLOYEE')
      {
        if(responseBody['opentimealertapp']==1)
        {
          return showDialog(
              context: context,
              builder: (context) {
                return new Directionality(
                    textDirection: TextDirection.ltr,
                    child: new AlertDialog(
                      backgroundColor: widget.backgroundcolor,
                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                      content: new Text(allTranslations.text('Attention!\nThere are still assignments that have not been invoiced.\nFirst, check if all the assignments from last month\nhave been accepted by you.\nThen check that all Times\nhave been sent and whether there are still approved\nTimes that can be invoiced.'),
                          style: TextStyle(color: Colors.grey)),
                      actions: <Widget>[

                        new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
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


  checkadmin()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    print('saaaa');
    print(type);
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
print('cccccccccccccccccccc');
    print(darkmode);
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


  _launchWhatsapp() async {
    const url = "https://wa.me/?text=Hey buddy, try this super cool new app!";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  List<Massignment> _allassignments = [];
  //  getting data from model
  _getallassignments({ int page : 1 , bool refresh : false}) async
  {
    print('startget');
    var response = await classgetservices.actiongetallassignment();
    setState(() {
      print(page);
      if(refresh) _allassignments.clear();
      _allassignments.addAll(response['recordsdata']);
      print('startget2');
    });
    print('endget');
    print(_allassignments);
  }
//  getting data from model


}
