//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/all_translations.dart';
class Detdepartment extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new DetdepartmentState();

}

class DetdepartmentState extends State<Detdepartment> with AutomaticKeepAliveClientMixin<Detdepartment> {
  bool get wantKeepAlive => true;


  String clien_name='';
  String employee_name='';
  String department_name='';
  String from='';
  String to='';
  String duration='';
  String start_date='';
  String breake='';
  String sleepshift='';
  String calculatednumber='';
  String defualtsurcharge='';
  String totalpayrate='';
  String totalclientpayrate='';

  @override
  Widget build(BuildContext context) {

    super.build(context);

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Department information'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: Colors.white,

      ),
      // backgroundColor:Colors.grey[300],
      body:

      SingleChildScrollView(
        child:      Column(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
              child:     Container(
                width: MediaQuery.of(context).size.width,
                // height: 140.0,
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xff425626),
                        Color(0xff89B44B),
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
                                                    allTranslations.text("Department : test"),
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w700,
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
                                  padding: EdgeInsets.fromLTRB(0,2,0,0),
                                  child:  new  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[

                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 2, 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                child:
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    "Client name",
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
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


                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                child:
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: new Text(
                                                    "12345678",
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
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






                  ],
                ),
              ),


            ),



            Padding(
              padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
              child:     Container(
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
                child:

                Column(
                  children: [



                    Padding(
                      padding: EdgeInsets.fromLTRB(0,1,0,0),
                      child:  new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:   Icon(Icons.location_on_outlined,color: Color(0xff89B44B),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        "user adress",
                                        textAlign: TextAlign.left,
                                        style:   TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Colors.grey[500],
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
                      padding: EdgeInsets.fromLTRB(0,1,0,10),
                      child:  new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:   Icon(Icons.call,color: Color(0xff89B44B),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        "user adress",
                                        textAlign: TextAlign.left,
                                        style:   TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Colors.grey[500],
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


            ),






            Padding(
              padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
              child:     Container(
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
                child:  Container(
                  // height: 450,
                  decoration: new BoxDecoration(
                    //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.only(
                          bottomLeft:  const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(150.0))
                  ),
                  child:  Column(
                    children: [


                      Padding(
                        padding: EdgeInsets.fromLTRB(0,30,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          "Department description",
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
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
                        padding: EdgeInsets.fromLTRB(0,2,0,10),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          "department_name",
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                            color: Colors.grey[500],
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
                        padding: EdgeInsets.fromLTRB(0,10,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          "Department requirments",
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
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
                        padding: EdgeInsets.fromLTRB(0,2,0,30),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          "department name",
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                            color: Colors.grey[500],
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

              ),


            ),












          ],

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
      child: new Text('در حال جستجو  '),
    );
  }



  getdet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+12.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        setState(() {
          totalpayrate=responseBody['assignment'][0]['totalpayrate'];
          totalclientpayrate=responseBody['assignment'][0]['totalclientpayrate'];
          start_date=responseBody['assignment'][0]['start_date'];
          duration=responseBody['assignment'][0]['durationintime'];
          calculatednumber=responseBody['assignment'][0]['effecteddurationintime'];
          clien_name=responseBody['client_name'];
          employee_name=responseBody['employee_name'];
          department_name=responseBody['department_name'];
          from=responseBody['from'];
          to=responseBody['to'];
          defualtsurcharge=responseBody['defualtsurcharge'];

          breake=responseBody['breake'];
          sleepshift=responseBody['sleepshift'];






          // jobtitlename= responseBody['jobtitle'][0]['title'];
        });
      }

    }

  }




  // _launchPhoneURL() async {
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('user.api_token');
  //   String type = prefs.getString('user.type');
  //   String tell='';
  //   String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+widget.data.id.toString();
  //   print(url);
  //   final response = await http.get(Uri.parse(url),);
  //   if(response.statusCode == 200) {
  //     var responseBody = json.decode(response.body)['data'];
  //
  //
  //     if(responseBody['assignment'].toList().length > 0)
  //     {
  //       tell = responseBody['department'][0]['phone'].toString();
  //     }
  //
  //   }
  //
  //
  //   print(tell);
  //   tell = 'tel:' + tell;
  //   if (await canLaunch(tell)) {
  //     await launch(tell);
  //   } else {
  //     throw 'Could not launch $tell';
  //   }
  // }




}





