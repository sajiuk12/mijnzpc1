//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/maddress.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/services/getservices.dart';
import 'package:mijnzpc/pages/filters/filterclient.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Addressforemployee extends StatefulWidget {
  String addressfromfirstpage;
  Addressforemployee(this.addressfromfirstpage);
  @override
  AddressforemployeeState createState() => AddressforemployeeState();
}

class AddressforemployeeState extends State<Addressforemployee> {


  // this allows us to access the TextField text
  TextEditingController textFieldController = new TextEditingController();

  String address="";
  String addressid="";

  @override
  void initState() {
    address = widget.addressfromfirstpage;

    textFieldController.text = widget.addressfromfirstpage;

    print(address);

    _getrecords();
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;
      if(maxScroll - currentScroll <= 200) {
        if(! _isLoading) {
          _getrecords(text:"");
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
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
            title: Text(
            allTranslations.text("Search Address"),
              style: TextStyle(color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0
        ),
        backgroundColor: Colors.white.withOpacity(0.90),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              TextField(
                controller: textFieldController,
                autofocus: true,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (String value) async {

                  setState(() {
                    address=value;
                  });
                  _recordsdata.clear();
                 _getrecords(text:value );


                },
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
                                    addressid=_recordsdata[index].place_id.toString();
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
                                  height: 145.0,
                                  child: ListView(
                                    padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      // SizedBox(
                                      //   width: 30.0,
                                      // ),
                                      Container(
                                        width: 360.0,
                                        // height: 140.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
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
                                              allTranslations.text("Address : ")+_recordsdata[index].address_line2.toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
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
  List<Maddress> _recordsdata = [];
  int _currentPage = 1;
  bool _viewStream = true;
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  //  all needs variable
  //if user pull to refresh page
  Future<Null> _pullRefresh() async {
    await _getrecords(text:"");
    return null;
  }
//if user pull to refresh page

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
  }




  //  getting data from model
  _getrecords({ String text : '' }) async
  {
    setState(() {
      _isLoading = true;
    });
print(text);
    var response = await classgetservices.actiongetaddress(text);
    setState(() {
      // if(refresh) _recordsdata.clear();
      _recordsdata.addAll(response['recordsdata']);
      _currentPage = response["current_page"];
      _isLoading = false;
    });
  }
//  getting data from model



  void _sendDataBack(BuildContext context) {
    Navigator.pop(context, addressid);
  }

  Widget listIsEmpty() {
    return new Center(
      child: new Text(allTranslations.text('Searching')),
    );
  }

  //if user pull to refresh page
  Future<Null> _handleRefresh() async {
    await _getrecords(text:"");
    return null;
  }
//if user pull to refresh page



}