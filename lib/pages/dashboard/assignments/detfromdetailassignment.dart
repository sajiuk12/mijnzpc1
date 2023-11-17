//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignmentfromdetails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/all_translations.dart';
class Detdetailsassignment extends StatefulWidget {

  Detdetailsassignment(
      {@required this.data,this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor});

  final Massignmentfromdetails data;
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
  State<StatefulWidget> createState() => new DetdetailsassignmentState();

}

class DetdetailsassignmentState extends State<Detdetailsassignment> with AutomaticKeepAliveClientMixin<Detdetailsassignment> {
  bool get wantKeepAlive => true;


  String clien_name='';
  String employee_name='';
  String department_name='';
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

  bool canshowrej = false;

  @override
  Widget build(BuildContext context) {

    super.build(context);

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: widget.titlecolor, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Assigment Number :')+ widget.data.id.toString(),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,

      ),
      backgroundColor: widget.backgroundcolor,



      bottomSheet:

      new  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Expanded(
              flex: 1,
              child: Text(""),
            ),
            Expanded(
              flex: 8,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(20.0) ,
                      topRight: Radius.circular(20.0) ,
                      bottomLeft:Radius.circular(20.0) ,
                      bottomRight: Radius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.blueGrey)),
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Sabtamalkard(name: gettoz(widget.data.name) +" "+gettoz(widget.data.fname),id:"0",customer_id:widget.data.id,cometime:"",pro:"",naghdinegi:"",toz:""),
                  //     ));
                },
                color: Colors.blueGrey,
                textColor: Colors.white,
                child: Icon(Icons.edit, size: 20,),
              ),

            ),
            Expanded(
              flex: 1,
              child: Text("".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),

            Expanded(
              flex: 8,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(20.0) ,
                      topRight: Radius.circular(20.0) ,
                      bottomLeft:Radius.circular(20.0) ,
                      bottomRight: Radius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.red)),
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Sabtalert(name: gettoz(widget.data.name) +" "+gettoz(widget.data.fname),id:"0",record_id:widget.data.id,timetoalert:"",status:"",report:"",toz:""),
                  //     ));
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Icon(Icons.delete,size: 20,),
              ),

            ),

            Expanded(
              flex: 1,
              child: Text("".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),


            Expanded(
              flex: 15,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(20.0) ,
                      topRight: Radius.circular(20.0) ,
                      bottomLeft:Radius.circular(20.0) ,
                      bottomRight: Radius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.purple)),
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Sabtmoshtari(name: gettoz(widget.data.name),fname:gettoz(widget.data.fname),id:gettoz(widget.data.id),howtokhonw:gettoz(widget.data.howtokhonw),tell:gettoz(widget.data.tell),phone:gettoz(widget.data.phone),sherkat:gettoz(widget.data.sherkat),ostan:gettoz(widget.data.ostan),city:gettoz(widget.data.city),tell2:gettoz(widget.data.tell2),tell3:gettoz(widget.data.tell3),addr:gettoz(widget.data.addr),toz:gettoz(widget.data.toz),),
                  //     ));
                },
                color: Colors.purple,
                textColor: Colors.white,
                child: Text(allTranslations.text("Agreement"),
                    style: TextStyle(fontSize: 11)),
              ),

            ),
            Expanded(
              flex: 1,
              child: Text("".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),

            Expanded(
              flex: 12,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(20.0) ,
                      topRight: Radius.circular(20.0) ,
                      bottomLeft:Radius.circular(20.0) ,
                      bottomRight: Radius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.green)),
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Sabtmoshtari(name: gettoz(widget.data.name),fname:gettoz(widget.data.fname),id:gettoz(widget.data.id),howtokhonw:gettoz(widget.data.howtokhonw),tell:gettoz(widget.data.tell),phone:gettoz(widget.data.phone),sherkat:gettoz(widget.data.sherkat),ostan:gettoz(widget.data.ostan),city:gettoz(widget.data.city),tell2:gettoz(widget.data.tell2),tell3:gettoz(widget.data.tell3),addr:gettoz(widget.data.addr),toz:gettoz(widget.data.toz),),
                  //     ));
                },
                color: Colors.green,
                textColor: Colors.white,
                child: Text(allTranslations.text("accept"),
                    style: TextStyle(fontSize: 11)),
              ),

            ),
            Expanded(
              flex: 1,
              child: Text("".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),


            Expanded(
              flex: 11,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(20.0) ,
                      topRight: Radius.circular(20.0) ,
                      bottomLeft:Radius.circular(20.0) ,
                      bottomRight: Radius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.red)),
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Sabtmoshtari(name: gettoz(widget.data.name),fname:gettoz(widget.data.fname),id:gettoz(widget.data.id),howtokhonw:gettoz(widget.data.howtokhonw),tell:gettoz(widget.data.tell),phone:gettoz(widget.data.phone),sherkat:gettoz(widget.data.sherkat),ostan:gettoz(widget.data.ostan),city:gettoz(widget.data.city),tell2:gettoz(widget.data.tell2),tell3:gettoz(widget.data.tell3),addr:gettoz(widget.data.addr),toz:gettoz(widget.data.toz),),
                  //     ));
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text(allTranslations.text("reject"),
                    style: TextStyle(fontSize: 11)),
              ),

            ),
            Expanded(
              flex: 1,
              child: Text("".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),



          ]
      ),



      // backgroundColor:Colors.grey[300],
      body:

      SingleChildScrollView(
        child:      Column(
          children: <Widget>[




            Container(
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
                    padding: EdgeInsets.fromLTRB(0,30,0,30),
                    child:  new  Row(
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
                                      style: const TextStyle(
                                        //fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black,
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
                                      widget.data.registeras.toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        //fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black,
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

                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:  new Text(
    allTranslations.text("Client :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                          padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
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
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
    allTranslations.text("Department title :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                  child:  new Text(
                                    department_name,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
    allTranslations.text("Freelancer :"),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                     // fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                    padding: EdgeInsets.fromLTRB(0,30,0,0),
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
                                      allTranslations.text("Start date :"),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        //fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black,
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
                                      start_date,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        //fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black,
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
    allTranslations.text("From :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    from,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                     // fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
    allTranslations.text("To :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    to,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                  allTranslations.text("Status :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    widget.data.status.toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
    allTranslations.text("Duration :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                     // fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                    padding: EdgeInsets.fromLTRB(0,0,0,30),
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
                                      style: const TextStyle(
                                       // fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black,
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
                                      style: const TextStyle(
                                        //fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                        color: Colors.black,
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
                                    style: const TextStyle(
                                     // fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    defualtsurcharge,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                     // fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    widget.data.payrate.toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
    allTranslations.text("Client Payrate :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    widget.data.client_payrate.toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
    allTranslations.text("Total Payrate :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    totalpayrate,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                     // fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
    allTranslations.text("Total Client Payrate :"),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    totalclientpayrate,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    "",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: Colors.black,
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




          ],

        ),
      ),



    );
  }



  //  get data from server
  void initState() {
    super.initState();
    getdet();
  }
  //  get data from server











  Widget listIsEmpty() {
    return new Center(
      child: new Text(allTranslations.text('Searching')),
    );
  }



  getdet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+widget.data.id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        setState(() {
          totalpayrate=responseBody['assignment'][0]['totalpayrate'];
          totalclientpayrate=responseBody['assignment'][0]['totalclientpayrate'];
          start_date=responseBody['assignment'][0]['start_date'];
          duration=responseBody['assignment'][0]['durationintime'];
          calculatednumber=responseBody['assignment'][0]['effecteddurationintime'];
          clien_name=responseBody['client_name'];
          employee_name=responseBody['employee_name'];
          department_name=responseBody['department_name'];
          from=responseBody['from'];
          to=responseBody['to'];
          defualtsurcharge=responseBody['defualtsurcharge'];

          breake=responseBody['breake'];
          sleepshift=responseBody['sleepshift'];






          // jobtitlename= responseBody['jobtitle'][0]['title'];
        });
      }

    }

  }








}





