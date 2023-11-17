//@dart=2.9
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mijnzpc/models/massignmentfromdetails.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/dashboard/times/addrejectcomment.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
class Dettimesassignment extends StatefulWidget {

  Dettimesassignment(
      {@required this.times_status,this.data,this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor});

  final Massignmentfromdetails data;
  String  times_status;
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
  State<StatefulWidget> createState() => new DettimesassignmentState();

}

class DettimesassignmentState extends State<Dettimesassignment> with AutomaticKeepAliveClientMixin<Dettimesassignment> {
  bool get wantKeepAlive => true;


  String clien_name='';
  String employee_name='';

  String department_description='';
  String department_requirment='';
  String department_Address='';
  String department_Phone='';
  String department_Conditions='';
  String department_Cost='';




  String rejection_comment='';
  String from='';
  String to='';
  String duration='';
  String start_date='';
  String breake='';
  String sleepshift='';
  String calculatednumber='';
  String defualtsurcharge='';
  String totalpayrate='';
  String totalclientpayrate='';
  String fromto='';
  String useradress='';
  String usertell='';
  String departmentname='';
  String clientname='';
  bool acceptvisibility=false;
  bool adminvisibility=false;

  bool can = false;
  int canflex = 0;

  String payrateeee="-";
  String clientpayrateeee="-";
  String statussss="-";
  bool adminshow = false;
  bool freelancershow= false;
  bool canshowrej = false;
String extra_description="-";
  String department_id="0";

  String searchmsg="searching";



  @override
  Widget build(BuildContext context) {

    super.build(context);

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Open shopping cart',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
            },
          ),
        ],
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Assignment Detail'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,

      ),
      bottomSheet: Container(
    decoration:   BoxDecoration(
    color:widget.backgroundcolor,
    ),
    child: new  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[


            Expanded(
              flex: 30,
              child:  Padding(
                padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                child:  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child:   adminvisibility ? DecoratedBox(
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
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Addrejectcomment(assignmentid:widget.data.id.toString(),
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
                            child: Padding(
                              padding:EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              child:Center(
                                child: Text(allTranslations.text('Reject Comment') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                              ),
                            )
                        )
                    ): new Container()

                ),


              ),
            ),



          ]
      ),

      ),

      backgroundColor: widget.backgroundcolor,
      body:

      SingleChildScrollView(
        child:      Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
              child:     Container(
                width: MediaQuery.of(context).size.width,
                // height: 140.0,
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        widget.gradiantcolor,
                        widget.color,
                        //add more colors
                      ]),

                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 3.75),
                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                        blurRadius: 5
                    )
                  ],

                ),
                child:Column(
                  children: [

                    new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[


                          Expanded(
                            flex: 12,
                            child:     Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                                  child:  new  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[

                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                child:
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    departmentname,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 20.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),


                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.fromLTRB(0,2,0,10),
                                  child:  new  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[

                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                child:
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    clientname,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w500,
                                                      fontSize: 15.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),


                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),





                              ],
                            ),



                          ),



                          Expanded(
                              flex: 2,
                              child:  RichText(
                                text: TextSpan(
                                  children: [

                                    WidgetSpan(
                                      child:  IconButton(
                                        icon: const Icon(Icons.near_me_outlined, size: 25,color:Colors.white),
                                        onPressed: () {
                                          MapsLauncher.launchQuery(department_Address,);
                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              )

                          ),






                        ]
                    ),






                  ],
                ),
              ),


            ),




            new  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[









                  Expanded(
                    flex: 30,
                    child:  Padding(
                      padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                      child:  SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              primary: Colors.grey,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                              //make color or elevated button transparent
                            ),

                            onPressed: ()async{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              String token = prefs.getString('user.api_token');
                              final payUrl = 'https://mijnzpc.com/api/v1/exportAgreementPDF?token='+token+'&assignment_id='+widget.data.id.toString();
                              print(payUrl);
                              var urllaunchable = await canLaunch(payUrl); //canLaunch is from url_launcher package
                              if(urllaunchable){
                                await launch(payUrl); //launch is from url_launcher package to launch URL
                              }else{
                                print("URL can't be launched.");
                              }




                            },
                            child: Center(
                              child: Text(allTranslations.text("Agreement")),
                            ),

                          )





                      ),


                    ),
                  ),




               

                ]
            ),


            Padding(
              padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
              child:     Container(
                width: MediaQuery.of(context).size.width,
                // height: 140.0,
                decoration: BoxDecoration(
                  color: widget.cardcolor,
                  borderRadius: BorderRadius.circular(0.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 3.75),
                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                        blurRadius: 5
                    )
                  ],
                ),
                child:

                Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.fromLTRB(0,10,0,0),
                      child:  new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:   Icon(Icons.calendar_today,color: widget.color,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        eurodate(widget.data.start_date).toString(),
                                        textAlign: TextAlign.left,
                                        style:  TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),


                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0,1,0,1),
                      child:  new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:     Icon(Icons.access_time,color: widget.color,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        fromto,
                                        textAlign: TextAlign.left,
                                        style:   TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),


                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0,1,0,0),
                      child:  new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:   Icon(Icons.location_on_outlined,color: widget.color,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child:InkWell(
                                        onTap: () {
                                          MapsLauncher.launchQuery(department_Address,);
                                        },
                                        child:    new Text(
                                          department_Address,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),


                                    ),


                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0,1,0,0),
                      child:  new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:   Icon(Icons.call,color: widget.color,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: () {
                                          _launchPhoneURL();
                                        },
                                        child:    new Text(
                                          department_Phone,
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),
                                    ),


                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0,1,0,30),
                      child:  new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:   Icon(Icons.euro_rounded,color: widget.color,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 2, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        totalpayrate,
                                        textAlign: TextAlign.left,
                                        style:   TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),


                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),


            ),



            Padding(
              padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
              child:     Container(
                width: MediaQuery.of(context).size.width,
                // height: 140.0,
                decoration: BoxDecoration(
                  color: widget.cardcolor,
                  borderRadius: BorderRadius.circular(0.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 3.75),
                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                        blurRadius: 5
                    )
                  ],
                ),
                child:  Column(
                  children: [


                    adminshow ?   new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Client :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      clien_name,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ) :new Container(),

                    adminshow ? new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Freelancer :"),
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      employee_name,
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ) : new Container(),

                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Job Title :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text(widget.data.registeras.toString()),
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ) ,

                    adminshow ?  new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text( "Status :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text(statussss.toString()),
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ) : new Container(),
                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text( "Duration :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      duration,
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Break :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      breake,
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("sleepshift :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      sleepshift,
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child:
                      new  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Expanded(

                            flex: 10,
                            child: Padding(

                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:  new Text(
                                        allTranslations.text("Calculated number:"),
                                        textAlign: TextAlign.right,
                                        style:   TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 13,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    child:
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child:  new Text(
                                        calculatednumber,
                                        textAlign: TextAlign.left,
                                        style:   TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Default Surcharge:"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      "Є "+defualtsurcharge,
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Payrate :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      "Є "+payrateeee.toString(),
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    adminshow ? new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Client Payrate :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      "Є "+clientpayrateeee.toString(),
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ) : new Container(),
                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Total Payrate :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      "Є "+totalpayrate,
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                    adminshow ? new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      allTranslations.text("Total Client Payrate :"),
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      "Є "+totalclientpayrate,
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ): new Container(),

                    new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(

                          flex: 10,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      "",
                                      textAlign: TextAlign.right,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  child:
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  new Text(
                                      "",
                                      textAlign: TextAlign.left,
                                      style:   TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),




                  ],
                ),
              ),


            ),

            Padding(
              padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
              child:     Container(
                width: MediaQuery.of(context).size.width,
                // height: 140.0,
                decoration: BoxDecoration(
                  color: widget.cardcolor,
                  borderRadius: BorderRadius.circular(0.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 3.75),
                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                        blurRadius: 5
                    )
                  ],
                ),
                child:  Container(
                  // height: 450,
                  decoration: new BoxDecoration(
                    //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.only(
                          bottomLeft:  const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(150.0))
                  ),
                  child:  Column(
                    children: [










                      Padding(
                        padding: EdgeInsets.fromLTRB(0,10,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          allTranslations.text("Description"),
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,2,0,30),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                           extra_description,
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),




                    ],

                  ),

                ),

              ),


            ),


            Padding(
              padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
              child:     Container(
                width: MediaQuery.of(context).size.width,
                // height: 140.0,
                decoration: BoxDecoration(
                  color: widget.cardcolor,
                  borderRadius: BorderRadius.circular(0.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 3.75),
                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                        blurRadius: 5
                    )
                  ],
                ),
                child:  Container(
                  // height: 450,
                  decoration: new BoxDecoration(
                    //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.only(
                          bottomLeft:  const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(150.0))
                  ),
                  child:  Column(
                    children: [


                      Padding(
                        padding: EdgeInsets.fromLTRB(0,30,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          allTranslations.text("Department description"),
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,2,0,10),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          department_description,
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.fromLTRB(0,10,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          allTranslations.text("Department requirments"),
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,2,0,30),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          department_requirment,
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),



                      Padding(
                        padding: EdgeInsets.fromLTRB(0,10,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          allTranslations.text("Department Conditions"),
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,2,0,30),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          department_Conditions,
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.fromLTRB(0,10,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          allTranslations.text("Department Cost section"),
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,2,0,30),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          department_Cost,
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),




                    ],

                  ),

                ),

              ),


            ),





            Padding(
              padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 80),
              child:     Container(
                width: MediaQuery.of(context).size.width,
                // height: 140.0,
                decoration: BoxDecoration(
                  color: widget.cardcolor,
                  borderRadius: BorderRadius.circular(0.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 3.75),
                        color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                        blurRadius: 5
                    )
                  ],
                ),
                child:  Container(
                  // height: 450,
                  decoration: new BoxDecoration(
                    //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.only(
                          bottomLeft:  const  Radius.circular(40.0),
                          bottomRight: const  Radius.circular(150.0))
                  ),
                  child:  Column(
                    children: [


                      canshowrej?  Padding(
                        padding: EdgeInsets.fromLTRB(0,30,0,0),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          allTranslations.text("Times rejection details"),
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ): new Container(),
                      canshowrej?  Padding(
                        padding: EdgeInsets.fromLTRB(0,2,0,10),
                        child: new  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:  new Text(
                                          rejection_comment,
                                          textAlign: TextAlign.left,
                                          style:   TextStyle(
                                            // fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ): new Container(),









                    ],

                  ),

                ),

              ),


            ),









          ],

        ),
      ),



    );
  }



  //  get data from server
  void initState() {
    super.initState();
    getdet();
    checkshowstatus();
    checkshowstatusss();
    checkagree();
  }
  //  get data from server










  Widget listIsEmpty() {
    return new Center(
      child: new Text(allTranslations.text(searchmsg),style:TextStyle(color: Colors.grey,)),
    );
  }



  getdet() async{
    print('iiii');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String type = prefs.getString('user.type');

    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+widget.data.id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

print('ffffffffffffffff');
      if(responseBody['assignment'].toList().length > 0)
      {
        setState(() {
          payrateeee=responseBody['payrateeeee'].toString();
          clientpayrateeee=responseBody['clientpayrateeeee'].toString();
          statussss=responseBody['assignment'][0]['status'].toString();

          totalpayrate=responseBody['totalpayrate'].toString();
          totalclientpayrate=responseBody['totalclientpayrate'].toString();
          start_date=responseBody['assignment'][0]['start_date'].toString();
          duration=responseBody['durationintime'].toString();
          calculatednumber=responseBody['effecteddurationintime'].toString();
          clien_name=responseBody['client_name'];
          employee_name=responseBody['employee_name'];
          from=responseBody['from'];
          to=responseBody['to'];
          defualtsurcharge=responseBody['defualtsurcharge'];

          print('ssssssssss');
          print(responseBody['breake']);
          ///if(responseBody['breake']==1)
          //{
          // breake=true;
          //}

          breake=responseBody['breake'].toString();
          sleepshift=responseBody['sleepshift'];
          fromto=responseBody['from'].toString()+"-"+responseBody['to'].toString();
          departmentname=responseBody['department_name'].toString();
          clientname=responseBody['client_name'].toString();


          if(responseBody['assignment'][0]['extra_description']!=null){
          extra_description=responseBody['assignment'][0]['extra_description'].toString();
          }



          if(responseBody['department'][0]['description']!=null){
            department_description=responseBody['department'][0]['description'].toString();
          }

          if(responseBody['department'][0]['requirements']!=null){
            department_requirment=responseBody['department'][0]['requirements'].toString();
          }

          if(responseBody['department'][0]['conditions']!=null){
            department_Conditions=responseBody['department'][0]['conditions'].toString();
          }

          if(responseBody['department'][0]['cost']!=null){
            department_Cost=responseBody['department'][0]['cost'].toString();
          }


          if(responseBody['department'][0]['phone']!=null){
            department_Phone=responseBody['department'][0]['phone'].toString();
          }


          //  department_Address=responseBody['department_address'][0]['address'].toString()+" "+responseBody['department_address'][0]['city'].toString();

          department_Address=responseBody['department_address'][0]['address'].toString()+" "+responseBody['department_address'][0]['home_number'].toString()+"\n"+responseBody['department_address'][0]['postcode'].toString()+" "+responseBody['department_address'][0]['city'].toString();


          if(responseBody['assignment'][0]['comment']!=null){
            rejection_comment=responseBody['assignment'][0]['comment'].toString();
            canshowrej=true;
          }



          if(type!='EMPLOYEE')
          {
            if(widget.times_status=='EMPLOYEE_ACCEPTED')
              {
                adminvisibility=true;
              }
          }




          // jobtitlename= responseBody['jobtitle'][0]['title'];
        });
      }

    }

  }



  checkcanupdateandinsert()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    var user_id = prefs.getInt('user.id');
  }



  checkshowstatus()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    var caninsertassignment = prefs.getString('user.caninsertassignment');

    if(caninsertassignment=='1')
    {
      setState(() {
        can = true;
        canflex = 10;
      });
    }



  }




  checkagree()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    var user_id = prefs.getInt('user.id');


    if(type=='EMPLOYEE')
    {
      setState(() {
        freelancershow = true;
      });
    }


  }





  checkshowstatusss()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    var user_id = prefs.getInt('user.id');


    if(type=='ADMIN')
    {
      setState(() {
        adminshow = true;
      });
    }


  }

  eurodate(String date)
  {

    final splitted = date.split('-');
    return splitted[2]+"-"+splitted[1]+"-"+splitted[0];


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

  _launchPhoneURL() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String type = prefs.getString('user.type');
    String tell='';
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+widget.data.id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        tell = responseBody['department'][0]['phone'].toString();
      }

    }


    print(tell);
    tell = 'tel:' + tell;
    if (await canLaunch(tell)) {
      await launch(tell);
    } else {
      throw 'Could not launch $tell';
    }
  }





}





