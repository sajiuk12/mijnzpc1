//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/mimage.dart';
import 'package:mijnzpc/models/mstrommetr.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/dashboard/invoices/managedocumentsbyhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/pages/dashboard/invoices/managedocuments.dart';
import 'package:mijnzpc/pages/dashboard/invoices/uploaddocuments.dart';
import 'package:mijnzpc/pages/filters/filterdepartment.dart';
import 'package:mijnzpc/pages/filters/filteremployee.dart';
import 'package:mijnzpc/pages/filters/filterjobtitle.dart';
import 'package:mijnzpc/pages/filters/filtermonth.dart';
import 'package:mijnzpc/pages/filters/filtersort.dart';
import 'package:mijnzpc/pages/filters/filterstartdate.dart';
import 'package:mijnzpc/pages/filters/filterstatusass.dart';
import 'package:mijnzpc/pages/filters/filteryear.dart';
import 'package:mijnzpc/pages/profile.dart';
import 'package:mijnzpc/services/assignmentservices.dart';
import 'package:mijnzpc/pages/filters/filterclient.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mijnzpc/all_translations.dart';
class Managedocumentoptionalbyhome extends StatefulWidget {

  Managedocumentoptionalbyhome(
      {@required this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor});


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
  _ManagedocumentoptionalbyhomeState createState() => _ManagedocumentoptionalbyhomeState();
}

class _ManagedocumentoptionalbyhomeState extends State<Managedocumentoptionalbyhome> {

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
  String searchmsg="Searching";
  @override
  void initState() {
    super.initState();
    _getrecords();
    _getrecords1();

    // _listScrollController.addListener(() {
    //
    //   double maxScroll = _listScrollController.position.maxScrollExtent;
    //   double currentScroll = _listScrollController.position.pixels;
    //   if(maxScroll - currentScroll <= 200) {
    //     if(! _isLoading) {
    //
    //       _getrecords(page : _currentPage + 1);
    //     }
    //   }
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePages(
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
    },
    child:
      Scaffold(
        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Documents'),style: TextStyle(color: Colors.grey),),),
          leading: BackButton(
            onPressed: () =>   Navigator.push(
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
            ),
          ),
          backgroundColor: widget.bottombarcolor,

        ),

        backgroundColor: widget.backgroundcolor,

        bottomSheet:Container(
    decoration:   BoxDecoration(
    color:widget.backgroundcolor,
    ),
    child:
    new  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Expanded(
                flex: 10,
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
                                    widget.gradiantcolor,
                                    widget.color,
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
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Upload(backgroundcolor: widget.backgroundcolor,
                                  color: widget.color,
                                  gradiantcolor:widget.gradiantcolor,
                                  cardcolor:widget.cardcolor,
                                  shadowcolor:widget.shadowcolor,
                                  appbarcolor: widget.appbarcolor,
                                  titlecolor:widget.titlecolor,
                                  bottombarcolor:widget.bottombarcolor,
                                  textcolor:widget.textcolor,)));
                              },
                              child: Padding(
                                padding:EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child:Center(
                                  child: Text(allTranslations.text('Upload Documents') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                ),
                              )
                          )
                      )

                  ),


                ),
              ),







            ]
        ),
        ),


        body: Container(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 50),

          child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              new  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child:
                    Container(

                      height: 40,


                      child:
                      Padding(
                        padding: EdgeInsets.only(top:0,left: 10,right: 12,bottom: 7),
                        child: Align(
                            alignment: Alignment.center,

                            child: InkWell(
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
                              child:  Text(allTranslations.text("Mandetory"),style: TextStyle(
                                // fontWeight: FontWeight.w500,
                                fontSize: 15.4,
                                letterSpacing: 0.5,
                                color: Colors.grey,

                              ),),
                            )
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 10,
                    child:
                    Container(

                      height: 40,


                      child:
                      Padding(
                        padding: EdgeInsets.only(top:0,left: 10,right: 12,bottom: 7),
                        child: Align(
                            alignment: Alignment.center,

                            child: InkWell(
                              onTap: () {

                              },
                              child:  Text(allTranslations.text("Optional"),style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.4,
                                letterSpacing: 0.5,
                                color: Colors.grey,
                              ),),
                            )



                        ),
                      ),
                    ),
                  ),



                ],),


              Expanded(
                child: _recordsdata.length == 0 ? listIsEmpty() : new
                RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child:
                  new ListView.builder(
                    // padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
                    // itemExtent: 95.0,
                      controller: _listScrollController,
//              padding: const EdgeInsets.only(top: 0),
                      itemCount: _recordsdata.length,
                      itemBuilder: (BuildContext context , int index)
                      {


                        return  GestureDetector(
                            onTap: () async {

                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              String token = prefs.getString('user.api_token');
                              final payUrl = 'https://mijnzpc.com/api/v1/downloaddocument?token='+token+'&id='+_recordsdata[index].id.toString();
                              print(payUrl);
                              var urllaunchable = await canLaunch(payUrl); //canLaunch is from url_launcher package
                              if(urllaunchable){
                                await launch(payUrl); //launch is from url_launcher package to launch URL
                              }else{
                                print("URL can't be launched.");
                              }





                            },
                            child:Padding(
                              padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color:  widget.cardcolor,
                                      borderRadius: BorderRadius.circular(0),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            offset: Offset(0.0, 3.75),
                                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                            blurRadius: 5) //blur radius of shadow
                                      ]
                                  ),
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      SizedBox(
                                        width: 50,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.0, 2.0, 5.0, 5.0),
                                              child: new Container(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: new NetworkImage(
                                                              checkstatus(_recordsdata[index].url)
                                                          )
                                                      )
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),



                                      SizedBox(
                                        width: 250,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            new Text(
                                        allTranslations.text( _recordsdata[index].document_title.toString()),
                                                style:   TextStyle(
                                                  color: Colors.grey[500],
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.4,
                                                ),
                                                textAlign: TextAlign.center
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),


                                            new Text(
                                              allTranslations.text("Expiration date: ")+eurodate(getexpire(_recordsdata[index].expires_at)).toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                    color:  Colors.grey
                                                ),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),
                                      ),


                                      // SizedBox(
                                      //     width: 20,
                                      //     height: 40,
                                      //     child:  ElevatedButton(
                                      //         style: ElevatedButton.styleFrom(
                                      //           minimumSize: Size.zero, // Set this
                                      //           padding: EdgeInsets.zero,
                                      //           primary: Colors.transparent,
                                      //           onSurface: Colors.transparent,
                                      //           shadowColor: Colors.transparent,
                                      //           //make color or elevated button transparent
                                      //         ),
                                      //
                                      //         onPressed: (){
                                      //
                                      //         },
                                      //         child: Padding(
                                      //           padding:EdgeInsets.only(
                                      //             top: 10,
                                      //             bottom: 5,
                                      //           ),
                                      //           child:Center(
                                      //               child: RichText(
                                      //                 text: TextSpan(
                                      //                   children: [
                                      //                     WidgetSpan(
                                      //                       child: Icon(Icons.delete_outline, size: 25,color: Color(0xff89B44B),),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               )
                                      //           ),
                                      //         )
                                      //     )
                                      //
                                      //
                                      // ),
                                      //




                                    ],
                                  )
                              ),

                            )

                        );









                      }
                  ),
                ),
              ),

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
  List<Mimage> _recordsdata = [];
  List<Mimage> _recordsdata1 = [];
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
    var response = await classgetservicesassignment.actiongetimages('optional');
    setState(() {
      if(refresh) _recordsdata.clear();
      _recordsdata.addAll(response['recordsdata']);
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
    var response = await classgetservicesassignment.actiongetimages('optional');
    setState(() {
      if(refresh) _recordsdata1.clear();
      _recordsdata1.addAll(response['recordsdata']);
      if(_recordsdata.length == 0)
      {
        searchmsg="no data found";
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

  //if user pull to refresh page
  Future<Null> _handleRefresh() async {
    await _getrecords(refresh: true);
    return null;
  }
//if user pull to refresh page





  checkstatus(string)
  {

    string=json.decode(string);
    string=string['images'];
    var newString = string.substring(string.length - 3);
    print(newString);

    if(newString=="png" || newString=="jpg" || newString=="peg")
    {
      print("https://mijnzpc.com"+string);

      return "https://mijnzpc.com"+string;
    }
    else
    if(newString=="pdf")
    {
      return "https://mijnzpc.com/pdf.png";
    }
    else
    {
      return "https://mijnzpc.com/def.png";
    }


  }


  getexpire(String s){

    int idx = s.indexOf(" ");
    return s.substring(0,idx).trim();
    List parts = [s.substring(0,idx).trim(), s.substring(idx+1).trim()];

  }


  eurodate(String date)
  {

    final splitted = date.split('-');
    return splitted[2]+"-"+splitted[1]+"-"+splitted[0];


  }
}