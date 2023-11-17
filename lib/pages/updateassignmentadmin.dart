//@dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/models/massignment.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/pages/selecters/selecteragreement.dart';
import 'package:mijnzpc/pages/selecters/selecterclient.dart';
import 'package:mijnzpc/pages/selecters/selecterdepartment.dart';
import 'package:mijnzpc/pages/selecters/selecteremployee1.dart';
import 'package:mijnzpc/pages/selecters/selecterjobtitle.dart';
class CustomPicker extends CommonPickerModel {
  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
        this.currentRightIndex())
        : DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        this.currentLeftIndex(),
        this.currentMiddleIndex(),
        this.currentRightIndex());
  }
}


class Updateassignmentadmin extends StatefulWidget{

  Updateassignmentadmin(
      {@required this.data,this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor});

  final Massignment data;
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
  State<StatefulWidget> createState() {
    return _Updateassignmentadmin();
  }
}



class _Updateassignmentadmin extends State<Updateassignmentadmin>{



  int clientid=0;
  String clientname="Client";

  int departmentid=0;
  String departmentname="Department";

  int agreementid=0;
  String agreementname="Agreement";



  int jobtitleid=0;
  String jobtitlename="Job title";



  int    client_id=0;
  int    jobtitle_id=0;
  String jobtitle_title='';
  int    department_id=0;
  int    agreement_id=0;
  String costsection="";

  String payrate1="";
  String clientpayrate1="";

  String payrate2="";
  String clientpayrate2="";

  String payrate3="";
  String clientpayrate3="";

  String payrate4="";
  String clientpayrate4="";

  String payrate5="";
  String clientpayrate5="";


  String titrjobtitleforupdate="";
  String titrclientsforupdate="";
  String titrdepartmentforupdate="";
  String titragreementforupdate="";

  String titrfreelancer1forupdate="Freelancer";
  String titrfreelancer2forupdate="Freelancer";
  String titrfreelancer3forupdate="Freelancer";
  String titrfreelancer4forupdate="Freelancer";
  String titrfreelancer5forupdate="Freelancer";


  int    employee_id=1;
  int    employee_id1=1;
  int    employee_id2=1;
  int    employee_id3=1;
  int    employee_id4=1;
  int    employee_id5=1;

  String    employee_name1="Freelancer";
  String    employee_name2="Freelancer";
  String    employee_name3="Freelancer";
  String    employee_name4="Freelancer";
  String    employee_name5="Freelancer";

  //
  // String   date1="Start date";
  // String   starttime1='';
  // String   endtime1='';

  bool     sleepshift1 = false;
  bool     breake1 = false;
  bool     speedassignment1= false;

  TextEditingController date1 = TextEditingController();
  TextEditingController starttime1 = TextEditingController();
  TextEditingController endtime1 = TextEditingController();


  int countemployee=1;
  int counttimes=1;


  bool checkedValue;



  String   shiftinfo='';


  bool visibilityemloyee2 = false;
  bool visibilityemloyee3 = false;
  bool visibilityemloyee4 = false;
  bool visibilityemloyee5 = false;


  bool showstatus = false;









  void _changed(bool visibility, String field) {
    setState(() {
      print(countemployee);
      if(countemployee==1)
      {
        if (field == "employee"){
          visibilityemloyee2 = visibility;
        }
        countemployee=2;
      }
      else
      if(countemployee==2)
      {
        if (field == "employee"){
          visibilityemloyee3 = visibility;
        }
        countemployee=3;
      }
      else
      if(countemployee==3)
      {
        if (field == "employee"){
          visibilityemloyee4 = visibility;
        }
        countemployee=4;
      }
      else
      if(countemployee==4)
      {
        if (field == "employee"){
          visibilityemloyee5 = visibility;
        }
        countemployee=5;
      }
      print(countemployee);



    });
  }


  void _changedclose(bool visibility, String field) {
    setState(() {
      print(countemployee);

      if(countemployee==2)
      {
        if (field == "employee"){
          visibilityemloyee2 = visibility;
        }
        countemployee--;
      }
      else
      if(countemployee==3)
      {
        if (field == "employee"){
          visibilityemloyee3 = visibility;
        }
        countemployee--;
      }
      else
      if(countemployee==4)
      {
        if (field == "employee"){
          visibilityemloyee4 = visibility;
        }
        countemployee--;
      }
      else
      if(countemployee==5)
      {
        if (field == "employee"){
          visibilityemloyee5 = visibility;
        }
        countemployee--;
      }

      print(countemployee);



    });
  }


  @override
  void initState() {
    getdet();

    checkshowstatus();

    setState(() {
      date1.text=widget.data.start_date;
      print('ffffffff');
      print(widget.data.extra_description);
      shiftinfo=widget.data.extra_description;
    });

  }


  @override
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(

        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Update assignment'),style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),
        backgroundColor: widget.backgroundcolor,


        bottomSheet:Container(
    decoration:   BoxDecoration(
    color:widget.backgroundcolor,
    ),
    child: new  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[


              Expanded(
                flex: 10,
                child:  Padding(
                  padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                  child:  SizedBox(
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

                              onPressed: (){
                                print(jobtitlename);
                                if(jobtitlename=='Job title')
                                {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(
                                            decoration:   BoxDecoration(
                                            color:widget.backgroundcolor,
                                        ),
                                        child:
                                         new Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: new AlertDialog(
                                              backgroundColor: widget.bottombarcolor,
                                              title: new Text(allTranslations.text('Hoppla'),style: TextStyle(color: Colors.grey)),
                                              content: new Text(allTranslations.text("please select registeras"),style: TextStyle(color: Colors.grey)),
                                              actions: <Widget>[
                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        ));
                                      }
                                  ) ?? false;
                                }
                                if(clientid==0)
                                {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(
                                            decoration:   BoxDecoration(
                                            color:widget.backgroundcolor,
                                        ),
                                        child:
                                        new Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: new AlertDialog(
                                              backgroundColor: widget.bottombarcolor,
                                              title: new Text(allTranslations.text('Hoppla'),style: TextStyle(color: Colors.grey)),
                                              content: new Text(allTranslations.text("please select client"),style: TextStyle(color: Colors.grey)),
                                              actions: <Widget>[
                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        ));
                                      }
                                  ) ?? false;
                                }
                                if(departmentid==0)
                                {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(
                                            decoration:   BoxDecoration(
                                            color:widget.backgroundcolor,
                                        ),
                                        child:
                                         new Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: new AlertDialog(
                                              backgroundColor: widget.bottombarcolor,
                                              title: new Text(allTranslations.text('Hoppla'),style: TextStyle(color: Colors.grey)),
                                              content: new Text(allTranslations.text("please select department"),style: TextStyle(color: Colors.grey)),
                                              actions: <Widget>[
                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        ));
                                      }
                                  ) ?? false;
                                }
                                if(departmentid==0)
                                {
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
                                              title: new Text(allTranslations.text('Hoppla'),style: TextStyle(color: Colors.grey)),
                                              content: new Text(allTranslations.text("please select department"),style: TextStyle(color: Colors.grey)),
                                              actions: <Widget>[
                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        ));
                                      }
                                  ) ?? false;
                                }
                                if(date1.text=='')
                                {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(
                                            decoration:   BoxDecoration(
                                            color:widget.backgroundcolor,
                                        ),
                                        child:
                                         new Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: new AlertDialog(
                                              backgroundColor: widget.bottombarcolor,
                                              title: new Text(allTranslations.text('Hoppla'),style: TextStyle(color: Colors.grey)),
                                              content: new Text(allTranslations.text("please add date"),style: TextStyle(color: Colors.grey)),
                                              actions: <Widget>[
                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        ));
                                      }
                                  ) ?? false;
                                }
                                if(starttime1=='')
                                {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(
                                            decoration:   BoxDecoration(
                                            color:widget.backgroundcolor,
                                        ),
                                        child:
                                         new Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: new AlertDialog(
                                              backgroundColor: widget.bottombarcolor,
                                              title: new Text(allTranslations.text('Hoppla'),style: TextStyle(color: Colors.grey)),
                                              content: new Text(allTranslations.text("please add start time"),style: TextStyle(color: Colors.grey)),
                                              actions: <Widget>[
                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        ));
                                      }
                                  ) ?? false;
                                }
                                if(endtime1=='')
                                {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return new Container(
                                            decoration:   BoxDecoration(
                                            color:widget.backgroundcolor,
                                        ),
                                        child:
                                         new Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: new AlertDialog(
                                              backgroundColor: widget.bottombarcolor,
                                              title: new Text(allTranslations.text('Hoppla'),style: TextStyle(color: Colors.grey)),
                                              content: new Text(allTranslations.text("please add end time"),style: TextStyle(color: Colors.grey)),
                                              actions: <Widget>[
                                                new FlatButton(
                                                    onPressed: () {
                                                      // exit(0);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: new Text(allTranslations.text('Ok'), style: TextStyle(
                                                        fontWeight: FontWeight.bold, color: Colors.red),)
                                                ),
                                              ],
                                            )
                                        ));
                                      }
                                  ) ?? false;
                                }


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
                content: new Text(allTranslations.text('You are about to update a assignment. Proceed?'),style: TextStyle(color: Colors.grey)),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                  ),
                  new FlatButton(
                      onPressed: () {
                        sendData();
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
                                  top: 5,
                                  bottom: 5,
                                ),
                                child:Center(
                                  child: Text(allTranslations.text('Confirm') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                ),
                              )
                          )
                      )

                  ),


                ),
              ),









            ]
        ),
        ),

        body:

        new SingleChildScrollView(
          child:     Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
            child:      new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[


                Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilterjobtitle(context);
                        },
                        child: new Text(
                          allTranslations.text(jobtitlename),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    //jobtitle
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilterclient(context);
                        },
                        child: new Text(
                          allTranslations.text(clientname),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ),


                Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilterdepartment(context);
                        },
                        child: new Text(
                          allTranslations.text(departmentname),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ),

                showstatus ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilteragreement(context);
                        },
                        child: new Text(
                          allTranslations.text(agreementname),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ) :new Container(),







                Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Cost Section : ')+costsection,style:TextStyle(fontSize:16, color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ),





                Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child:TextFormField(
                          style: TextStyle(color:Colors.grey[700]),
                          onChanged: (text){shiftinfo=text;},
                          initialValue: shiftinfo,
                          decoration: InputDecoration(
                            hintText: allTranslations.text("Shift information"),
                            hintStyle: TextStyle(fontSize:16, color: Colors.grey[700]),
                            // prefixIcon: Icon(Icons.people,color: Colors.grey,),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                            filled: true, //<-- SEE HERE
                            fillColor: widget.backgroundcolor,
                          ),
                          textAlign: TextAlign.left,

                        ),
                      ),




                    ),
                    //agreement

                  ),


                ),





                //freelancer 1
                showstatus ?Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilteremployee1(context);
                        },
                        child: new Text(
                          allTranslations.text(employee_name1),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ):new Container(),
                showstatus ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      //border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Payrate : ')+payrate1,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                showstatus ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      // border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Client payrate : ')+clientpayrate1,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                //freelancer 1

                //freelancer 2
                visibilityemloyee2 ?Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilteremployee2(context);
                        },
                        child: new Text(
                          allTranslations.text(employee_name2),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ):new Container(),
                visibilityemloyee2 ? new Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Payrate : ')+payrate2,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                visibilityemloyee2 ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Client payrate : ')+clientpayrate2,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                // freelancer 2




                //freelancer 3
                visibilityemloyee3 ?Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilteremployee3(context);
                        },
                        child: new Text(
                          allTranslations.text(employee_name3),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ):new Container(),
                visibilityemloyee3 ? new Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Payrate : ')+payrate3  ,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                visibilityemloyee3 ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Client payrate : ')+clientpayrate3  ,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                //freelancer 3

                //freelancer 4
                visibilityemloyee4 ?Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilteremployee4(context);
                        },
                        child: new Text(
                          allTranslations.text(employee_name4),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ):new Container(),
                visibilityemloyee4 ? new Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Payrate : ')+payrate4,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                visibilityemloyee4 ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Client payrate : ')+clientpayrate4,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                //freelancer 4

                //freelancer 5
                visibilityemloyee5 ?Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:                  //jobtitle
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                      child: InkWell(
                        onTap: () {
                          _getfilteremployee5(context);
                        },
                        child: new Text(
                          allTranslations.text(employee_name5),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:   Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),


                    ),
                    //jobtitle
                  ),


                ):new Container(),
                visibilityemloyee5 ? new Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Payrate : ')+payrate5 ,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                visibilityemloyee5 ? Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:       //agreement
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child:Text(allTranslations.text('Client payrate : ')+clientpayrate5 ,style:TextStyle(fontSize:16,color:Colors.grey[700])),),




                    ),
                    //agreement

                  ),


                ):new Container(),
                //freelancer 5






                showstatus ?  new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[







                      Expanded(
                        flex: 30,
                        child:  Padding(
                          padding: EdgeInsets.only(top:3,left: 0,right: 0,bottom: 5),
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

                                  onPressed: (){
                                    _changed(true, "employee");
                                  },
                                  child: Padding(
                                    padding:EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:Center(
                                      child: Text(allTranslations.text('Add Freelancer') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
                                    ),
                                  )
                              )





                          ),


                        ),
                      ),






                      Expanded(
                        flex: 1,
                        child: Text("".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ),

                      Expanded(
                        flex: 30,
                        child:  Padding(
                          padding: EdgeInsets.only(top:3,left: 0,right: 0,bottom: 5),
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

                                  onPressed: (){
                                    _changedclose(false, "employee");
                                  },
                                  child: Padding(
                                    padding:EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:Center(
                                      child: Text(allTranslations.text('Delete') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
                                    ),
                                  )
                              )





                          ),


                        ),
                      ),


                    ]
                ):new Container(),






                Padding(
                  padding: EdgeInsets.only(top:10,left: 2,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top:0,left: 10,right: 15,bottom: 0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 0),
                              child:     Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 140.0,
                                decoration: BoxDecoration(
                                  color: widget.backgroundcolor,
                                  borderRadius: BorderRadius.circular(0.0),

                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.grey[700]),
                                  controller: date1, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.calendar_today,color: Colors.grey[700],), //icon of text field
                                    labelText: allTranslations.text("Start date"),
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700], //<-- SEE HERE
                                    ),
                                  ),
                                  readOnly: true,  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    selectDate(context,1);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ), //Column
                      ), //SizedBox
                    ), //Padding


                  ),


                ),
                Padding(
                  padding: EdgeInsets.only(top:10,left: 2,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top:0,left: 10,right: 15,bottom: 0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 0),
                              child:     Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 140.0,
                                decoration: BoxDecoration(
                                  color: widget.backgroundcolor,
                                  borderRadius: BorderRadius.circular(0.0),

                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.grey[700]),
                                  controller: starttime1, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.timer,color: Colors.grey[700],), //icon of text field
                                    labelText: allTranslations.text("From"),
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700], //<-- SEE HERE
                                    ),
                                  ),
                                  readOnly: true,  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    var dt = DateTime.now();
                                    TimeOfDay pickedTime =  await

                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay(hour: 00, minute: 00),
                                      builder: (context, child) {
                                        return gettheme(context,child);
                                      },
                                    );

                                    if(pickedTime != null ){
                                      // print(pickedTime.format(context));   //output 10:51 PM
                                      // DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                      // //converting to DateTime so that we can further format on different pattern.
                                      // print(parsedTime); //output 1970-01-01 22:53:00.000
                                      // String formattedTime = DateFormat('HH:mm').format(parsedTime);
                                      // print(formattedTime); //output 14:59:00
                                      // //DateFormat() is from intl package, you can format the time on any pattern you need.

                                      var hourse ='0';
                                      hourse = gettime(pickedTime.format(context));
                                      setState(() {
                                        starttime1.text =hourse;
                                      });

                                    }else{
                                      print("Time is not selected");
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ), //Column
                      ), //SizedBox
                    ), //Padding


                  ),


                ),
                Padding(
                  padding: EdgeInsets.only(top:10,left: 2,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top:0,left: 10,right: 15,bottom: 0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 0),
                              child:     Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 140.0,
                                decoration: BoxDecoration(
                                  color: widget.backgroundcolor,
                                  borderRadius: BorderRadius.circular(0.0),

                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.grey[700]),
                                  controller: endtime1, //editing controller of this TextField
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.timer,color: Colors.grey[700],), //icon of text field
                                    labelText: allTranslations.text("To"),
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700], //<-- SEE HERE
                                    ),
                                  ),
                                  readOnly: true,  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    var dt = DateTime.now();
                                    TimeOfDay pickedTime =  await

                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay(hour: 00, minute: 00),
                                      builder: (context, child) {
                                        return gettheme(context,child);
                                      },
                                    );

                                    if(pickedTime != null ){
                                      var hourse ='0';
                                      hourse = gettime(pickedTime.format(context));
                                      setState(() {
                                        endtime1.text =hourse;
                                      });
                                    }else{
                                      print("Time is not selected");
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ), //Column
                      ), //SizedBox
                    ), //Padding


                  ),


                ),
                Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child:     Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140.0,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 3.75),
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 5
                        )
                      ],
                    ),
                    child:   Padding(
                      padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                      child: SizedBox(
                        child: Column(
                          children: [

                            Row(
                              children: <Widget>[


                                Expanded(
                                  flex: 5,
                                  child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 5,
                                          child: Text(allTranslations.text("sleep shift"),
                                              style: TextStyle(fontSize: 14,    color: widget.color,
                                                fontWeight: FontWeight.w700,)),
                                        ),

                                        Expanded(
                                          flex: 5,
                                          child: Center(
                                            child: Switch(
                                              value: sleepshift1,
                                              inactiveThumbColor:Colors.grey[500],
                                              inactiveTrackColor: Colors.grey[500],
                                              activeColor: Colors.white,
                                              activeTrackColor:  Colors.grey,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  sleepshift1 = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),


                                      ]),
                                ),




                                Expanded(
                                  flex: 5,
                                  child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 5,
                                          child: Text(allTranslations.text("break"),
                                              style: TextStyle(fontSize: 14,    color: widget.color,
                                                fontWeight: FontWeight.w700,)),
                                        ),

                                        Expanded(
                                          flex: 5,
                                          child: Center(
                                            child: Switch(
                                              value: breake1,
                                              inactiveThumbColor:Colors.grey[500],
                                              inactiveTrackColor: Colors.grey[500],
                                              activeColor: Colors.white,
                                              activeTrackColor:  Colors.grey,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  breake1 = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),


                                      ]),
                                ),





                                //Checkbox
                              ], //<Widget>[]
                            ), //Row




                          ],
                        ), //Column
                      ), //SizedBox
                    ), //Padding


                  ),


                ),












                Divider(
                  color:Colors.transparent,
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                ),
                Divider(
                  color:Colors.transparent,
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                ),
                Divider(
                  color:Colors.transparent,
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                ),
                Divider(
                  color:Colors.transparent,
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                ),

              ],
            ),
          ),

        ),









      ),
    );
  }



  sendData() async {

    Map response = await (new AuthService()).sendDataToupdateassignment({
      "assignment_id" :  widget.data.id.toString(),
      "client_id" :  clientid.toString(),
      "registeras" : jobtitlename.toString(),
      "agreement_id" : agreementid.toString(),
      "department_id" :departmentid.toString(),
      "employee_id1" :employee_id1.toString(),
      "employee_id2" :employee_id2.toString(),
      "employee_id3" :employee_id3.toString(),
      "employee_id4" :employee_id4.toString(),
      "employee_id5" :employee_id5.toString(),
      "shiftinfo" :shiftinfo.toString(),
      "date1" :date1.text,
      "starttime1" :starttime1.text,
      "endtime1" :endtime1.text,
      "sleepshift1" :sleepshift1.toString(),
      "break1" :breake1.toString(),
      "speedasignment1" :speedassignment1.toString(),
      "countemployee" :countemployee.toString(),
      "counttimes" :counttimes.toString(),
    });

    print(response);
    // if(response['code']=='0' || response['code']=='0')//has error
    //     {
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
                content: new Text(allTranslations.text(response['msg'].toString()),style: TextStyle(color: Colors.grey)),
                actions: <Widget>[

                  new FlatButton(
                      onPressed: () {
                        // exit(0);
                        //Navigator.of(context).pop();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => super.widget));

                      },
                      child: new Text(allTranslations.text('Ok'), style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),)
                  ),
                ],
              )
          ));
        }
    ) ?? false;
    // }
    // else
    // {
    //
    //
    //
    // }






  }


  checkmin(int min){
    if(min<10)
    {
      return '0'+min.toString();
    }
    else
    {
      return min.toString();
    }
  }
  //  all needs variable
  List<Map<String, dynamic>> _clientsdata = [];
  List<Map<String, dynamic>> _jobtitledata = [];
  List<Map<String, dynamic>> _departmentdata = [];
  List<Map<String, dynamic>> _employeedata = [];
  List<Map<String, dynamic>> _agreementdata = [];
  //  all needs variable













  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:widget.backgroundcolor,
          width: 1,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:widget.backgroundcolor,
          width: 0,
        )
    );
  }



  getdet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String type = prefs.getString('user.type');

    String url ='';
    if(widget.data.employee_id==1)
      {
          url ='https://mijnzpc.com/api/v1/detopenassignment?token='+token+'&id='+widget.data.id.toString();
      }
    else
      {
          url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+widget.data.id.toString();
      }



    print('eeeee');
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['assignment'].toList().length > 0)
      {
        setState(() {

          jobtitlename= responseBody['assignment'][0]['registeras'];
          clientname=responseBody['client_name'].toString();
          departmentname=responseBody['department_name'].toString();

          titragreementforupdate="";

          if(responseBody['assignment'][0]['registeras']=="healthcare")
          {
            jobtitleid=1;
          }
          else
          {
            jobtitleid=2;
          }

          employee_id  =responseBody['assignment'][0]['employee_id'];
          clientid =  responseBody['assignment'][0]['client_id'];
          jobtitle_title  = responseBody['assignment'][0]['registeras'];



          agreementid  = int.parse(responseBody['assignment'][0]['agreement_id']);
          departmentid  =responseBody['assignment'][0]['department_id'];
          if(responseBody['assignment'][0]['employee_id1']!=null){
            employee_id1  =responseBody['assignment'][0]['employee_id1'];
          }
          if(responseBody['assignment'][0]['employee_id2']!=null){
            employee_id2  =responseBody['assignment'][0]['employee_id2'];
          }
          if(responseBody['assignment'][0]['employee_id3']!=null){
            employee_id3  =responseBody['assignment'][0]['employee_id3'];
          }
          if(responseBody['assignment'][0]['employee_id4']!=null){
            employee_id4  =responseBody['assignment'][0]['employee_id4'];
          }
          if(responseBody['assignment'][0]['employee_id5']!=null){
            employee_id5  =responseBody['assignment'][0]['employee_id5'];
          }


          if(responseBody['assignment'][0]['speedasignment']==1)
            {
              speedassignment1  =true;
            }


        print(responseBody['assignment'][0]['start_date']);
          date1.text  =responseBody['assignment'][0]['start_date'];

          starttime1.text=responseBody['from'];
          endtime1.text=responseBody['to'];


          if(responseBody['assignment'][0]['break']==null)
          {
            breake1=false;
          }
          else
          if(responseBody['assignment'][0]['break']=='0')
            {
              breake1=false;
            }
          else
          if(responseBody['assignment'][0]['break']=='1')
          {
            breake1=true;
          }



          //sleepshift1  =responseBody['assignment'][0]['sleepshift'];
          if(responseBody['assignment'][0]['sleepshift']==null)
          {
            sleepshift1=false;
          }
          else
          if(responseBody['assignment'][0]['sleepshift']=='0')
          {
            sleepshift1=false;
          }
          else
          if(responseBody['assignment'][0]['sleepshift']=='1')
          {
            sleepshift1=true;
          }





        });






          String url ='https://mijnzpc.com/api/v1/departmentinfo?token='+token+'&id='+department_id.toString();
          print(url);
          final response = await http.get(Uri.parse(url),);
          if(response.statusCode == 200) {
            var responseBody = json.decode(response.body)['data'];
            setState(() {
              costsection=responseBody['department'][0]['cost'].toString();
            });
          }


        String url2 ='https://mijnzpc.com/api/v1/getagreementinfo?token='+token+'&id='+agreementid.toString();
        print(url2);
        final response2 = await http.get(Uri.parse(url2),);
        if(response2.statusCode == 200) {
          var responseBody = json.decode(response2.body)['data'];
          setState(() {
            agreementname=responseBody['preaggrement'][0]['title'].toString();
          });
        }


        if(employee_id>1)
        {
          if(employee_id>1)
          {
            String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id.toString();
            print(url);
            final response = await http.get(Uri.parse(url),);
            if(response.statusCode == 200) {
              var responseBody = json.decode(response.body)['data'];
              setState(() {
                employee_name1=responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
                employee_id1=employee_id;
              });
            }
          }
          if(employee_id>1)
          {
            String url ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id.toString()+'&client_id='+clientid.toString();
            print(url);
            final response = await http.get(Uri.parse(url),);
            if(response.statusCode == 200) {
              var responseBody = json.decode(response.body)['data'];
              setState(() {
                payrate1=responseBody['joinclient'][0]['payrate'].toString();
                clientpayrate1=responseBody['joinclient'][0]['client_payrate'].toString();
              });
            }
          }
        }
        else
          {


            if(employee_id1>1)
            {
              String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id1.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  employee_name1=responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
                });
              }
            }

            if(employee_id1>1)
            {
              String url ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id1.toString()+'&client_id='+clientid.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  payrate1=responseBody['joinclient'][0]['payrate'].toString();
                  clientpayrate1=responseBody['joinclient'][0]['client_payrate'].toString();
                });
              }
            }


            if(employee_id2>1)
            {
              String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id2.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  countemployee = 2;
                  if (type != 'EMPLOYEE') {
                  visibilityemloyee2 = true;
                }
                  employee_name2=responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
                });
              }
            }

            if(employee_id2>1)
            {
              String url ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id2.toString()+'&client_id='+clientid.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  payrate2=responseBody['joinclient'][0]['payrate'].toString();
                  clientpayrate2=responseBody['joinclient'][0]['client_payrate'].toString();
                });
              }
            }

            if(employee_id3>1)
            {
              String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id3.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  countemployee=3;
                  if(type!='EMPLOYEE'){
                    visibilityemloyee3=true;
                  }


                  employee_name3=responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
                });
              }
            }

            if(employee_id3>1)
            {
              String url ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id3.toString()+'&client_id='+clientid.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  payrate3=responseBody['joinclient'][0]['payrate'].toString();
                  clientpayrate3=responseBody['joinclient'][0]['client_payrate'].toString();
                });
              }
            }


            if(employee_id4>1)
            {
              String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id4.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  countemployee=4;

                  if(type!='EMPLOYEE'){
                    visibilityemloyee4=true;
                  }

                  employee_name4=responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
                });
              }
            }

            if(employee_id4>1)
            {
              String url ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id4.toString()+'&client_id='+clientid.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  payrate4=responseBody['joinclient'][0]['payrate'].toString();
                  clientpayrate4=responseBody['joinclient'][0]['client_payrate'].toString();
                });
              }
            }


            if(employee_id5>1)
            {
              String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id5.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  countemployee=5;

                  if(type!='EMPLOYEE'){
                    visibilityemloyee5=true;
                  }


                  employee_name5=responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
                });
              }
            }

            if(employee_id5>1)
            {
              String url ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id5.toString()+'&client_id='+clientid.toString();
              print(url);
              final response = await http.get(Uri.parse(url),);
              if(response.statusCode == 200) {
                var responseBody = json.decode(response.body)['data'];
                setState(() {
                  payrate5=responseBody['joinclient'][0]['payrate'].toString();
                  clientpayrate5=responseBody['joinclient'][0]['client_payrate'].toString();
                });
              }
            }




          }






      }

    }

  }



  checkshowstatus()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    var user_id = prefs.getInt('user.id');

    if(type=='EMPLOYEE')
    {
      setState(() {
        showstatus = false;
        employee_id1=user_id;
        agreement_id=21;
      });
    }
    else
    if(type=='ADMIN')
    {
      setState(() {
        showstatus = true;
      });
    }


  }

  Widget gettheme(BuildContext context,Widget child) {
    print('dsdsd');
    print(widget.backgroundcolor);
    if(widget.backgroundcolor==Color(0xff1a1d21)){
      return  Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            // change the border color
            primary: widget.color,
            // change the text color
            onSurface: widget.gradiantcolor,
          ),
          // button colors
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.dark(
              primary: Colors.grey[500],
            ),
          ),
        ),
        child: child,
      );
    }
    else
    {
      return  Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            // change the border color
            primary: widget.color,
            // change the text color
            onSurface: widget.gradiantcolor,
          ),
          // button colors
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.grey[500],
            ),
          ),
        ),
        child: child,
      );
    }




  }

  Future<Null> selectDate(BuildContext context,int variable) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {

        if(widget.backgroundcolor==Color(0xff1a1d21)){
          return  Theme(
            data: ThemeData.dark().copyWith(
                colorScheme:   ColorScheme.light(
                  onPrimary: Colors.black, // selected text color
                  onSurface: Colors.grey[500], // default text color
                  primary: widget.color,// circle color
                ),
                dialogBackgroundColor: widget.backgroundcolor,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        textStyle:   TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Quicksand'),
                        primary: Colors.grey[500], // color of button's letters
                        backgroundColor: Colors.transparent, // Background color
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50))))),
            child: child,
          );
        }
        else
        {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: widget.color, // header background color
                onPrimary: Colors.black, // header text color
                onSurface: Colors.grey[700], // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.grey, // button text color
                ),
              ),
            ),
            child: child,
          );
        }




      },
    );

    var selectedmont='0';
    if(picked.month<10)
    {
      selectedmont='0'+picked.month.toString();
    }
    else
    {
      selectedmont=picked.month.toString();
    }



    var selectedday='0';
    if(picked.day<10)
    {
      selectedday='0'+picked.day.toString();
    }
    else
    {
      selectedday=picked.day.toString();
    }



    if(variable==1){
      setState(() {

        date1.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }







  }

  gettime(String time){
    print(time);
    var parts = time.split(' ');
    var hourse = parts[0];

    var tt=parts.length;
    print('rereerer');
    print(tt);

    if(tt>1)
    {
      if(parts[1]=='PM' || parts[1]=='AM'){
        var parts2 = parts[0].split(':');
        var h=0;
        if(parts[1]=='AM')
        {
          hourse=parts[0];
        }
        else
        {
          if(parts2[0]=='1')
          {
            hourse='13:'+parts2[1];
          }
          if(parts2[0]=='2')
          {
            hourse='14:'+parts2[1];
          }
          if(parts2[0]=='3')
          {
            hourse='15:'+parts2[1];
          }
          if(parts2[0]=='4')
          {
            hourse='16:'+parts2[1];
          }
          if(parts2[0]=='5')
          {
            hourse='17:'+parts2[1];
          }
          if(parts2[0]=='6')
          {
            hourse='18:'+parts2[1];
          }
          if(parts2[0]=='7')
          {
            hourse='19:'+parts2[1];
          }
          if(parts2[0]=='8')
          {
            hourse='20:'+parts2[1];
          }
          if(parts2[0]=='9')
          {
            hourse='21:'+parts2[1];
          }
          if(parts2[0]=='10')
          {
            hourse='22:'+parts2[1];
          }
          if(parts2[0]=='11')
          {
            hourse='23:'+parts2[1];
          }
          if(parts2[0]=='12')
          {
            hourse='24:'+parts2[1];
          }


        }
      }
    }





    return hourse;

  }

  resetdatas(){
    setState(() {
      departmentid = 0;
      departmentname= "Department";
      agreementid = 0;
      agreementname= "Agreement";
      employee_id1 = 1;
      employee_name1= "Freelancer";
      employee_id2 = 1;
      employee_name2= "Freelancer";
      employee_id3 = 1;
      employee_name3= "Freelancer";
      employee_id4 = 1;
      employee_name4= "Freelancer";
      employee_id5 = 1;
      employee_name5= "Freelancer";
    });
  }

  void _getfilterjobtitle(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecterjobtitle(idfromfirstpage:jobtitleid.toString(),backgroundcolor: widget.backgroundcolor,
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
        // jobtitleid=-1;
        // jobtitlename="All";
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
      }
    }
  }
  void _getfilterclient(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecterclient(
          clientidfromfirstpage:clientid.toString(),
          jobtitlefromfirstpage:jobtitlename.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        clientid = int.parse(result);
      }
      else
      {
        // clientid=-1;
        // clientname="All";
      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+clientid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          clientname= responseBody['profile'][0]['company_name'];
        });
      }

    }
  }
  void _getfilterdepartment(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecterdepartment(
          idfromfirstpage:departmentid.toString(),
          clientidfromfirstpage:clientid.toString(),
          registerasfromfirstpage:jobtitlename.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        departmentid = int.parse(result);
      }
      else
      {
        // departmentid=-1;
        // departmentname="All";

      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/departmentinfo?token='+token+'&id='+departmentid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['department'].toList().length > 0)
      {
        setState(() {
          departmentname= responseBody['department'][0]['title'];
        });

      }

    }
  }
  void _getfilteragreement(BuildContext context) async {
    print(jobtitleid.toString());
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecteragreement(
          clientidfromfirstpage:clientid.toString(),
          departmentidfromfirstpage:departmentid.toString(),
          registerasidfromfirstpage:jobtitleid.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        agreementid = int.parse(result);
      }
      else
      {
        // agreementid=-1;
        // departmentname="All";

      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/getagreementinfo?token='+token+'&id='+agreementid.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['preaggrement'].toList().length > 0)
      {
        setState(() {
          agreementname= responseBody['preaggrement'][0]['title'];
        });

      }

    }
  }
  void _getfilteremployee1(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecteremployee1(
          clientidfromfirstpage:clientid.toString(),
          departmentidfromfirstpage:departmentid.toString(),
          registerasidfromfirstpage:jobtitleid.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        employee_id1 = int.parse(result);
      }
      else
      {
        // employee_id1=-1;
        // employeename1="All";

      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id1.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          employee_name1= responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
        });

      }

    }


    if(employee_id1==1)
    {
      setState(() {
        employee_name1='Freelancer';
        payrate1='';
        clientpayrate1='';
      });
    }

  }
  void _getfilteremployee2(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecteremployee1(
          clientidfromfirstpage:clientid.toString(),
          departmentidfromfirstpage:departmentid.toString(),
          registerasidfromfirstpage:jobtitleid.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        employee_id2 = int.parse(result);
      }
      else
      {
        // employee_id1=-1;
        // employeename1="All";

      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id2.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          employee_name2= responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
        });

      }

    }

    if(employee_id2==1)
    {
      setState(() {
        employee_name2='Freelancer';
        payrate2='';
        clientpayrate2='';
      });
    }

  }
  void _getfilteremployee3(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecteremployee1(
          clientidfromfirstpage:clientid.toString(),
          departmentidfromfirstpage:departmentid.toString(),
          registerasidfromfirstpage:jobtitleid.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        employee_id3 = int.parse(result);
      }
      else
      {
        // employee_id1=-1;
        // employeename1="All";

      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id3.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          employee_name3= responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
        });

      }

    }
    if(employee_id3==1)
    {
      setState(() {
        employee_name3='Freelancer';
        payrate3='';
        clientpayrate3='';
      });
    }

  }
  void _getfilteremployee4(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecteremployee1(
          clientidfromfirstpage:clientid.toString(),
          departmentidfromfirstpage:departmentid.toString(),
          registerasidfromfirstpage:jobtitleid.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        employee_id4 = int.parse(result);
      }
      else
      {
        // employee_id1=-1;
        // employeename1="All";

      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id4.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          employee_name4= responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
        });

      }

    }
    if(employee_id4==1)
    {
      setState(() {
        employee_name4='Freelancer';
        payrate4='';
        clientpayrate4='';
      });
    }

  }
  void _getfilteremployee5(BuildContext context) async {
    final result = await  Navigator.of(context).push(
        MaterialPageRoute(builder:(context)=>Selecteremployee1(
          clientidfromfirstpage:clientid.toString(),
          departmentidfromfirstpage:departmentid.toString(),
          registerasidfromfirstpage:jobtitleid.toString(),
          backgroundcolor: widget.backgroundcolor,
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
        employee_id5 = int.parse(result);
      }
      else
      {
        // employee_id1=-1;
        // employeename1="All";

      }
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+employee_id5.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          employee_name5= responseBody['profile'][0]['first_name']+" "+responseBody['profile'][0]['last_name'];
        });

      }

    }

    if(employee_id5==1)
    {
      setState(() {
        employee_name5='Freelancer';
        payrate5='';
        clientpayrate5='';
      });
    }

  }





}

