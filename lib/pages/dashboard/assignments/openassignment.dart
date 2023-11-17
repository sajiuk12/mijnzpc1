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
import 'package:mijnzpc/all_translations.dart';
class Openassignment extends StatefulWidget {

  Openassignment(
      {@required this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor
      });

  Color backgroundcolor;
  Color color;
  Color gradiantcolor;
  Color cardcolor;
  Color shadowcolor;
  Color appbarcolor;
  Color titlecolor;
  Color textcolor;


  @override
  _OpenassignmentState createState() => _OpenassignmentState();
}

class _OpenassignmentState extends State<Openassignment> {

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

  @override
  void initState() {
    super.initState();
    _getrecords();

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
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:


                Row(
                    children: <Widget>[




                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfilterjobtitle(context);
                        },
                        child: Text(allTranslations.text('Job Title : ')+jobtitlename),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),



                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfilterstartdate(context);
                        },
                        child: Text(allTranslations.text('Start Date : ')+startdatename),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfiltersort(context);
                        },
                        child: Text(allTranslations.text('Sort : ')+sortname),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfilterstatus(context);
                        },
                        child: Text(allTranslations.text('Status : ')+statusname),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfilterclient(context);
                        },
                        child: Text(allTranslations.text('Client : ')+clientname),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfilterdepartment(context);
                        },
                        child: Text(allTranslations.text('Department : ')+departmentname),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfilteremployee(context);
                        },
                        child: Text(allTranslations.text('Employee : ')+employeename),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfilteryear(context);
                        },
                        child: Text(allTranslations.text('Year : ')+yearname),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),


                      SizedBox(
                        width: 5.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: widget.color,
                        ),
                        onPressed: (){
                          _getfiltermonth(context);
                        },
                        child: Text(allTranslations.text('Month : ')+monthname),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),





                    ]

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

                        return  Padding(
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
                                new GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                    );
                                  },
                                  child:
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child:
                                          Text( allTranslations.text("Department : Test"),
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              //fontWeight: FontWeight.w700,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child: Text( allTranslations.text("Client Name"),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              //fontWeight: FontWeight.w700,
                                              fontSize: 15.0,
                                            ),
                                          ),
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
                                              Icon(Icons.calendar_today,color: widget.color,size: 5,),
                                              Padding(
                                                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                  child: Text( _recordsdata[index].start_date.toString(),
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                     // fontWeight: FontWeight.w700,
                                                      fontSize: 14.0,
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
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            children: [
                                              Icon(Icons.access_time,color: widget.color,),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                child: Text(  "07:30 - 12:45",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                   // fontWeight: FontWeight.w700,
                                                    fontSize: 14.0,
                                                  ),
                                                ),),
                                            ],
                                          ),
                                        ),
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

                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                  child:Text(   "",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      //fontWeight: FontWeight.w700,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),),
                                              ],
                                            ),










                                          ),
                                        ),
                                        trailing: Text(
                                          _recordsdata[index].status.toString() ,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            //fontWeight: FontWeight.w700,
                                            fontSize: 12.0,
                                          ),
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
      _currentPage = response["current_page"];
      _isLoading = false;
    });
  }
//  getting data from model

  Widget listIsEmpty() {
    return new Center(
      child: new Text(allTranslations.text('Searching'),style:TextStyle(color: Colors.grey,)),
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
        MaterialPageRoute(builder:(context)=>Filterclient(clientidfromfirstpage:clientid.toString())));
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
        MaterialPageRoute(builder:(context)=>Filteremployee(idfromfirstpage:employeeid.toString())));
    setState(() {
      if(result!=null)
      {
        employeeid = int.parse(result);
      }
      else
      {
        employeeid=-1;
        employeename="All";
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
      }

    }
  }
  void _getfilterdepartment(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterdepartment(idfromfirstpage:departmentid.toString())));
    setState(() {
      if(result!=null)
      {
        departmentid = int.parse(result);
      }
      else
      {
        departmentid=-1;
        departmentname="All";
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
      }

    }
  }
  void _getfiltersort(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filtersort(idfromfirstpage:sortid.toString())));
    setState(() {
      if(result!=null)
      {
        sortid = int.parse(result);
      }
      else
      {
        sortid=-1;
        sortname="All";
      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/sortinfo?token='+token+'&id='+sortid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['sort'].toList().length > 0)
      {
        setState(() {
          sortname= responseBody['sort'][0]['title'];
        });
      }

    }
  }
  void _getfilterstartdate(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterstartdate(idfromfirstpage:startdateid.toString())));
    setState(() {
      if(result!=null)
      {
        startdateid = result;
        setState(() {
          startdatename= result;
        });
      }
      else
      {
        startdateid=-1;
        startdatename="All";
      }
    });
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('user.api_token');
    // String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+startdateid;
    // final response = await http.get(Uri.parse(url),);
    // if(response.statusCode == 200) {
    //   var responseBody = json.decode(response.body)['data'];
    //   if(responseBody['profile'].toList().length > 0)
    //   {
    //     setState(() {
    //       startdatename= responseBody['profile'][0]['company_name'];
    //     });
    //   }
    //
    // }
  }
  void _getfilteryear(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filteryear(idfromfirstpage:yearid.toString())));
    setState(() {
      if(result!=null)
      {
        yearid = result;
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
        MaterialPageRoute(builder:(context)=>Filtermonth(idfromfirstpage:monthid.toString())));
    setState(() {
      if(result!=null)
      {
        monthid = result;
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
        MaterialPageRoute(builder:(context)=>Filterjobtitle(idfromfirstpage:jobtitleid.toString())));
    setState(() {
      if(result!=null)
      {
        jobtitleid = int.parse(result);
      }
      else
      {
        jobtitleid=-1;
        jobtitlename="All";
      }
    });
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
      }

    }
  }
  void _getfilterstatus(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterstatusass(clientidfromfirstpage:statusid.toString())));
    setState(() {
      if(result!=null)
      {
        statusid = int.parse(result);
      }
      else
      {
        statusid=-1;
        statusname="All";
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
      }

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


      if(responseBody['assignment'].toList().length > 0)
      {
        return responseBody['assignment'][0]['totalpayrate'];
      }
      else
      {
        return '0';
      }

    }

  }


}