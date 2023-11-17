//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/models/mstrommetr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/pages/filters/filterdepartment.dart';
import 'package:mijnzpc/pages/filters/filteremployee.dart';
import 'package:mijnzpc/pages/filters/filterjobtitle.dart';
import 'package:mijnzpc/pages/filters/filtermonth.dart';
import 'package:mijnzpc/pages/filters/filtersort.dart';
import 'package:mijnzpc/pages/filters/filterstartdate.dart';
import 'package:mijnzpc/pages/filters/filterstatusass.dart';
import 'package:mijnzpc/pages/filters/filteryear.dart';
import 'package:mijnzpc/services/assignmentservices.dart';
import 'package:mijnzpc/pages/filters/filterclient.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/translations.dart';
import 'package:mijnzpc/all_translations.dart';


class Assignment extends StatefulWidget {


  Assignment(
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
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {



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

  bool userpermission = false;

  bool checkadmin = false;
  bool checkemployee = false;

String searchmsg="Searching";
  @override
  void initState() {
    super.initState();
    setmonth();
    _getrecords();
    checkpermission();
    checkadmins();
    checkfreelancer();
    _listScrollController.addListener(() {

      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;
      if(maxScroll - currentScroll <= 200) {
        if(! _isLoading) {

          _getrecords(page : _currentPage + 1);
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return
     Scaffold(
       backgroundColor: widget.backgroundcolor,
       body:

       Container(


         padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [



           SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child:

           Padding(
             padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
             child:
           Row(
               children: <Widget>[





                  SizedBox(
                   width: 5.0,
                 ) ,
               Padding(
                   padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                   child:  SizedBox(
                       height: 40,
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
                               borderRadius: BorderRadius.circular(5),
                               boxShadow: <BoxShadow>[
                                 BoxShadow(
                                     offset: Offset(0.0, 3.75),
                                     color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                     blurRadius: 3) //blur radius of shadow
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
                                 _getfilterjobtitle(context);
                               },
                               child: Padding(
                                 padding:EdgeInsets.only(
                                   top: 5,
                                   bottom: 5,
                                 ),
                                 child:Center(
                                   child: Text(allTranslations.text('Job Title : ')+allTranslations.text(jobtitlename)),
                                 ),
                               )
                           )
                       )
                   ),
                 ) ,
               SizedBox(
                   width: 5.0,
                 ) ,

                 SizedBox(
                   width: 5.0,
                 ),
                  SizedBox(
                     height: 40,
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
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: <BoxShadow>[
                               BoxShadow(
                                   offset: Offset(0.0, 3.75),
                                   color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                   blurRadius: 3) //blur radius of shadow
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
                               _getfilterclient(context);
                             },
                             child: Padding(
                               padding:EdgeInsets.only(
                                 top: 5,
                                 bottom: 5,
                               ),
                               child:Center(
                                 child: Text(allTranslations.text('Client : ')+allTranslations.text(clientname)),
                               ),
                             )
                         )
                     )
                 ),
                 SizedBox(
                   width: 5.0,
                 ),


                 SizedBox(
                   width: 5.0,
                 ),
                 SizedBox(
                     height: 40,
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
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: <BoxShadow>[
                               BoxShadow(
                                   offset: Offset(0.0, 3.75),
                                   color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                   blurRadius: 3) //blur radius of shadow
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
                               _getfilterdepartment(context);
                             },
                             child: Padding(
                               padding:EdgeInsets.only(
                                 top: 5,
                                 bottom: 5,
                               ),
                               child:Center(
                                 child: Text(allTranslations.text('Department : ')+allTranslations.text(departmentname)),
                               ),
                             )
                         )
                     )
                 ),
                 SizedBox(
                   width: 5.0,
                 ),


                 userpermission ? SizedBox(
                   width: 5.0,
                 ): new Container(),
                 userpermission ?   Padding(
                   padding: EdgeInsets.only(top:5,left: 5,right: 0,bottom: 5),
                   child:  SizedBox(
                       height: 40,
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
                               borderRadius: BorderRadius.circular(5),
                               boxShadow: <BoxShadow>[
                                 BoxShadow(
                                     offset: Offset(0.0, 3.75),
                                     color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                     blurRadius: 3) //blur radius of shadow
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
                                 _getfilteremployee(context);
                               },
                               child: Padding(
                                 padding:EdgeInsets.only(
                                   top: 5,
                                   bottom: 5,
                                 ),
                                 child:Center(
                                   child: Text(allTranslations.text('Employee : ')+allTranslations.text(employeename)),
                                 ),
                               )
                           )
                       )
                   ),
                 ):new Container(),
                 userpermission ? SizedBox(
                   width: 5.0,
                 ): new Container(),




                 SizedBox(
                   width: 5.0,
                 ),
                 SizedBox(
                     height: 40,
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
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: <BoxShadow>[
                               BoxShadow(
                                   offset: Offset(0.0, 3.75),
                                   color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                   blurRadius: 3) //blur radius of shadow
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
                               _getfilterstatus(context);
                             },
                             child: Padding(
                               padding:EdgeInsets.only(
                                 top: 5,
                                 bottom: 5,
                               ),
                               child:Center(
                                 child: Text(allTranslations.text('Status : ')+allTranslations.text(statusname)),
                               ),
                             )
                         )
                     )
                 ),
                 SizedBox(
                   width: 5.0,
                 ),



                 SizedBox(
                   width: 5.0,
                 ),
                 SizedBox(
                     height: 40,
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
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: <BoxShadow>[
                               BoxShadow(
                                   offset: Offset(0.0, 3.75),
                                   color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                   blurRadius: 3) //blur radius of shadow
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
                               _getfiltermonth(context);
                             },
                             child: Padding(
                               padding:EdgeInsets.only(
                                 top: 5,
                                 bottom: 5,
                               ),
                               child:Center(
                                 child: Text(allTranslations.text('Month : ')+allTranslations.text(monthname)),
                               ),
                             )
                         )
                     )
                 ),
                 SizedBox(
                   width: 5.0,
                 ),




                 SizedBox(
                   width: 5.0,
                 ),
                 SizedBox(
                     height: 40,
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
                             borderRadius: BorderRadius.circular(5),
                             boxShadow: <BoxShadow>[
                               BoxShadow(
                                   offset: Offset(0.0, 3.75),
                                   color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                   blurRadius: 3) //blur radius of shadow
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
                               _getfilteryear(context);
                             },
                             child: Padding(
                               padding:EdgeInsets.only(
                                 top: 5,
                                 bottom: 5,
                               ),
                               child:Center(
                                 child: Text(allTranslations.text('Year : ')+allTranslations.text(yearname)),
                               ),
                             )
                         )
                     )
                 ),

                 SizedBox(
                   width: 5.0,
                 ),





                 // SizedBox(
                 //   width: 5.0,
                 // ),
                 // ElevatedButton(
                 //   style: ElevatedButton.styleFrom(
                 //     elevation: 4,
                 //     shadowColor: Colors.grey,
                 //     primary: widget.color,
                 //   ),
                 //   onPressed: (){
                 //     _getfilterstartdate(context);
                 //   },
                 //   child: Text(allTranslations.text('Start Date : ')+allTranslations.text(startdatename)),
                 // ),
                 // SizedBox(
                 //   width: 5.0,
                 // ),

                 //
                 // SizedBox(
                 //   width: 5.0,
                 // ),
                 // ElevatedButton(
                 //   style: ElevatedButton.styleFrom(
                 //     elevation: 4,
                 //     shadowColor: Colors.grey,
                 //     primary: widget.color,
                 //   ),
                 //   onPressed: (){
                 //     _getfiltersort(context);
                 //   },
                 //   child: Text(allTranslations.text('Sort : ')+allTranslations.text(sortname)),
                 // ),
                 // SizedBox(
                 //   width: 5.0,
                 // ),



               ]

           ),
           ),
           ),


             Expanded(
               child: _recordsdata.length == 0 ? listIsEmpty() : new
               RefreshIndicator(
                 onRefresh: _pullRefresh,
                 child: new ListView.builder(
                   // padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
                   // itemExtent: 95.0,
                     controller: _listScrollController,
//              padding: const EdgeInsets.only(top: 0),
                     itemCount: _recordsdata.length,
                     itemBuilder: (BuildContext context , int index)
                     {

                       return  GestureDetector(
                         onTap: () {
                           Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                             data: _recordsdata[index],
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
                           // Navigator.push(context,
                           //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                           // );
                         },
                         child:

                         Padding(
                           padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 2),
                       child: Container(
                       decoration: BoxDecoration(
                       color: widget.cardcolor,
                       borderRadius: BorderRadius.circular(0),
                       boxShadow: <BoxShadow>[
                       BoxShadow(
                       offset: Offset(0.0, 3.75),
                       color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                       blurRadius: 5) //blur radius of shadow
                       ]
                       ),
                       padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                       child:   new Column(
                         children: <Widget>[

                             Column(
                               mainAxisSize: MainAxisSize.min,
                               children: <Widget>[


                                 ListTile(
                                   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                   dense:true,
                                   contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                   title: Align(
                                     alignment: Alignment.centerLeft,
                                     child: Padding(
                                       padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                       child:Text(_recordsdata[index].title.toString(),style: TextStyle(
                                         color: Colors.grey[700],
                                         // fontWeight: FontWeight.w700,
                                         fontSize: 17.0,
                                       ),),
                                     ),
                                   ),
                                   trailing:FutureBuilder<String>(
                                     future: canshow(_recordsdata[index].status.toString()),
                                     builder: (context, snapshot) {
                                       if (snapshot.hasData) return Text(allTranslations.text(snapshot.data),style: TextStyle(
                                         color: Colors.grey,
                                         // fontWeight: FontWeight.w700,
                                         fontSize: 12.0,
                                       ),);
                                       else if (snapshot.hasError) return Text(snapshot.error);
                                       return Text("");
                                     },
                                   ),
                                 ),




                                 Align(
                                   alignment: Alignment.centerLeft,
                                   child: Padding(
                                     padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                     child: Text(_recordsdata[index].company_name.toString(), style: TextStyle(
                                       color: Colors.grey,
                                       // fontWeight: FontWeight.w700,
                                       fontSize: 12.0,
                                     ),),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 5.0,
                                 ),
                                 Align(
                                   alignment: Alignment.centerLeft,
                                   child: Padding(
                                     padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                     child:  Wrap(
                                       crossAxisAlignment: WrapCrossAlignment.center,
                                       children: [
                                         Icon(Icons.calendar_today,color: widget.color,),
                                         Padding(
                                             padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                             child: Text(eurodate(_recordsdata[index].start_date).toString(),
                                               style: TextStyle(
                                                 color: Colors.grey,
                                                 // fontWeight: FontWeight.w700,
                                                 fontSize: 14.0,
                                               ),
                                             ),
                                         ),
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
                                           Icon(Icons.access_time,color: widget.color,),
                                           Padding(
                                             padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                             child:Text(allTranslations.text(gettoz(_recordsdata[index].maintime_from) +"-"+gettoz(_recordsdata[index].maintime_to)),style: TextStyle(
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
                                     //fontWeight: FontWeight.w700,
                                     fontSize: 20.0,
                                     fontFamily: 'Montserrat-Bold',
                                   ),),
                                 ),

                                 checkadmin ? ListTile(
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
                                           checkadmin ? Icon(Icons.person,color: widget.color,): new Container(),
                                           checkadmin ? Padding(
                                             padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                             child:Text(_recordsdata[index].emfirstname.toString()+" "+_recordsdata[index].emlastname.toString(),style: TextStyle(
                                               color: Colors.grey,
                                               // fontWeight: FontWeight.w700,
                                               fontSize: 14.0,
                                             ),),
                                           ): new Container(),
                                         ],
                                       ),

                                     ),
                                   ),
                                   trailing: Text(
                                     allTranslations.text(allTranslations.text(_recordsdata[index].status.toString())),
                                     style: TextStyle(
                                       color: Colors.grey,
                                       // fontWeight: FontWeight.w700,
                                       fontSize: 12.0,
                                     ),
                                   ),
                                 ): new Container(),






                               ],
                             ),

                           // Divider(
                           //     color: Colors.amberAccent[400]
                           // ),
                         ],
                       ),

                       ),
                       ), );




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
     );
  }



  //  all needs variable
  List<Massignment> _recordsdata = [];
  int _currentPage = 1;
  bool _viewStream = true;
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  //  all needs variable

  //if user pull to refresh page
  Future<Null> _pullRefresh() async {
    await _getrecords(refresh: true);
    return null;
  }
//if user pull to refresh page


  setmonth(){

    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year}";
    String todayy=today.month.toString();

    if(today.month<10)
      {
          todayy="0"+today.month.toString();
      }
      else
      {
          todayy=today.month.toString();
      }




    setState(() {
    monthname=todayy;
    yearname=today.year.toString();
    });

  }


  //  getting data from model
  _getrecords({ int page : 1 , bool refresh : false}) async
  {

    setState(() {
      _isLoading = true;
    });
    var response = await classgetservicesassignment.actiongetassignment(page,sortname,jobtitlename,clientid,departmentid,employeeid,statusname,yearname,monthname,startdatename);
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



  void _getfilterclient(BuildContext context) async {
     final result = await  Navigator.of(context).push(
         MaterialPageRoute(builder:(context)=>Filterclient(clientidfromfirstpage:clientid.toString(),          backgroundcolor: widget.backgroundcolor,
           color: widget.color,
           gradiantcolor:widget.gradiantcolor,
           cardcolor:widget.cardcolor,
           shadowcolor:widget.shadowcolor,
           appbarcolor: widget.appbarcolor,
           titlecolor:widget.titlecolor,
           textcolor:widget.textcolor,
           bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
        {
          clientid = int.parse(result);
          _recordsdata.clear();
          _getrecords();
        }
      else
        {
          clientid=-1;
          clientname="All";
          _recordsdata.clear();
          _getrecords();
        }
    });
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String token = prefs.getString('user.api_token');
     String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+clientid.toString();
     final response = await http.get(Uri.parse(url),);
     if(response.statusCode == 200) {
       var responseBody = json.decode(response.body)['data'];
       if(responseBody['profile'].toList().length > 0)
       {
         setState(() {
           clientname= responseBody['profile'][0]['company_name'];
         });
       }

     }
  }
  void _getfilteremployee(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filteremployee(idfromfirstpage:employeeid.toString(),   backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
        employeeid = int.parse(result);
      }
      else
      {
        employeeid=-1;
        employeename="All";
        _recordsdata.clear();
        _getrecords();
      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employeeid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          employeename= responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
        });
        _recordsdata.clear();
        _getrecords();
      }

    }
  }
  void _getfilterdepartment(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterdepartment(idfromfirstpage:departmentid.toString(),   backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
      setState(() {
      if(result!=null)
      {
        departmentid = int.parse(result);
      }
      else
      {
        departmentid=-1;
        departmentname="All";
        _recordsdata.clear();
        _getrecords();
      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/departmentinfo?token='+token+'&id='+departmentid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['department'].toList().length > 0)
      {
        setState(() {
          departmentname= responseBody['department'][0]['title'];
        });
        _recordsdata.clear();
        _getrecords();
      }

    }
  }

  void _getfilteryear(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filteryear(idfromfirstpage:yearid.toString(),   backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
       // yearid = result;
        yearname=result;
              setState(() {
               yearname= result;
             });
      }
      else
      {
        yearid=-1;
        yearname="All";

      }
    });

    _recordsdata.clear();
    _getrecords();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('user.api_token');
    // String url ='https://mijnzpc.com/api/v1/yearinfo?token='+token+'&id='+yearid;
    // final response = await http.get(Uri.parse(url),);
    // if(response.statusCode == 200) {
    //   var responseBody = json.decode(response.body)['data'];
    //   if(responseBody['year'].toList().length > 0)
    //   {
    //     setState(() {
    //       yearname= responseBody['year'][0]['title'];
    //     });
    //   }

    // }
  }
  void _getfiltermonth(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filtermonth(idfromfirstpage:monthid.toString(),   backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
       // monthid = result;
        monthname=result;
        setState(() {
          monthname= result;
        });
      }
      else
      {
        monthid=-1;
        monthname="All";

      }
    });

    _recordsdata.clear();
    _getrecords();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('user.api_token');
    // String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+monthid;
    // final response = await http.get(Uri.parse(url),);
    // if(response.statusCode == 200) {
    //   var responseBody = json.decode(response.body)['data'];
    //   if(responseBody['profile'].toList().length > 0)
    //   {
    //     setState(() {
    //       monthname= responseBody['profile'][0]['company_name'];
    //     });
    //   }
    //
    // }
  }
  void _getfilterjobtitle(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterjobtitle(idfromfirstpage:jobtitleid.toString(),backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
        jobtitleid = int.parse(result);
      }
      else
      {
        jobtitleid=-1;
        jobtitlename="All";
        _recordsdata.clear();
        _getrecords();
      }
    });
    print('trtrtr');
    print(jobtitlename);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/jobtitleinfo?token='+token+'&id='+jobtitleid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['jobtitle'].toList().length > 0)
      {
        setState(() {
          jobtitlename= responseBody['jobtitle'][0]['title'];
        });

        _recordsdata.clear();
        _getrecords();
      }

    }


  }
  void _getfilterstatus(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterstatusass(clientidfromfirstpage:statusid.toString(),filterpage:"assignment",   backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
        statusid = int.parse(result);

      }
      else
      {
        statusid=-1;
        statusname="All";
        _recordsdata.clear();
        _getrecords();
      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/statusassinfo?token='+token+'&id='+statusid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['statusass'].toList().length > 0)
      {
        setState(() {
          statusname= responseBody['statusass'][0]['title'];
        });
        _recordsdata.clear();
        _getrecords();
      }

    }
  }


  gettotalearningss(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);

    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      print(responseBody);
      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['assignment'][0]['totalpayrate'];
      }
      else
      {
        return '0';
      }

    }
    else
      {
        return '0';
      }

  }



  Future<String> gettotalearnings(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

     //print(responseBody['totalpayrate']);
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


  Future<String> getemployeename(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      //print(responseBody['totalpayrate']);
      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['employee_name'].toString();
      }
      else
      {
        return '0';
      }

    }

  }




  Future<String> getclientname(String id) async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      //print(responseBody['totalpayrate']);
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
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      //print(responseBody['totalpayrate']);
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
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      //print(responseBody['totalpayrate']);
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


  checkpermission() async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    if(type=='ADMIN')
    {
      setState(() {
        userpermission = true;
      });
    }


  }

  checkadmins()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    print('saaaa');
    print(type);
    if(type=='ADMIN')
    {
      setState(() {
        checkadmin = true;
      });
    }


  }

  checkfreelancer()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');

    if(type=='EMPLOYEE')
    {
      setState(() {
        checkemployee = true;
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


  Future<String> canshow(String status) async {
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');

    if(type=='EMPLOYEE')
    {
       return status;
    }
    else
      {
        return "";
      }
  }


}