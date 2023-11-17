//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/filters/mfilteryear.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/services/assignmentservices.dart';
import 'package:mijnzpc/pages/filters/filterclient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/services/filterservices.dart';
import 'package:mijnzpc/all_translations.dart';
class Filteryear extends StatefulWidget {
  String idfromfirstpage;


  Filteryear(
      {@required this.idfromfirstpage,this.backgroundcolor,
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Filteryear> {

  String searchmsg="Searching";
  // this allows us to access the TextField text
  TextEditingController textFieldController = new TextEditingController();

  String id="All";
  String showname="";
  @override
  void initState() {




    // if(widget.idfromfirstpage!='All')
    //   {
    //     showname = widget.idfromfirstpage;
    //     textFieldController.text=showname;
    //   }


    _recordsdata.clear();
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
        appBar: AppBar(
            backgroundColor: widget.bottombarcolor,
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: (){
                  print('closed');

                  setState((){
                    id="All";
                  });
                  Navigator.pop(context);
                }
            ),
            title: Text(
            allTranslations.text("Select Year"),
              style: TextStyle(color: Colors.grey, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0
        ),
        bottomSheet: new  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: SizedBox(
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

                          onPressed: () async {
                            setState((){
                              showname="All";
                            });
                            _sendDataBack(context);
                          },
                          child: Padding(
                            padding:EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child:Center(
                              child: Text(allTranslations.text('All') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                            ),
                          )
                      )
                  ) ,

                ),

              ),
            ]
        ),
        backgroundColor: widget.backgroundcolor,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              TextField(
                style: TextStyle(color: Colors.grey), //<-- SEE HERE
                controller: textFieldController,
              onChanged: (String value) async {

                setState(() {
                  _recordsdata.clear();
                  showname=value;
                  _getrecords();
                });



              },
                decoration: InputDecoration(
                  labelText: allTranslations.text('Year'),
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                ),
              ),

              // RaisedButton(
              //   child: Text(
              //     'Send text back',
              //     style: TextStyle(fontSize: 24),
              //   ),
              //   onPressed: () {
              //     _sendDataBack(context);
              //   },
              // ),




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
                        return new Directionality(
                          textDirection: TextDirection.ltr,


                          child:new Column(

                            children: <Widget>[

                              new GestureDetector(
                                onTap: () {

                                  setState((){
                                    showname=_recordsdata[index].title.toString();
                                  });
                                //  String textToSendBack = _recordsdata[index].client_id.toString();
                               //   Navigator.pop(context, textToSendBack);

                                  //Navigator.pop(context, _recordsdata[index].client_id.toString(),);
//print(client);

                                  _sendDataBack(context);
                                  //_sendDataBack(context, _recordsdata[index].client_id.toString(),);
                                  //_sendDataBack(context);
                                 //Navigator.pop(context, _recordsdata[index].client_id.toString(),);
                                  // Navigator.push(context,
                                  //     new MaterialPageRoute(builder: (context) => new Detmoshtarian(data: _recordsdata[index] ))
                                  //
                                  // );
                                },
                                child: Container(
                                  height: 60.0,
                                  child: ListView(
                                    padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      // SizedBox(
                                      //   width: 30.0,
                                      // ),
                                      Container(
                                        width: 350.0,
                                        // height: 140.0,
                                        decoration: BoxDecoration(
                                          color: widget.cardcolor,
                                          borderRadius: BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              color: Colors.black12,
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: <Widget>[

                                            Container(
                                              padding:
                                              EdgeInsets.only(top: 10.0, bottom: 10.0,left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    _recordsdata[index].title,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),




                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 30.0,
                                      // ),
                                    ],
                                  ),

                                ),
                              ),
                              // Divider(
                              //     color: Colors.amberAccent[400]
                              // ),
                            ],
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
  List<Mfilteryear> _recordsdata = [];
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

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
  }



  //  getting data from model
  _getrecords({ int page : 1 ,int daste : 9, bool refresh : false}) async
  {
    setState(() {
      _isLoading = true;
    });
    var response = await classfilterservices.actiongetyearfilters(showname);
    setState(() {
      _recordsdata.clear();
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

  getclientname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url = 'https://mijnzpc.com/api/v1/userinfo?token=' + token + '&id=' + id;
    final response = await http.get(Uri.parse(url),);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          showname = responseBody['profile'][0]['company_name'];
           textFieldController.text = showname;
        });
      }
    }
    _recordsdata.clear();
    _getrecords();

  }

  void _sendDataBack(BuildContext context) {
    print(showname);
    Navigator.pop(context, showname);
  }

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