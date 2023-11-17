//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignmentfromdetails.dart';
import 'package:mijnzpc/models/mtimes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/pages/dashboard/times/dettimesassignments.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/services/timesservices.dart';
class Dettimes3 extends StatefulWidget {


  Dettimes3(
      {@required this.data,this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor});

  final Mtimes data;
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
  _Dettimes3 createState() => _Dettimes3();
}

class _Dettimes3 extends State<Dettimes3> {

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


  String depatment_nametimes="";

  bool sendtimes=false;
  bool sendinvoice=false;

  int sendtimesflex=1;
  int sendinvoiceflex=1;


  bool showrejcom=false;

  String searchmsg="searching";



  @override
  void initState() {
    super.initState();
    _getrecords();
    checksendtimes();
    checksendinvoice();
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

        bottomSheet: Container(
          decoration:   BoxDecoration(
            color:widget.backgroundcolor,
          ),
          child:  new  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[


                Expanded(
                  flex: 30,
                  child:  Padding(
                    padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                    child:  SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child:   showrejcom ?   DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff630909),
                                      Color(0xffEB0E0E),
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

                                onPressed: () async {



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
                                                  content: new Text(allTranslations.text('Times will be rejected. Proceed?'),style: TextStyle(color: Colors.grey)),
                                                  actions: <Widget>[
                                                    new FlatButton(
                                                        onPressed: () => Navigator.of(context).pop(false),
                                                        child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                                    ),
                                                    new FlatButton(
                                                        onPressed: () async {


                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                          String token = prefs.getString('user.api_token');
                                                          String type = prefs.getString('user.type');

                                                          String url ='https://mijnzpc.com/api/v1/rejcomtimes?clientrejectforemployee='+widget.data.id.toString()+'&token='+token;
                                                          print(url);
                                                          final response = await http.get(Uri.parse(url),);
                                                          if(response.statusCode == 200) {

                                                            var responseBody = json.decode(response.body);
                                                            setState(() {
                                                              showrejcom=false;
                                                            });
                                                            return showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                  return new Directionality(
                                                                      textDirection: TextDirection.ltr,
                                                                      child: new AlertDialog(
                                                                        backgroundColor: widget.backgroundcolor,
                                                                        title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                                        content: new Text(allTranslations.text(responseBody['msg']),style: TextStyle(color: Colors.grey)),
                                                                        actions: <Widget>[

                                                                          new FlatButton(
                                                                              onPressed: () {
                                                                                // exit(0);
                                                                                Navigator.of(context).pop();
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



                                                        },
                                                        child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                                    ),
                                                  ],
                                                )
                                            )
                                        );
                                      }
                                  ) ?? false;




                                },
                                child: Padding(
                                  padding:EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child:Center(
                                    child: Text(allTranslations.text('Reject Times') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                  ),
                                )
                            )
                        ) : new Container()

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
                        height: 45,
                        child:   showrejcom ? DecoratedBox(
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

                                onPressed: () async {



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
                                                  content: new Text(allTranslations.text('By approving this timesheet you confirm the assignments on it. Proceed?'),style: TextStyle(color: Colors.grey)),
                                                  actions: <Widget>[
                                                    new FlatButton(
                                                        onPressed: () => Navigator.of(context).pop(false),
                                                        child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                                    ),
                                                    new FlatButton(
                                                        onPressed: () async {


                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                          String token = prefs.getString('user.api_token');
                                                          String type = prefs.getString('user.type');

                                                          String url ='https://mijnzpc.com/api/v1/rejcomtimes?clientconfirm='+widget.data.id.toString()+'&token='+token;
                                                          print(url);
                                                          final response = await http.get(Uri.parse(url),);
                                                          if(response.statusCode == 200) {

                                                            var responseBody = json.decode(response.body);
                                                            setState(() {
                                                              showrejcom=false;
                                                            });
                                                            return showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                  return new Directionality(
                                                                      textDirection: TextDirection.ltr,
                                                                      child: new AlertDialog(
                                                                        backgroundColor: widget.backgroundcolor,
                                                                        title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                                        content: new Text(allTranslations.text(responseBody['msg']),style: TextStyle(color: Colors.grey)),
                                                                        actions: <Widget>[

                                                                          new FlatButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
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



                                                        },
                                                        child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                                    ),
                                                  ],
                                                )
                                            )
                                        );
                                      }
                                  ) ?? false;











                                },
                                child: Padding(
                                  padding:EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child:Center(
                                    child: Text(allTranslations.text('Confirm Times') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                  ),
                                )
                            )
                        ): new Container()

                    ),


                  ),
                ) ,






              ]
          ) ,

        ),

        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Times Assignment Nr : ')+widget.data.id.toString(),style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),
        backgroundColor: widget.backgroundcolor,
        body: Container(

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
                                      times_status:widget.data.status,
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
                                  child:   Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                        dense:true,
                                        contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                        title:     Align(
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
                                        trailing: Text(
                                          allTranslations.text( gettoz(justclientcancel(_recordsdata[index].times_status))),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 12.0,
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
                                                  child:Text(gettoz(_recordsdata[index].maintime_from) +"-"+gettoz(_recordsdata[index].maintime_to),style: TextStyle(
                                                    color: Colors.grey,
                                                    // fontWeight: FontWeight.w700,
                                                    fontSize: 14.0,
                                                  ),),),
                                              ],
                                            ),

                                          ),
                                        ),
                                        trailing:Text("€ "+gettoz(_recordsdata[index].totalpayrate),style: TextStyle(
                                          color: widget.color,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0,
                                          fontFamily: 'Montserrat-Bold',
                                        ),),
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
    var response = await classgetservicestimes.actiongetassignmentbytimesid(widget.data.id);
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
          depatment_nametimes=responseBody['department_name'].toString();
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


  checksendtimes()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String type = prefs.getString('user.type');




    if (type=="ADMIN")
    {
      showrejcom=true;
    }

    if(widget.data.status=='PENDING'){
      if (type=='EMPLOYEE' || type=="ADMIN")
      {

        setState(() {
          sendtimes=true;
          sendtimesflex=15;
        });

      }

    }
  }

  checksendinvoice()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String type = prefs.getString('user.type');

    if(widget.data.status!='INVOICE_SENT'){

      if (widget.data.status=="CONFIRMED" || widget.data.status=="PAID")
      {
        print(widget.data.status);
        if (type=="EMPLOYEE" || type=="ADMIN")
        {
          if(widget.data.invoicenumber==null)
          {

            sendinvoice=true;
            sendinvoiceflex=15;
          }
        }
      }




    }
  }


  justclientcancel(String status)
  {
    if(status=='CLIENT_CANCELED')
    {
      return 'CLIENT_CANCELED';
    }
    else
    {
      return '';
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