//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/admin/profilecliets.dart';
import 'package:mijnzpc/pages/admin/profilefinancialdepartments.dart';
import 'package:mijnzpc/pages/admin/profilefreelaner.dart';
import 'package:mijnzpc/pages/admin/profilescheduledepartments.dart';
import 'package:mijnzpc/pages/dashboard/openassignments/detassignment.dart';
import 'package:mijnzpc/pages/dashboard/times/dettimes.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/models/musers.dart';
import 'package:mijnzpc/pages/notifroutes/detassignmentnotif.dart';
import 'package:mijnzpc/pages/notifroutes/detopenassignmentadminnotif.dart';
import 'package:mijnzpc/pages/notifroutes/detopenassignmentnotif.dart';
import 'package:mijnzpc/pages/notifroutes/profileclietsnotif.dart';
import 'package:mijnzpc/pages/notifroutes/profilefinancialdepartmentsnotif.dart';
import 'package:mijnzpc/pages/notifroutes/profilefreelanernotif.dart';
import 'package:mijnzpc/pages/notifroutes/profilescheduledepartmentsnotif.dart';
import 'package:mijnzpc/pages/notifroutes/times/dettimesnotif.dart';
import 'package:mijnzpc/pages/notifroutes/times/dettimessendinvoicenotif.dart';
import 'package:mijnzpc/pages/suggestions.dart';
import 'package:mijnzpc/services/notifservices.dart';
import 'package:mijnzpc/models/mtimes.dart';
import 'package:mijnzpc/models/memployees.dart';
class Notifroute extends StatefulWidget {


  Notifroute(
      {@required this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,this.data_id,this.whatpage
      });

  Color backgroundcolor;
  Color color;
  Color gradiantcolor;
  Color cardcolor;
  Color shadowcolor;
  Color appbarcolor;
  Color titlecolor;
  Color textcolor;
  Color bottombarcolor;
  String data_id;
  String whatpage;

  @override
  _NotifrouteState createState() => _NotifrouteState();
}

class _NotifrouteState extends State<Notifroute> {


  @override
  void initState() {
    super.initState();
    if(widget.whatpage=='New assignment')
    {
      _getNewassignment(widget.data_id);
    }

    if(widget.whatpage=='New open assignment')
    {
      _getNewopenassignment(widget.data_id);
    }

    if(widget.whatpage=='New open assignment admin')
    {
      _getNewopenassignmentadmin(widget.data_id);
    }


    if(widget.whatpage=='Times approved')
    {
      _getTimesapproved(widget.data_id);
    }



    if(widget.whatpage=='Registration new freelancer')
    {
      _getRegistrationnewfreelancer(widget.data_id);
    }
    if(widget.whatpage=='Registration new client')
    {
      _getRegistrationnew(widget.data_id,'Registration new client');
    }
    if(widget.whatpage=='Registration new financial')
    {
      _getRegistrationnew(widget.data_id,'Registration new financial');
    }
    if(widget.whatpage=='Registration new Schdule')
    {
      _getRegistrationnew(widget.data_id,'Registration new Schdule');
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundcolor,
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
  List<Mtimes> _recordsdatatimes = [];
  List<Musers> _recordsdatauser = [];
  List<Memployees> _recordsdataemployee = [];


  _getRegistrationnew(String id,String whereee) async
  {
    var response = await notifservices.actiongetRegistrationnewc(id);
    setState(() {
      _recordsdatauser.clear();
      _recordsdatauser.addAll(response['recordsdata']);
    });




    if(whereee=="Registration new client")
      {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Profileclientnotif(
          data: _recordsdatauser[0],
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

    if(whereee=="Registration new financial")
    {
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Profilefinancialpartmentnotif(
        data: _recordsdatauser[0],
        backgroundcolor:widget.backgroundcolor,
        color : widget.color,
        gradiantcolor:widget.gradiantcolor,
        cardcolor:widget.cardcolor,
        shadowcolor:widget.shadowcolor,
        appbarcolor:widget.appbarcolor,
        titlecolor:widget.titlecolor,
        textcolor:widget.textcolor,
        bottombarcolor:widget.bottombarcolor,)));
    }
    if(whereee=="Registration new Schdule")
    {
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Profilescheduledepartmentnotif(
        data: _recordsdatauser[0],
        backgroundcolor: widget.backgroundcolor,
        color: widget.color,
        gradiantcolor:widget.gradiantcolor,
        cardcolor:widget.cardcolor,
        shadowcolor:widget.shadowcolor,
        appbarcolor: widget.appbarcolor,
        titlecolor:widget.titlecolor,
        bottombarcolor:widget.bottombarcolor,
        textcolor:widget.textcolor,)));
    }
  }












  _getRegistrationnewfreelancer(String id) async
  {
    var response = await notifservices.actiongetRegistrationnew(id);
    setState(() {
      _recordsdataemployee.clear();
      _recordsdataemployee.addAll(response['recordsdata']);
    });


    if(_recordsdataemployee.isEmpty)
    {

      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
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
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Profilefreelancernotif(
          data: _recordsdataemployee[0],
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



  _getTimesapproved(String id) async
  {
    var response = await notifservices.actiongetTimesapproved(id);
    setState(() {
      _recordsdatatimes.clear();
      _recordsdatatimes.addAll(response['recordsdata']);
    });


    if(_recordsdatatimes.isEmpty)
    {

      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
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
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Dettimes2notif(
              data: _recordsdatatimes[0]
              ,backgroundcolor: widget.backgroundcolor,
              color: widget.color,
              gradiantcolor:widget.gradiantcolor,
              cardcolor:widget.cardcolor,
              shadowcolor:widget.shadowcolor,
              appbarcolor: widget.appbarcolor,
              titlecolor:widget.titlecolor,
              textcolor:widget.textcolor,
              bottombarcolor:widget.bottombarcolor,
            ))
        );
    }





  }

  _getNewassignment(String id) async
  {
    var response = await notifservices.actiongetNewassignment(id);
    setState(() {
      _recordsdata.clear();
      _recordsdata.addAll(response['recordsdata']);
    });

if(_recordsdata.isEmpty)
  {

    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
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

    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignmentnotif(
      data: _recordsdata[0],
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


  _getNewopenassignment(String id) async
  {
    var response = await notifservices.actiongetNewopenassignment(id);
    setState(() {
      _recordsdata.clear();
      _recordsdata.addAll(response['recordsdata']);
    });


    if(_recordsdata.isEmpty)
    {

      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
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
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detopenassignmentnotif(
          data: _recordsdata[0],
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




  _getNewopenassignmentadmin(String id) async
  {
    var response = await notifservices.actiongetNewopenassignment(id);
    setState(() {
      _recordsdata.clear();
      _recordsdata.addAll(response['recordsdata']);
    });

    if(_recordsdata.isEmpty)
    {

      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
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
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detopenassignmentadminnotif(
          data: _recordsdata[0],
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