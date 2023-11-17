//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/musers.dart';
import 'package:mijnzpc/services/adminservices.dart';
import 'package:mijnzpc/all_translations.dart';
class Admins extends StatefulWidget {
  Admins(
      {@required this.backgroundcolor,
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

  @override
  AdminsState createState() => AdminsState();
}

class AdminsState extends State<Admins> {

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
            child: new Text(allTranslations.text('Admins'),style: TextStyle(color: Colors.grey),),),
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
                      controller: _listScrollController,
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
                            padding: EdgeInsets.fromLTRB(0, 7, 0, 1),
                            child: new Column(
                              children: <Widget>[
                                new GestureDetector(
                                  onTap: () {
                                    //Navigator.push(context, new MaterialPageRoute(builder: (context) => new Profileadmin(data: _recordsdata[index])));
                                  },
                                  child:
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child:
                                          Text( _recordsdata[index].first_name.toString()+" "+_recordsdata[index].last_name.toString(),
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              // fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                        dense:true,
                                        contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                        title:  Text(
                                          _recordsdata[index].email.toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        trailing: Text(
                                            allTranslations.text(getstatus(_recordsdata[index].is_activated).toString()),
                                            style: TextStyle(
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.w700,
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


  getstatus(int status){

    if(status==0)
    {
      return "Deactive";
    }
    else
    if(status==1)
    {
      return "First Activate";
    }
    else
    if(status==2)
    {
      return "Seconde Activate";
    }


  }


  //  all needs variable
  List<Musers> _recordsdata = [];
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
    var response = await classgadminservices.actiongetadmins(page);
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



}