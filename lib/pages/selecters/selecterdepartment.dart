//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/filters/mfilterdepartment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/services/assignmentservices.dart';
import 'package:mijnzpc/pages/filters/filterclient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/services/filterservices.dart';
import 'package:mijnzpc/all_translations.dart';
class Selecterdepartment extends StatefulWidget {
  String idfromfirstpage;
  String clientidfromfirstpage;
  String registerasfromfirstpage;


  Selecterdepartment(
      {@required this.idfromfirstpage,this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,this.clientidfromfirstpage,this.registerasfromfirstpage});


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
  _SelecterdepartmentState createState() => _SelecterdepartmentState();
}

class _SelecterdepartmentState extends State<Selecterdepartment> {

  String searchmsg="Searching";
  // this allows us to access the TextField text
  TextEditingController textFieldController = new TextEditingController();

  String id="All";
  String showname="";
  @override
  void initState() {
    id = widget.idfromfirstpage;

    _getrecords();
    // getclientname();


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
                  setState((){
                    id="All";
                  });
                  Navigator.pop(context);
                }
            ),
            title: Text(
            allTranslations.text("Select Department"),
              style: TextStyle(color: Colors.grey, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0
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
                  labelText: allTranslations.text('Title'),
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


                          child: new GestureDetector(
                                onTap: () {

                                  setState((){
                                    id=_recordsdata[index].id.toString();
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
                                child:new Column(

                                  children: <Widget>[

                                Container(
                                  margin: const EdgeInsets.only(top: 10.0),
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
                                        child:new Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                        Padding(
                                        padding: EdgeInsets.only(top:20,left: 10,right: 10,bottom: 20),
                                    child:Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text(
                                                    _recordsdata[index].title,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14.0,
                                                    ),
                                              ),

                                    ),
                                        ),




                          ]
                        ),
                                      ),
],
                                ),


                              ),
                              // Divider(
                              //     color: Colors.amberAccent[400]
                              // ),

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
  List<Mfilterdepartment> _recordsdata = [];
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
    var response = await classfilterservices.actiongetdepartmentfiltersbyclientselecter(showname,widget.clientidfromfirstpage.toString(),widget.registerasfromfirstpage.toString());
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

  // getclientname() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('user.api_token');
  //   String url = 'https://mijnzpc.com/api/v1/departmentinfo?token=' + token + '&id=' + id;
  //   final response = await http.get(Uri.parse(url),);
  //   if (response.statusCode == 200) {
  //     var responseBody = json.decode(response.body)['data'];
  //     if(responseBody['department'].toList().length > 0)
  //     {
  //       setState(() {
  //          showname = responseBody['department'][0]['title'];
  //          textFieldController.text = showname;
  //       });
  //     }
  //   }
  //   _recordsdata.clear();
  //   _getrecords();
  //
  // }

  void _sendDataBack(BuildContext context) {
    Navigator.pop(context, id);
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