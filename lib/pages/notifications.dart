//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/mnotifs.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/pages/dashboard/assignments/homecartassignment.dart';
import 'package:mijnzpc/pages/dashboard/openassignments/openassignment.dart';
import 'package:mijnzpc/pages/dashboard/times/homecarttimes.dart';
import 'package:mijnzpc/pages/notifroute.dart';
import 'package:mijnzpc/pages/suggestions.dart';
import 'package:mijnzpc/services/getservices.dart';
import 'package:mijnzpc/all_translations.dart';
class Notifications extends StatefulWidget {

  Notifications(
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
  NotificationsState createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {

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
  String searchmsg="Searching";
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

        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Notifications'),style: TextStyle(color: Colors.grey),),),
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
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child:


                            new Column(
                              children: <Widget>[
                                new GestureDetector(
                                  onTap: () {
                                  getroute(_recordsdata[index].key.toString(),_recordsdata[index].value.toString());
                                  },
                                  child:
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[


                                      getfontwight(context,_recordsdata[index].seen.toString(),_recordsdata[index].title.toString()),




                                      ListTile(
                                        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                        dense:true,
                                        contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 10,right: 5),
                                        title:  Text(
                                          allTranslations.text(_recordsdata[index].description.toString()),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        trailing: Text(
                                          '',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700,
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
      return "Seccond Activate";
    }


  }

  //  all needs variable
  List<Mnotifications> _recordsdata = [];
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
    var response = await classgetservices.actiongetnotification();
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
  Widget getfontwight(BuildContext context,String seen,String title) {

     if(seen == '0'){
     return  Align(
         alignment: Alignment.centerLeft,
         child: Padding(
           padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
           child:
           Text( allTranslations.text(title.toString()),
             style: TextStyle(
               color: Colors.grey,
                fontWeight: FontWeight.w700,
               fontSize: 15.0,
             ),
           ),
         ),
       );

    }
    else
      {
        return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child:
      Text( allTranslations.text(title.toString()),
      style: TextStyle(
      color: Colors.grey,
      // fontWeight: getfontwight(_recordsdata[index].seen.toString()),
      fontSize: 15.0,
      ),
      ),
      ),
      );

      }
  }


  getroute(String key,String value){

    if(key=='New assignment')
    {
     return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "New assignment",
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
    }
    else
    if(key=='New open assignment')
    {
      return  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "New open assignment",
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
    }
    else
    if(key=='New multiple assignment')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomecrtAssignment(
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
    }
    else
    if(key=='New multiple open assignment')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
    }
    else
    if(key=='New limit assignment')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "New open assignment",
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
    }
    else
    if(key=='New multiple limit assignment')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
    }
    else
    if(key=='open Assignment updated')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "New open assignment",
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
    }
    else
    if(key=='limit Assignment updated')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "New open assignment",
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
    }
    else
    if(key=='Assignment deleted')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomecrtAssignment(
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
    }
    else
    if(key=='open Assignment deleted')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
    }
    else
    if(key=='limit Assignment deleted')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Openassignment(
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
    }
    else
    if(key=='Send times')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomecartTimes(
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
    }
    else
    if(key=='Times approved')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "Times approved",
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
    }
    else
    if(key=='Times rejected')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "Times approved",
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
    }
    else
    if(key=='New candidate')
    {
      return  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Suggestions(
        assignment_id: int.parse(value),
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
    }
    else
    if(key=='Registration new freelancer')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "Registration new freelancer",
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
    }
    else
    if(key=='Registration new client')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "Registration new client",
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
    }
    else
    if(key=='Registration new financial')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "Registration new financial",
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
    }
    else
    if(key=='Registration new Schdule')
    {
      return Navigator.push(context, new MaterialPageRoute(builder: (context) => new Notifroute(
        data_id: value,
        whatpage: "Registration new Schdule",
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
    }
    else
      {
        return Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomecrtAssignment(
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
      }




  }





}