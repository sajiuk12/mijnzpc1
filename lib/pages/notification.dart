//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/services/assignmentservices.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Notificss extends StatefulWidget {
  Notificss(
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
  _NotificssState createState() => _NotificssState();
}

class _NotificssState extends State<Notificss> {
  String searchmsg="Searching";
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

        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text('Notification',style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),
        backgroundColor: widget.backgroundcolor,

        body: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [




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
                                color: Colors.white,
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
                                          Text( "Apply Success",
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child: Text( "You accepted the shift",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w700,
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
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            children: [
                                              Icon(Icons.access_time,color: Color(0xff89B44B),),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                child: Text(  "07:30",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.0,
                                                  ),
                                                ),),
                                            ],
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