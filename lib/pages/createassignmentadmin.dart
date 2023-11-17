//@dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:mijnzpc/pages/selecters/selecteragreement.dart';
import 'package:mijnzpc/pages/selecters/selecterclient.dart';
import 'package:mijnzpc/pages/selecters/selecterdepartment.dart';
import 'package:mijnzpc/pages/selecters/selecteremployee1.dart';
import 'package:mijnzpc/pages/selecters/selecterjobtitle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:date_time_picker/date_time_picker.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/pages/select_language_secreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mijnzpc/all_translations.dart';
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


class createassignmentadmin extends StatefulWidget{


  createassignmentadmin(
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
  State<StatefulWidget> createState() {
    return _createassignmentadmin();
  }
}



class _createassignmentadmin extends State<createassignmentadmin>{

  bool     confirmbtn= true;
  bool     confirmbtn2= false;


  int clientid=0;
  String clientname="Client";

  int departmentid=0;
  String departmentname="Department";

  int agreementid=0;
  String agreementname="Default agreement";


  
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

  TextEditingController date1 = TextEditingController();
  TextEditingController starttime1 = TextEditingController();
  TextEditingController endtime1 = TextEditingController();
  bool     sleepshift1 = false;
  bool     breake1 = false;
  bool     speedassignment1= false;

  TextEditingController date2 = TextEditingController();
  TextEditingController starttime2 = TextEditingController();
  TextEditingController endtime2 = TextEditingController();
  bool     sleepshift2 = false;
  bool     breake2 = false;
  bool     speedassignment2= false;

  TextEditingController date3 = TextEditingController();
  TextEditingController starttime3 = TextEditingController();
  TextEditingController endtime3 = TextEditingController();
  bool     sleepshift3 = false;
  bool     breake3 = false;
  bool     speedassignment3= false;

  TextEditingController date4 = TextEditingController();
  TextEditingController starttime4 = TextEditingController();
  TextEditingController endtime4 = TextEditingController();
  bool     sleepshift4 = false;
  bool     breake4 = false;
  bool     speedassignment4= false;

  TextEditingController date5 = TextEditingController();
  TextEditingController starttime5 = TextEditingController();
  TextEditingController endtime5 = TextEditingController();
  bool     sleepshift5 = false;
  bool     breake5 = false;
  bool     speedassignment5= false;

  TextEditingController date6 = TextEditingController();
  TextEditingController starttime6 = TextEditingController();
  TextEditingController endtime6 = TextEditingController();
  bool     sleepshift6 = false;
  bool     breake6 = false;
  bool     speedassignment6= false;

  TextEditingController date7 = TextEditingController();
  TextEditingController starttime7 = TextEditingController();
  TextEditingController endtime7 = TextEditingController();
  bool     sleepshift7 = false;
  bool     breake7 = false;
  bool     speedassignment7= false;

  TextEditingController date8 = TextEditingController();
  TextEditingController starttime8 = TextEditingController();
  TextEditingController endtime8 = TextEditingController();
  bool     sleepshift8 = false;
  bool     breake8 = false;
  bool     speedassignment8= false;

  TextEditingController date9 = TextEditingController();
  TextEditingController starttime9 = TextEditingController();
  TextEditingController endtime9 = TextEditingController();
  bool     sleepshift9 = false;
  bool     breake9 = false;
  bool     speedassignment9= false;

  TextEditingController date10= TextEditingController();
  TextEditingController starttime10 = TextEditingController();
  TextEditingController endtime10 = TextEditingController();
  bool     sleepshift10 = false;
  bool     breake10 = false;
  bool     speedassignment10= false;

  TextEditingController date11 = TextEditingController();
  TextEditingController starttime11 = TextEditingController();
  TextEditingController endtime11 = TextEditingController();
  bool     sleepshift11 = false;
  bool     breake11 = false;
  bool     speedassignment11= false;

  TextEditingController date12 = TextEditingController();
  TextEditingController starttime12 = TextEditingController();
  TextEditingController endtime12 = TextEditingController();
  bool     sleepshift12 = false;
  bool     breake12 = false;
  bool     speedassignment12= false;

  TextEditingController date13 = TextEditingController();
  TextEditingController starttime13 = TextEditingController();
  TextEditingController endtime13 = TextEditingController();
  bool     sleepshift13 = false;
  bool     breake13 = false;
  bool     speedassignment13= false;

  TextEditingController date14 = TextEditingController();
  TextEditingController starttime14 = TextEditingController();
  TextEditingController endtime14 = TextEditingController();
  bool     sleepshift14 = false;
  bool     breake14 = false;
  bool     speedassignment14= false;

  TextEditingController date15 = TextEditingController();
  TextEditingController starttime15 = TextEditingController();
  TextEditingController endtime15 = TextEditingController();
  bool     sleepshift15 = false;
  bool     breake15 = false;
  bool     speedassignment15= false;

  TextEditingController date16 = TextEditingController();
  TextEditingController starttime16 = TextEditingController();
  TextEditingController endtime16 = TextEditingController();
  bool     sleepshift16 = false;
  bool     breake16 = false;
  bool     speedassignment16= false;

  TextEditingController date17 = TextEditingController();
  TextEditingController starttime17 = TextEditingController();
  TextEditingController endtime17 = TextEditingController();
  bool     sleepshift17 = false;
  bool     breake17 = false;
  bool     speedassignment17= false;

  TextEditingController date18 = TextEditingController();
  TextEditingController starttime18 = TextEditingController();
  TextEditingController endtime18 = TextEditingController();
  bool     sleepshift18 = false;
  bool     breake18 = false;
  bool     speedassignment18= false;

  TextEditingController date19 = TextEditingController();
  TextEditingController starttime19 = TextEditingController();
  TextEditingController endtime19 = TextEditingController();
  bool     sleepshift19 = false;
  bool     breake19 = false;
  bool     speedassignment19= false;



  int countemployee=1;
  int counttimes=1;


  bool checkedValue;



  String   shiftinfo='';


  bool visibilityemloyee2 = false;
  bool visibilityemloyee3 = false;
  bool visibilityemloyee4 = false;
  bool visibilityemloyee5 = false;


  bool visibilitytimes2 = false;
  bool visibilitytimes3 = false;
  bool visibilitytimes4 = false;
  bool visibilitytimes5 = false;
  bool visibilitytimes6 = false;
  bool visibilitytimes7 = false;
  bool visibilitytimes8 = false;
  bool visibilitytimes9 = false;
  bool visibilitytimes10 = false;
  bool visibilitytimes11 = false;
  bool visibilitytimes12 = false;
  bool visibilitytimes13 = false;
  bool visibilitytimes14 = false;
  bool visibilitytimes15 = false;
  bool visibilitytimes16 = false;
  bool visibilitytimes17 = false;
  bool visibilitytimes18 = false;
  bool visibilitytimes19 = false;
  bool visibilitytimes20 = false;



  bool showstatus = false;


  void _changedtimes(bool visibility, String amalgar) {
    setState(() {
      print(counttimes);

      if(counttimes==1)
      {
        if(amalgar=='ziad'){ visibilitytimes2 = visibility; counttimes++; } else { visibilitytimes2 = visibility;  }
      }
      else
      if(counttimes==2)
      {
        if(amalgar=='ziad'){ visibilitytimes3 = visibility; counttimes++; } else { visibilitytimes2 = visibility; counttimes--; }
      }
      else
      if(counttimes==3)
      {
        if(amalgar=='ziad'){ visibilitytimes4 = visibility; counttimes++; } else { visibilitytimes3 = visibility; counttimes--; }
      }
      else
      if(counttimes==4)
      {
        if(amalgar=='ziad'){ visibilitytimes5 = visibility; counttimes++; } else { visibilitytimes4 = visibility; counttimes--; }
      }
      else
      if(counttimes==5)
      {
        if(amalgar=='ziad'){ visibilitytimes6 = visibility; counttimes++; } else { visibilitytimes5 = visibility; counttimes--; }
      }
      else
      if(counttimes==6)
      {
        if(amalgar=='ziad'){ visibilitytimes7 = visibility; counttimes++; } else { visibilitytimes6 = visibility; counttimes--; }
      }
      else
      if(counttimes==7)
      {
        if(amalgar=='ziad'){ visibilitytimes8 = visibility; counttimes++; } else { visibilitytimes7 = visibility; counttimes--; }
      }
      else
      if(counttimes==8)
      {
        if(amalgar=='ziad'){ visibilitytimes9 = visibility; counttimes++; } else { visibilitytimes8 = visibility; counttimes--; }
      }
      else
      if(counttimes==9)
      {
        if(amalgar=='ziad'){ visibilitytimes10 = visibility; counttimes++; } else { visibilitytimes9 = visibility; counttimes--; }
      }
      else
      if(counttimes==10)
      {
        if(amalgar=='ziad'){ visibilitytimes11 = visibility; counttimes++; } else { visibilitytimes10 = visibility; counttimes--; }
      }
      else
      if(counttimes==11)
      {
        if(amalgar=='ziad'){ visibilitytimes12 = visibility; counttimes++; } else { visibilitytimes11 = visibility; counttimes--; }
      }
      else
      if(counttimes==12)
      {
        if(amalgar=='ziad'){ visibilitytimes13 = visibility; counttimes++; } else { visibilitytimes12 = visibility; counttimes--; }
      }
      else
      if(counttimes==13)
      {
        if(amalgar=='ziad'){ visibilitytimes14 = visibility; counttimes++; } else { visibilitytimes13 = visibility; counttimes--; }
      }
      else
      if(counttimes==14)
      {
        if(amalgar=='ziad'){ visibilitytimes15 = visibility; counttimes++; } else { visibilitytimes14 = visibility; counttimes--; }
      }
      else
      if(counttimes==15)
      {
        if(amalgar=='ziad'){ visibilitytimes16 = visibility; counttimes++; } else { visibilitytimes15 = visibility; counttimes--; }
      }
      else
      if(counttimes==16)
      {
        if(amalgar=='ziad'){ visibilitytimes17 = visibility; counttimes++; } else { visibilitytimes16 = visibility; counttimes--; }
      }
      else
      if(counttimes==17)
      {
        if(amalgar=='ziad'){ visibilitytimes18 = visibility; counttimes++; } else { visibilitytimes17 = visibility; counttimes--; }
      }
      else
      if(counttimes==18)
      {
        if(amalgar=='ziad'){ visibilitytimes19 = visibility; counttimes++; } else { visibilitytimes18 = visibility; counttimes--; }
      }
      else
      if(counttimes==19)
      {
        if(amalgar=='ziad'){  } else { visibilitytimes19 = visibility; counttimes--; }
      }
      print(counttimes);



    });
  }



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

    checkshowstatus();
  }


  @override
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZPC',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Vazir',
          hintColor: Colors.green,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: new Color(0xff075E54),
          accentColor:  new Color(0xff25d366)
      ),
      localizationsDelegates: [
        // TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: allTranslations.supportedLocales(),
      home: new Scaffold(
        backgroundColor: widget.backgroundcolor,
        appBar: new AppBar(
          leading: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.arrow_back),
            // iconSize: 48,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Create Assignment'),style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),


         
      
        body: new SingleChildScrollView(
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
                        child:Text(allTranslations.text('Cost Section : ')+costsection,style: TextStyle(fontSize:16, color: Colors.grey[700]),),),




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
                    child:TextFormField(
                      style: TextStyle(color: widget.textcolor),
                      onChanged: (text){shiftinfo=text;},
                      decoration: InputDecoration(
                        hintText: allTranslations.text("Shift information"),
                        hintStyle: TextStyle(color: Colors.grey[700],fontSize:16),
                        // prefixIcon: Icon(Icons.people,color: Colors.grey,),
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                        filled: true, //<-- SEE HERE
                        fillColor: widget.backgroundcolor, //<-- SEE HERE
                      ),
                      textAlign: TextAlign.left,

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
                          padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
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
                                      child: Text(allTranslations.text('Delete' ),textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
                                    ),
                                  )
                              )





                          ),


                        ),
                      ),


                    ]
                ) : new Container(),






                //boxdate 1
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
                    child: Padding(
                      padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                              style: TextStyle(fontSize: 14,
                                                color: widget.color,
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
                //boxdate 1

                //boxdate 2
                visibilitytimes2 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date2, //editing controller of this TextField
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
                                          selectDate(context,2);
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
                                        controller: starttime2, //editing controller of this TextField
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
                                            var hourse ='0';
                                            hourse = gettime(pickedTime.format(context));
                                            setState(() {
                                              starttime2.text =hourse;
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
                                        controller: endtime2, //editing controller of this TextField
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
                                              endtime2.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                    value: sleepshift2,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift2 = value;
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
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake2,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake2 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 2

                //boxdate 3
                visibilitytimes3 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date3, //editing controller of this TextField
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
                                          selectDate(context,3);
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
                                        controller: starttime3, //editing controller of this TextField
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
                                            var hourse ='0';
                                            hourse = gettime(pickedTime.format(context));
                                            setState(() {
                                              starttime3.text =hourse;
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
                                        controller: endtime3, //editing controller of this TextField
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
                                              endtime3.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                    value: sleepshift3,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift3 = value;
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
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake3,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake3 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 3

                //boxdate 4
                visibilitytimes4 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date4, //editing controller of this TextField
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
                                          selectDate(context,4);
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
                                        controller: starttime4, //editing controller of this TextField
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
                                            var hourse ='0';
                                            hourse = gettime(pickedTime.format(context));
                                            setState(() {
                                              starttime4.text =hourse;
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
                                        controller: endtime4, //editing controller of this TextField
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
                                              endtime4.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                    value: sleepshift4,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift4 = value;
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
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake4,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake4 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 4

                //boxdate 5
                visibilitytimes5 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date5, //editing controller of this TextField
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
                                          selectDate(context,5);
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
                                        controller: starttime5, //editing controller of this TextField
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
                                            var hourse ='0';
                                            hourse = gettime(pickedTime.format(context));
                                            setState(() {
                                              starttime5.text =hourse;
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
                                        controller: endtime5, //editing controller of this TextField
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
                                              endtime5.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                    value: sleepshift5,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift5 = value;
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
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake5,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake5 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 5

                //boxdate 6
                visibilitytimes6 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date6, //editing controller of this TextField
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
                                          selectDate(context,6);
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
                                        controller: starttime6, //editing controller of this TextField
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
                                            var hourse ='0';
                                            hourse = gettime(pickedTime.format(context));
                                            setState(() {
                                              starttime6.text =hourse;
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
                                        controller: endtime6, //editing controller of this TextField
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
                                              endtime6.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                    value: sleepshift6,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift6 = value;
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
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake6,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake6 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 6

                //boxdate 7
                visibilitytimes7 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date7, //editing controller of this TextField
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
                                          selectDate(context,7);
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
                                        controller: starttime7, //editing controller of this TextField
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
                                            var hourse ='0';
                                            hourse = gettime(pickedTime.format(context));
                                            setState(() {
                                              starttime7.text =hourse;
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
                                        controller: endtime7, //editing controller of this TextField
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
                                              endtime7.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                    value: sleepshift7,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift7 = value;
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
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake7,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake7 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 7

                //boxdate 8
                visibilitytimes8 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date8, //editing controller of this TextField
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
                                          selectDate(context,8);
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
                                        controller: starttime8, //editing controller of this TextField
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
                                              starttime8.text =hourse;
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
                                        controller: endtime8, //editing controller of this TextField
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
                                              endtime8.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                    value: sleepshift8,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift8 = value;
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
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake8,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake8 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 8

                //boxdate 9
                visibilitytimes9 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date9, //editing controller of this TextField
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
                                          selectDate(context,9);
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
                                        controller: starttime9, //editing controller of this TextField
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
                                              starttime9.text =hourse;
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
                                        controller: endtime9, //editing controller of this TextField
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
                                              endtime9.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift9,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift9 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake9,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake9 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 9

                //boxdate 10
                visibilitytimes10 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date10, //editing controller of this TextField
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
                                          selectDate(context,10);
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
                                        controller: starttime10, //editing controller of this TextField
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
                                              starttime10.text =hourse;
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
                                        controller: endtime10, //editing controller of this TextField
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
                                              endtime10.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift10,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift10 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake10,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake10 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 10

                //boxdate 11
                visibilitytimes11 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date11, //editing controller of this TextField
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
                                          selectDate(context,11);
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
                                        controller: starttime11, //editing controller of this TextField
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
                                              starttime11.text =hourse;
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
                                        controller: endtime11, //editing controller of this TextField
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
                                              endtime11.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift11,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift11 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake11,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake11 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 11

                //boxdate 12
                visibilitytimes12 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date12, //editing controller of this TextField
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
                                          selectDate(context,12);
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
                                        controller: starttime12, //editing controller of this TextField
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
                                              starttime12.text =hourse;
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
                                        controller: endtime12, //editing controller of this TextField
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
                                              endtime12.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift12,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift12 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake12,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake12 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 12


                //boxdate 13
                visibilitytimes13 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date13, //editing controller of this TextField
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
                                          selectDate(context,13);
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
                                        controller: starttime13, //editing controller of this TextField
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
                                              starttime13.text =hourse;
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
                                        controller: endtime13, //editing controller of this TextField
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(Icons.timer,color: Colors.grey[700],), //icon of text field
                                          labelText:allTranslations.text( "To"),
                                          labelStyle: TextStyle(
                                            color: Colors.grey[700], //<-- SEE HERE
                                          ),
                                        ),
                                        readOnly: true,  //set it true, so that user will not able to edit text
                                        onTap: () async {
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
                                              endtime13.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift13,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift13 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake13,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake13 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 13

                //boxdate 14
                visibilitytimes14 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date14, //editing controller of this TextField
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
                                          selectDate(context,14);
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
                                        controller: starttime14, //editing controller of this TextField
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
                                              starttime14.text =hourse;
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
                                        controller: endtime14, //editing controller of this TextField
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
                                              endtime14.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift14,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift14 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake14,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake14 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 14

                //boxdate 15
                visibilitytimes15 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date15, //editing controller of this TextField
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
                                          selectDate(context,15);
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
                                        controller: starttime15, //editing controller of this TextField
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
                                              starttime15.text =hourse;
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
                                        controller: endtime15, //editing controller of this TextField
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
                                              endtime15.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift15,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift15 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake15,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake15 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 15


                //boxdate 16
                visibilitytimes16 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date16, //editing controller of this TextField
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
                                          selectDate(context,16);
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
                                        controller: starttime16, //editing controller of this TextField
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
                                              starttime16.text =hourse;
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
                                        controller: endtime16, //editing controller of this TextField
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
                                              endtime16.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift16,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift16 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake16,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake16 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 16

                //boxdate 17
                visibilitytimes17 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date17, //editing controller of this TextField
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
                                          selectDate(context,17);
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
                                        controller: starttime17, //editing controller of this TextField
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
                                              starttime17.text =hourse;
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
                                        controller: endtime17, //editing controller of this TextField
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
                                              endtime17.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift17,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift17 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake17,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake17 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 17


                //boxdate 18
                visibilitytimes18 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date18, //editing controller of this TextField
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
                                          selectDate(context,18);
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
                                        controller: starttime18, //editing controller of this TextField
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
                                              starttime18.text =hourse;
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
                                        controller: endtime18, //editing controller of this TextField
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
                                              endtime18.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift18,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift18 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake18,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake18 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 18

                //boxdate 19
                visibilitytimes19 ?Container(
                  child:  new Column(
                    children: <Widget>[
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
                                        controller: date19, //editing controller of this TextField
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
                                          selectDate(context,19);
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
                                        controller: starttime19, //editing controller of this TextField
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
                                            initialTime: TimeOfDay(hour: dt.hour, minute: dt.minute),
                                            builder: (context, child) {
                                              return gettheme(context,child);
                                            },
                                          );

                                          if(pickedTime != null ){
                                            var hourse ='0';
                                            hourse = gettime(pickedTime.format(context));
                                            setState(() {
                                              starttime19.text =hourse;
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
                                        controller: endtime19, //editing controller of this TextField
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
                                              endtime19.text =hourse;
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
                          child: Padding(
                            padding: EdgeInsets.only(top:0,left: 15,right: 15,bottom: 0),
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
                                                child: Text("sleep shift",
                                                    style: TextStyle(fontSize: 14,    color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: sleepshift19,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        sleepshift19 = value;
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
                                                child: Text("break",
                                                    style: TextStyle(fontSize: 14,
                                                      color: widget.color,
                                                      fontWeight: FontWeight.w700,)),
                                              ),

                                              Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child: Switch(
                                                    value: breake19,
                                                    inactiveThumbColor:Colors.grey[500],
                                                    inactiveTrackColor: Colors.grey[500],
                                                    activeColor: Colors.white,
                                                    activeTrackColor:  Colors.grey,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        breake19 = value;
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
                    ],
                  ),
                ):Container(),
                //boxdate 19

                new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Expanded(
                        flex: 30,
                        child:  Padding(
                          padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
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
                                    _changedtimes(true, "ziad");
                                  },
                                  child: Padding(
                                    padding:EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child:Center(
                                      child: Text(allTranslations.text('Add date') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 15)),
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
                                    _changedtimes(false, "kam");
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
                ),
                Container(
                  decoration:   BoxDecoration(
                    color:widget.backgroundcolor,
                  ),
                  child:


                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[


                        Expanded(
                          flex: 10,
                          child:   Padding(
                            padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                            child:  SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 48,
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
                                  child:
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      confirmbtn ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            //make color or elevated button transparent
                                          ),

                                          onPressed: (){

                                            if(jobtitleid==0)
                                            {
                                              return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return  new AlertDialog(
                                                      backgroundColor: widget.bottombarcolor,
                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
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
                                                    );
                                                  }
                                              ) ?? false;
                                            }
                                            if(clientid==0)
                                            {
                                              return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return  new AlertDialog(
                                                      backgroundColor: widget.bottombarcolor,
                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
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
                                                    );
                                                  }
                                              ) ?? false;
                                            }
                                            if(departmentid==0)
                                            {
                                              return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return new AlertDialog(
                                                      backgroundColor: widget.bottombarcolor,
                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
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
                                                    );
                                                  }
                                              ) ?? false;
                                            }

                                            if(agreementid==0)
                                            {
                                              return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return new AlertDialog(
                                                      backgroundColor: widget.bottombarcolor,
                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                      content: new Text(allTranslations.text("please select agreement"),style: TextStyle(color: Colors.grey)),
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
                                                    );
                                                  }
                                              ) ?? false;
                                            }
                                            if(date1.text=='')
                                            {
                                              return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return new AlertDialog(
                                                      backgroundColor: widget.bottombarcolor,
                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
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
                                                    );
                                                  }
                                              ) ?? false;
                                            }
                                            if(starttime1.text=='')
                                            {
                                              return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return new AlertDialog(
                                                      backgroundColor: widget.bottombarcolor,
                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
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
                                                    );
                                                  }
                                              ) ?? false;
                                            }
                                            if(endtime1.text=='')
                                            {
                                              return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return new AlertDialog(
                                                      backgroundColor: widget.bottombarcolor,
                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
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
                                                    );
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
                                                      child:   new AlertDialog(
                                                        backgroundColor: widget.bottombarcolor,
                                                        title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                        content: new Text(allTranslations.text('You are about to create a assignment. Proceed?'),style: TextStyle(color: Colors.grey)),
                                                        actions: <Widget>[
                                                          new FlatButton(
                                                              onPressed: () => Navigator.of(context).pop(false),
                                                              child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                                          ),
                                                          new FlatButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  confirmbtn=false;
                                                                  confirmbtn2=true;
                                                                });

                                                                sendData();
                                                                Navigator.pop(context);
                                                              },
                                                              child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                                          ),
                                                        ],
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
                                      ):new Container(),
                                      confirmbtn2 ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            //make color or elevated button transparent
                                          ),

                                          onPressed: (){
                                          },
                                          child: Padding(
                                            padding:EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                            ),
                                            child:Center(
                                              child: Text(allTranslations.text('in Process') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                            ),
                                          )
                                      ):new Container(),
                                    ],
                                  ),



                                )

                            ),


                          ) ,
                        ),









                      ]
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


              ],
            ),
          ),

        ),









      ),
    );
  }



  sendData() async {
    print(counttimes);
    Map response = await (new AuthService()).sendDataToinsertassignment({
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
      "date2" :date2.text,
      "starttime2" :starttime2.text,
      "endtime2" :endtime2.text,
      "sleepshift2" :sleepshift2.toString(),
      "break2" :breake2.toString(),
      "speedasignment2" :speedassignment2.toString(),
      "date3" :date3.text,
      "starttime3" :starttime3.text,
      "endtime3" :endtime3.text,
      "sleepshift3" :sleepshift3.toString(),
      "break3" :breake3.toString(),
      "speedasignment3" :speedassignment3.toString(),
      "date4" :date4.text,
      "starttime4" :starttime4.text,
      "endtime4" :endtime4.text,
      "sleepshift4" :sleepshift4.toString(),
      "break4" :breake4.toString(),
      "speedasignment4":speedassignment4.toString(),
      "date5" :date5.text,
      "starttime5" :starttime5.text,
      "endtime5" :endtime5.text,
      "sleepshift5" :sleepshift5.toString(),
      "break5" :breake5.toString(),
      "speedasignment5" :speedassignment5.toString(),
      "date6" :date6.text,
      "starttime6" :starttime6.text,
      "endtime6" :endtime6.text,
      "sleepshift6" :sleepshift6.toString(),
      "break6" :breake6.toString(),
      "speedasignment6" :speedassignment6.toString(),
      "date7" :date7.text,
      "starttime7" :starttime7.text,
      "endtime7" :endtime7.text,
      "sleepshift7" :sleepshift7.toString(),
      "break7" :breake7.toString(),
      "speedasignment7" :speedassignment7.toString(),
      "date8" :date8.text,
      "starttime8" :starttime8.text,
      "endtime8" :endtime8.text,
      "sleepshift8" :sleepshift8.toString(),
      "break8" :breake8.toString(),
      "speedasignment8" :speedassignment8.toString(),
      "date9" :date9.text,
      "starttime9" :starttime9.text,
      "endtime9" :endtime9.text,
      "sleepshift9" :sleepshift9.toString(),
      "break9" :breake9.toString(),
      "speedasignment9" :speedassignment9.toString(),
      "date10" :date10.text,
      "starttime10" :starttime10.text,
      "endtime10" :endtime10.text,
      "sleepshift10" :sleepshift10.toString(),
      "break10" :breake10.toString(),
      "speedasignment10" :speedassignment10.toString(),
      "date11" :date11.text,
      "starttime11" :starttime11.text,
      "endtime11" :endtime11.text,
      "sleepshift11" :sleepshift11.toString(),
      "break11" :breake11.toString(),
      "speedasignment11" :speedassignment11.toString(),
      "date12" :date12.text,
      "starttime12" :starttime12.text,
      "endtime12" :endtime12.text,
      "sleepshift12" :sleepshift12.toString(),
      "break12" :breake12.toString(),
      "speedasignment12" :speedassignment12.toString(),
      "date13" :date13.text,
      "starttime13" :starttime13.text,
      "endtime13" :endtime13.text,
      "sleepshift13" :sleepshift13.toString(),
      "break13" :breake13.toString(),
      "speedasignment13" :speedassignment13.toString(),
      "date14" :date14.text,
      "starttime14" :starttime14.text,
      "endtime14" :endtime14.text,
      "sleepshift14" :sleepshift14.toString(),
      "break14" :breake14.toString(),
      "speedasignment14" :speedassignment14.toString(),
      "date15" :date15.text,
      "starttime15" :starttime15.text,
      "endtime15" :endtime15.text,
      "sleepshift15" :sleepshift15.toString(),
      "break15" :breake15.toString(),
      "speedasignment15" :speedassignment15.toString(),
      "date16" :date16.text,
      "starttime16" :starttime16.text,
      "endtime16" :endtime16.text,
      "sleepshift16" :sleepshift16.toString(),
      "break16" :breake16.toString(),
      "speedasignment16" :speedassignment16.toString(),
      "date17" :date17.text,
      "starttime17" :starttime17.text,
      "endtime17" :endtime17.text,
      "sleepshift17" :sleepshift17.toString(),
      "break17" :breake17.toString(),
      "speedasignment17" :speedassignment17.toString(),
      "date18" :date18.text,
      "starttime18" :starttime18.text,
      "endtime18" :endtime18.text,
      "sleepshift18" :sleepshift18.toString(),
      "break18" :breake18.toString(),
      "speedasignment18" :speedassignment18.toString(),
      "date19" :date19.text,
      "starttime19" :starttime19.text,
      "endtime19" :endtime19.text,
      "sleepshift19" :sleepshift19.toString(),
      "break19" :breake19.toString(),
      "speedasignment19" :speedassignment19.toString(),
      "countemployee" :countemployee.toString(),
      "counttimes" :counttimes.toString(),
    });
    print('fdfdfdfdfd');
    print(response);
    // if(response['code']=='0' || response['code']=='0')//has error
    //     {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return   new Container(
              decoration:   BoxDecoration(
                color:widget.backgroundcolor,
              ),
              child:WillPopScope(
              onWillPop: () async => false, // False will prevent and true will allow to dismiss
          child:

              new AlertDialog(
                backgroundColor: widget.bottombarcolor,
                title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                content: new Text(allTranslations.text(response['msg'].toString()),style: TextStyle(color: Colors.grey)),
                actions: <Widget>[

                  new FlatButton(
                      onPressed: () {

                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => super.widget));

                      },
                      child: new Text(allTranslations.text('Close'), style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),)
                  ),




                  // new FlatButton(
                  //     onPressed: () {
                  //
                  //       setState(() {
                  //         confirmbtn = true;
                  //         confirmbtn2 = false;
                  //       });
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: new Text(allTranslations.text('Close'), style: TextStyle(
                  //         fontWeight: FontWeight.bold, color: Colors.red),)
                  // ),
                ],
              ),),
          );
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
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+clientid.toString()+'&registeras='+jobtitlename.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        setState(() {
          clientname= responseBody['profile'][0]['company_name'];
          agreementid= responseBody['agreement']['id'];
          agreementname= responseBody['agreement']['title'];
        });

        print(agreementid);
        print(agreementname);

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
          costsection=responseBody['department'][0]['cost'].toString();
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

      String url2 ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id1.toString()+'&client_id='+clientid.toString();
      print(url2);
      final response2 = await http.get(Uri.parse(url2),);
      if(response2.statusCode == 200) {
        var responseBody2 = json.decode(response2.body)['data'];
        print(responseBody2);

        if(employee_id1>1){
          setState(() {
            payrate1=responseBody2['joinclient'][0]['payrate'].toString();
            clientpayrate1=responseBody2['joinclient'][0]['client_payrate'].toString();
          });
        }



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

      String url2 ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id2.toString()+'&client_id='+clientid.toString();
      print(url2);
      final response2 = await http.get(Uri.parse(url2),);
      if(response2.statusCode == 200) {
        var responseBody2 = json.decode(response2.body)['data'];
        if(employee_id2>1) {
          setState(() {
            payrate2 = responseBody2['joinclient'][0]['payrate'].toString();
            clientpayrate2 =
                responseBody2['joinclient'][0]['client_payrate'].toString();
          });
        }
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

      String url2 ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id3.toString()+'&client_id='+clientid.toString();
      print(url2);
      final response2 = await http.get(Uri.parse(url2),);
      if(response2.statusCode == 200) {
        var responseBody2 = json.decode(response2.body)['data'];
        if(employee_id3>1) {
          setState(() {
            payrate3 = responseBody2['joinclient'][0]['payrate'].toString();
            clientpayrate3 =
                responseBody2['joinclient'][0]['client_payrate'].toString();
          });
        }

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

      String url2 ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id4.toString()+'&client_id='+clientid.toString();
      print(url2);
      final response2 = await http.get(Uri.parse(url2),);
      if(response2.statusCode == 200) {
        var responseBody2 = json.decode(response2.body)['data'];
        if(employee_id4>1) {
          setState(() {
            payrate4 = responseBody2['joinclient'][0]['payrate'].toString();
            clientpayrate4 =
                responseBody2['joinclient'][0]['client_payrate'].toString();
          });
        }
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

      String url2 ='https://mijnzpc.com/api/v1/getpayrate?token='+token+'&freelancer_id='+employee_id5.toString()+'&client_id='+clientid.toString();
      print(url2);
      final response2 = await http.get(Uri.parse(url2),);
      if(response2.statusCode == 200) {
        var responseBody2 = json.decode(response2.body)['data'];
        if(employee_id5>1) {
          setState(() {
            payrate5 = responseBody2['joinclient'][0]['payrate'].toString();
            clientpayrate5 =
                responseBody2['joinclient'][0]['client_payrate'].toString();
          });
        }
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


  checkshowstatus()async{
    final prefs = await SharedPreferences.getInstance();
    var type = prefs.getString('user.type');
    var user_id = prefs.getInt('user.id');

    if(type=='EMPLOYEE')
    {
      setState(() {
        showstatus = false;
        employee_id1=user_id;
        agreementid=21;
      });
    }
    else
    if(type=='ADMIN')
    {
      setState(() {
        showstatus = true;
        agreementid=21;
      });
    }


  }

  goback(){
    print('2');
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
    if(variable==2){
      setState(() {
        date2.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==3){
      setState(() {
        date3.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==4){
      setState(() {
        date4.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==5){
      setState(() {
        date5.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==6){
      setState(() {
        date6.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==7){
      setState(() {
        date7.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==8){
      setState(() {
        date8.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==9){
      setState(() {
        date9.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==10){
      setState(() {
        date10.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==11){
      setState(() {
        date11.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==12){
      setState(() {
        date12.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }     if(variable==13){
      setState(() {
        date13.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==14){
      setState(() {
        date14.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==15){
      setState(() {
        date15.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==16){
      setState(() {
        date16.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==17){
      setState(() {
        date17.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==18){
      setState(() {
        date18.text = "${picked.year}-${selectedmont}-${selectedday}";
      });
    }
    if(variable==19){
      setState(() {
        date19.text = "${picked.year}-${selectedmont}-${selectedday}";
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
}



