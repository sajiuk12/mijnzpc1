//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/msuggestion.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/dashboard/openassignments/openassignment.dart';
import 'package:mijnzpc/pages/dashboard/openassignments/openassignment.dart';
import 'package:mijnzpc/services/adminservices.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Suggestions extends StatefulWidget {
  Suggestions(
      {@required this.assignment_id,this.backgroundcolor,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,this.gradiantcolor
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
  Color gradiantcolor;
  int assignment_id;

  @override
  SuggestionsState createState() => SuggestionsState();
}

class SuggestionsState extends State<Suggestions> {

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
            color: Colors.grey, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Suggestions'),style: TextStyle(color: Colors.grey),),),
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
                  child:
                  new ListView.builder(

                    // padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
                    // itemExtent: 95.0,
                      controller: _listScrollController,
//              padding: const EdgeInsets.only(top: 0),
                      itemCount: _recordsdata.length,
                      itemBuilder: (BuildContext context , int index)
                      {

                        return  Padding(
                          padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 10),
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
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  SizedBox(
                                    width: 230,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: _recordsdata[index].first_name.toString()+' '+_recordsdata[index].last_name.toString(),
                                              style: TextStyle(
                                                  // fontWeight: FontWeight.w700, // light
                                                  color: Colors.grey,
                                                  fontSize: 15.0),
                                               ),
                                        ),

                                        RichText(
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: _recordsdata[index].company_name.toString(),
                                              style: TextStyle(
                                                  // fontWeight: FontWeight.w700, // light
                                                  color: Colors.grey,
                                                  fontSize: 13.0),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                      width: 80,
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
                                                minimumSize: Size.zero, // Set this
                                                padding: EdgeInsets.zero,
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
                                                                content: new Text(allTranslations.text('Select feelancer?'),style: TextStyle(color: Colors.grey)),
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

                                                                        String url ='https://mijnzpc.com/api/v1/setfreetoass?token='+token+'&id='+_recordsdata[index].id.toString();
                                                                        print(url);
                                                                        final response = await http.get(Uri.parse(url),);
                                                                        if(response.statusCode == 200) {

                                                                          var responseBody = json.decode(response.body);
                                                                          Navigator.pop(context);
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
                                                                                              Navigator.push(
                                                                                                context,
                                                                                                MaterialPageRoute(builder: (context) => Openassignment(
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
                                                  top: 10,
                                                  bottom: 10,
                                                ),
                                                child:Center(
                                                  child: Text(allTranslations.text('Select') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 11)),
                                                ),
                                              )
                                          )
                                      )

                                  ),





                                ],
                              )
                          ),

                        );


                         ;




                         Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              SizedBox(
                                width: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: TextSpan(
                                          text: 'Name: ',
                                          style: TextStyle(
                                              color: Colors.blueGrey.shade800,
                                              fontSize: 16.0),
                                          children: [
                                            TextSpan(
                                                text:
                                                '${_recordsdata[index].id.toString()}\n',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ]),
                                    ),
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                          text: 'Unit: ',
                                          style: TextStyle(
                                              color: Colors.blueGrey.shade800,
                                              fontSize: 16.0),
                                          children: [
                                            TextSpan(
                                                text:
                                                '${_recordsdata[index].id.toString()}\n',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ]),
                                    ),
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                          text: 'Price: ' r"$",
                                          style: TextStyle(
                                              color: Colors.blueGrey.shade800,
                                              fontSize: 16.0),
                                          children: [
                                            TextSpan(
                                                text:
                                                '${_recordsdata[index].id.toString()}\n',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey.shade900),
                                  onPressed: () {

                                  },
                                  child: const Text('Add to Cart')),
                            ],
                          ) ;



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
  List<Msuggestion> _recordsdata = [];
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
    var response = await classgadminservices.actiongetsuggestions(widget.assignment_id);
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




}