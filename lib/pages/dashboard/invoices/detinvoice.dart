//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignmentfromdetails.dart';
import 'package:mijnzpc/models/minvoice.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/pages/dashboard/times/dettimesassignments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/services/invoiceservices.dart';
import 'package:mijnzpc/services/timesservices.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/all_translations.dart';
class Detinvoice extends StatefulWidget {


  Detinvoice(
      {@required this.data,this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor});

  final Minvoice data;
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
  _Detinvoice createState() => _Detinvoice();
}

class _Detinvoice extends State<Detinvoice> {

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
  String searchmsg="Searching";
  int monthid=-1;
  String monthname="All";

  int sortid=-1;
  String sortname="All";

  int startdateid=-1;
  String startdatename="All";

  int statusid=-1;
  String statusname="All";

  String department_nameinvoice="";

  @override
  void initState() {
    super.initState();
    _getrecords();

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
    return
      Scaffold(
        bottomSheet:Container(
        decoration:   BoxDecoration(
        color:widget.backgroundcolor,
    ),
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

    child:
        new  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[




              Expanded(
                flex: 15,
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
                                _launchURL();
                              },
                              child: Padding(
                                padding:EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child:Center(
                                  child: Text(allTranslations.text('Download') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
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

        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Invoice Nr: ')+invoicenumber(),style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),
        backgroundColor: widget.backgroundcolor,

        body: Container(
          // height: 450,

          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),

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
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Dettimesassignment(
                                      data: _recordsdata[index],
                                      backgroundcolor: widget.backgroundcolor,
                                      bottombarcolor: widget.bottombarcolor,
                                      color: widget.color,
                                      gradiantcolor:widget.gradiantcolor,
                                      cardcolor:widget.cardcolor,
                                      shadowcolor:widget.shadowcolor,
                                      appbarcolor: widget.appbarcolor,
                                      titlecolor:widget.titlecolor,
                                      textcolor:widget.textcolor,
                                    )));
                                    // Navigator.push(context,
                                    //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                    // );
                                  },
                                  child:
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child:Text(_recordsdata[index].title.toString(), style: TextStyle(
                                            color: Colors.grey[700],
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 17.0,
                                          ),),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child: Text(_recordsdata[index].company_name, style: TextStyle(
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
                                                  child: Text( eurodate(_recordsdata[index].start_date.toString()),
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





                                      ListTile(
                                        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                        dense:true,
                                        contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                        title: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Wrap(
                                              crossAxisAlignment: WrapCrossAlignment.center,
                                              children: [
                                                Icon(Icons.access_time,color: widget.color,),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                  child:Text(gettoz(_recordsdata[index].maintime_from) +"-"+gettoz(_recordsdata[index].maintime_to),style: TextStyle(
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
  List<Massignmentfromdetails> _recordsdata = [];
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
    var response = await classgetservicesinvoice.actiongetassignmentbyinvoiceid(widget.data.id);
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
        setState(() {
          department_nameinvoice=responseBody['department_name'].toString();
        });
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
    print('ggdgdgdgddgdg');
    print(id);
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

  _launchURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    final payUrl = 'https://mijnzpc.com/api/v1/exportInvoice?token='+token+'&beforeinvoice_id='+widget.data.id.toString()+'&year='+widget.data.year.toString()+'&month='+widget.data.month.toString();
    print(payUrl);
    var urllaunchable = await canLaunch(payUrl); //canLaunch is from url_launcher package
    if(urllaunchable){
      await launch(payUrl); //launch is from url_launcher package to launch URL
    }else{
      print("URL can't be launched.");
    }

  }

geturl() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('user.api_token');
  return 'http://localhost:8000/api/v1/exportInvoice?token='+token+'&beforeinvoice_id='+widget.data.id.toString()+'&year='+widget.data.year.toString()+'&month='+widget.data.month.toString();
}

  invoicenumber()
  {
    if(widget.data.invoicenumber==null)
      {
        return widget.data.id.toString();
      }
    else{
      return widget.data.invoicenumber.toString();
    }
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


  eurodate(String date)
  {

    final splitted = date.split('-');
    return splitted[2]+"-"+splitted[1]+"-"+splitted[0];


  }

}