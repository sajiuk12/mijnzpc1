//@dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/memployees.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/admin/profilefreelaner.dart';
import 'package:mijnzpc/services/adminservices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/filters/filteremployee.dart';
import 'package:mijnzpc/pages/filters/filterjobtitle.dart';
import 'package:mijnzpc/pages/filters/filterstatusass.dart';
import 'package:mijnzpc/all_translations.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/all_translations.dart';


class Freelancers extends StatefulWidget {

  Freelancers(
      {@required this.backgroundcolor,this.gradiantcolor,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor
      });
  Color gradiantcolor;
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
  _FreelancersState createState() => _FreelancersState();
}

class _FreelancersState extends State<Freelancers> {

  int clientid=-1;
  String clientname="All";

  int departmentid=-1;
  String departmentname="All";
  String searchmsg="Searching";
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
  String statusname="";

  String employeenameforserver="";
  String employeelastnameforserver="";




  @override
  void initState() {
    super.initState();
    _getrecords();

    _listScrollController.addListener(() {

      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;
      if(maxScroll - currentScroll <= 40) {
        if(! _isLoading) {
          _getrecords(page : _currentPage + 1);
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
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
    },
    child:
      Scaffold(
        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Freelancers'),style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),
        backgroundColor: widget.backgroundcolor,
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:

                Padding(
                  padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                  child:
                Row(
                    children: <Widget>[




                      SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
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
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
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
                                    _getfilterjobtitle(context);
                                  },
                                  child: Padding(
                                    padding:EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:Center(
                                      child: Text(allTranslations.text('Job Title : ')+allTranslations.text(jobtitlename)),
                                    ),
                                  )
                              )
                          )
                      ),
                      SizedBox(
                        width: 5.0,
                      ),







                      SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
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
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
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
                                    _getfilterstatus(context);
                                  },
                                  child: Padding(
                                    padding:EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:Center(
                                      child: Text(allTranslations.text('Status : ')+allTranslations.text(statusname)),
                                    ),
                                  )
                              )
                          )
                      ),
                      SizedBox(
                        width: 5.0,
                      ),





                      SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
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
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0.0, 3.75),
                                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                        blurRadius: 3) //blur radius of shadow
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
                                    _getfilteremployee(context);
                                  },
                                  child: Padding(
                                    padding:EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:Center(
                                      child: Text(allTranslations.text('Employee : ')+allTranslations.text(employeename)),
                                    ),
                                  )
                              )
                          )
                      ),
                      SizedBox(
                        width: 5.0,
                      ),



                    ]

                ),
                ),
              ),


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
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
                            child:
                      new GestureDetector(
                      onTap: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Profilefreelancer(data: _recordsdata[index],
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
                      },
                      child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [

                                    SizedBox(
                                      width: 50,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [


                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                5.0, 0.0, 5.0, 5.0),
                                            child: new Container(
                                                width: 45.0,
                                                height: 40.0,
                                                decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: new DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: new NetworkImage(
                                             changetopic(_recordsdata[index].profile_url)

                                                        )
                                                    )
                                                )),
                                          ),

                                        ],
                                      ),
                                    ),



                                    SizedBox(
                                      width: 240,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          new Text(
                                      _recordsdata[index].first_name +" "+_recordsdata[index].last_name ,
                                              style:   TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 14.0,
                                              ),
                                              textAlign: TextAlign.center
                                          ),
                                          new        ListTile(
                                            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                            dense:true,
                                            contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0,left: 0,right: 0),
                                            title:        Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child:   Wrap(
                                                  crossAxisAlignment: WrapCrossAlignment.center,
                                                  children: [

                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                      child:Text(_recordsdata[index].company_name ,
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          // fontWeight: FontWeight.w700,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            trailing: Text(
                                                allTranslations.text(getstatus(_recordsdata[index].is_activated)) ,
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




                                  ],
                                ),



                              ],
                            ),

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
      ));
  }



  //  all needs variable
  List<Memployees> _recordsdata = [];
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
    print(page);
    var response = await classgadminservices.actiongetfreelancers(page,sortname,jobtitlename,clientid,departmentid,employeeid,statusname,yearname,monthname,startdatename,employeenameforserver,employeelastnameforserver);
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



  changetopic(String pic){
    if(pic==null){
      pic="https://mijnzpc.com/deeee.jpg";
    }
    else{
      var tt = json.decode(pic);
      pic ='https://mijnzpc.com'+tt['images'];
    }

    return pic;
  }
  getregisteras(string)
  {
    if(string==null || string==''){
      return " ";
    }
    else
      {
        return '- '+string;
      }
  }


  checkstatus(string)
  {

    string=json.decode(string);
    string=string['images'];
    var newString = string.substring(string.length - 3);
    print(newString);

    if(newString=="png" || newString=="jpg" || newString=="peg")
    {
      print("https://mijnzpc.com"+string);

      return "https://mijnzpc.com"+string;
    }
    else
    if(newString=="pdf")
    {
      return "https://mijnzpc.com/pdf.png";
    }
    else
    {
      return "https://mijnzpc.com/def.png";
    }


  }



  void _getfilteremployee(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filteremployee(idfromfirstpage:employeeid.toString(),   backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
        employeeid = int.parse(result);
      }
      else
      {
        employeeid=-1;
        employeename="All";
      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employeeid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          employeename= responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
            employeenameforserver=responseBody['profile'][0]['first_name'];
            employeelastnameforserver=responseBody['profile'][0]['last_name'];
        });
      }

    }
    _recordsdata.clear();
    _getrecords();

  }


  void _getfilterjobtitle(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterjobtitle(idfromfirstpage:jobtitleid.toString(),backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
        jobtitleid = int.parse(result);
      }
      else
      {
        jobtitleid=-1;
        jobtitlename="All";
        _recordsdata.clear();
        _getrecords();
      }
    });
    print('trtrtr');
    print(jobtitlename);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/jobtitleinfo?token='+token+'&id='+jobtitleid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['jobtitle'].toList().length > 0)
      {
        setState(() {
          jobtitlename= responseBody['jobtitle'][0]['title'];
        });

        _recordsdata.clear();
        _getrecords();
      }

    }


  }
  void _getfilterstatus(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Filterstatusass(clientidfromfirstpage:statusid.toString(),filterpage:"freelancer",   backgroundcolor: widget.backgroundcolor,
          color: widget.color,
          gradiantcolor:widget.gradiantcolor,
          cardcolor:widget.cardcolor,
          shadowcolor:widget.shadowcolor,
          appbarcolor: widget.appbarcolor,
          titlecolor:widget.titlecolor,
          textcolor:widget.textcolor,
          bottombarcolor:widget.bottombarcolor,)));
    setState(() {
      if(result!=null)
      {
        statusid = int.parse(result);
      }
      else
      {
        statusid=-1;
        statusname="All";
        _recordsdata.clear();
        _getrecords();
      }
    });

    print('satatuuuuuuus');
    print(statusid);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/statusassinfo?token='+token+'&id='+statusid.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['statusass'].toList().length > 0)
      {
        setState(() {
          statusname= responseBody['statusass'][0]['title'];
        });
        _recordsdata.clear();
        _getrecords();
      }

    }
  }


  getstatus(int status){
    if(status==0){
      return 'Deactive';
    }
    else
    if(status==1){
      return 'First Activate';
    }
    else
    if(status==2){
      return 'Seconde Activate';
    }
  }

}