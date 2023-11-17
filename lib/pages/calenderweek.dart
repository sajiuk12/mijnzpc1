//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_1.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_2.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_3.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_4.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_5.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_6.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_7.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_8.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_9.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_10.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_11.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_12.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_13.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_14.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_15.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_16.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_17.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_18.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_19.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_20.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_21.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_22.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_23.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_24.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_25.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_26.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_27.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_28.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_29.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_30.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_31.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_32.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_33.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_34.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_35.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_36.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_37.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_38.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_39.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_40.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_41.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_42.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_43.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_44.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_45.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_46.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_47.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_48.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_49.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_50.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_51.dart';
import 'package:mijnzpc/components/weeks/2023/week2023_52.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/pages/calendermonth.dart';
class Calenderweek extends StatefulWidget {

  Calenderweek(
      {@required this.data,this.backgroundcolor,
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

  List<Massignment> data;

  @override
  State<StatefulWidget> createState() => new CalenderweekState();

}

class CalenderweekState extends State<Calenderweek> with AutomaticKeepAliveClientMixin<Calenderweek> {
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


  var key2023_1 = GlobalKey();
  var key2023_2 = GlobalKey();
  var key2023_3 = GlobalKey();
  var key2023_4 = GlobalKey();
  var key2023_5 = GlobalKey();
  var key2023_6 = GlobalKey();
  var key2023_7 = GlobalKey();
  var key2023_8 = GlobalKey();
  var key2023_9 = GlobalKey();
  var key2023_10 = GlobalKey();
  var key2023_11 = GlobalKey();
  var key2023_12 = GlobalKey();
  var key2023_13 = GlobalKey();
  var key2023_14 = GlobalKey();
  var key2023_15 = GlobalKey();
  var key2023_16 = GlobalKey();
  var key2023_17 = GlobalKey();
  var key2023_18 = GlobalKey();
  var key2023_19 = GlobalKey();
  var key2023_20 = GlobalKey();
  var key2023_21 = GlobalKey();
  var key2023_22 = GlobalKey();
  var key2023_23 = GlobalKey();
  var key2023_24 = GlobalKey();
  var key2023_25 = GlobalKey();
  var key2023_26 = GlobalKey();
  var key2023_27 = GlobalKey();
  var key2023_28 = GlobalKey();
  var key2023_29 = GlobalKey();
  var key2023_30 = GlobalKey();
  var key2023_31 = GlobalKey();
  var key2023_32 = GlobalKey();
  var key2023_33 = GlobalKey();
  var key2023_34 = GlobalKey();
  var key2023_35 = GlobalKey();
  var key2023_36 = GlobalKey();
  var key2023_37 = GlobalKey();
  var key2023_38 = GlobalKey();
  var key2023_39 = GlobalKey();
  var key2023_40 = GlobalKey();
  var key2023_41 = GlobalKey();
  var key2023_42 = GlobalKey();
  var key2023_43 = GlobalKey();
  var key2023_44 = GlobalKey();
  var key2023_45 = GlobalKey();
  var key2023_46 = GlobalKey();
  var key2023_47 = GlobalKey();
  var key2023_48 = GlobalKey();
  var key2023_49 = GlobalKey();
  var key2023_50 = GlobalKey();
  var key2023_51 = GlobalKey();
  var key2023_52 = GlobalKey();



  //  get data from server
  void initState() {
    getdet();
    print('wwwwwwwwwwww');
    etscrol();
    // super.initState();

  }
  //  get data from server


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
          child: new Text(allTranslations.text('Calendar'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
            child:
            Text('',style: TextStyle(color: Colors.grey,fontSize: 18),
            ),
          ),

          Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                cardColor: widget.backgroundcolor,
              ),
              child:   PopupMenuButton(
                // add icon, by default "3 dot" icon
                  icon: Icon(Icons.more_vert, color: Colors.grey,),
                  itemBuilder: (context){
                    return [
                      // PopupMenuItem<int>(
                      //   value: 0,
                      //   child: Text("Day"),
                      // ),

                      PopupMenuItem<int>(
                        value: 0,
                        child: Text(allTranslations.text("Week"),style:TextStyle(color: Colors.grey,)),
                      ),

                      PopupMenuItem<int>(
                        value: 1,
                        child: Text(allTranslations.text("Month"),style:TextStyle(color: Colors.grey,)),
                      ),
                    ];
                  },
                  onSelected:(value){
                    if(value == 0){
                    }else if(value == 1){
                      Navigator.pop(context);
                    }
                  }
              ),
            ),
          ),




        ],
      ),
      backgroundColor: widget.backgroundcolor,







      // backgroundColor:Colors.grey[300],
      body:

      SingleChildScrollView(
        child:

        Container(
          color: widget.backgroundcolor,
          child: Column(
            children: <Widget>[

              Container(
                key:key2023_1,
                child:
                new week2023_1(
                  hint: "Week 1",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'2 '+allTranslations.text('January')+' 2023','2023-01-02','02'
                  ],
                  day2 : [
                    'Theusday'  ,'3 '+allTranslations.text('January')+' 2023','2023-01-03','03'
                  ],
                  day3 : [
                    'Wednesday'  ,'4 '+allTranslations.text('January')+' 2023','2023-01-04','04'
                  ],
                  day4 : [
                    'Thursday'  ,'5 '+allTranslations.text('January')+' 2023','2023-01-05','05'
                  ],
                  day5 : [
                    'Friday'  ,'6 '+allTranslations.text('January')+' 2023','2023-01-06','06'
                  ],
                  day6 : [
                    'Saturday'  ,'7 '+allTranslations.text('January')+' 2023','2023-01-07','07'
                  ],
                  day7 : [
                    'Sunday'  ,'8 '+allTranslations.text('January')+' 2023','2023-01-08','08'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_2,
                child:
                new week2023_1(
                  hint: "Week 2",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'9 '+allTranslations.text('January')+' 2023','2023-01-09','09'
                  ],
                  day2 : [
                    'Theusday'  ,'10 '+allTranslations.text('January')+' 2023','2023-01-10','10'
                  ],
                  day3 : [
                    'Wednesday'  ,'11 '+allTranslations.text('January')+' 2023','2023-01-11','11'
                  ],
                  day4 : [
                    'Thursday'  ,'12 '+allTranslations.text('January')+' 2023','2023-01-12','12'
                  ],
                  day5 : [
                    'Friday'  ,'13 '+allTranslations.text('January')+' 2023','2023-01-13','13'
                  ],
                  day6 : [
                    'Saturday'  ,'14 '+allTranslations.text('January')+' 2023','2023-01-14','14'
                  ],
                  day7 : [
                    'Sunday'  ,'15 '+allTranslations.text('January')+' 2023','2023-01-15','15'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),),






              Container(
                key:key2023_3,
                child:
                new week2023_1(
                  hint: "Week 3",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'16 '+allTranslations.text('January')+' 2023','2023-01-16','16'
                  ],
                  day2 : [
                    'Theusday'  ,'17 '+allTranslations.text('January')+' 2023','2023-01-17','17'
                  ],
                  day3 : [
                    'Wednesday'  ,'18 '+allTranslations.text('January')+' 2023','2023-01-18','18'
                  ],
                  day4 : [
                    'Thursday'  ,'19 '+allTranslations.text('January')+' 2023','2023-01-19','19'
                  ],
                  day5 : [
                    'Friday'  ,'20 '+allTranslations.text('January')+' 2023','2023-01-20','20'
                  ],
                  day6 : [
                    'Saturday'  ,'21 '+allTranslations.text('January')+' 2023','2023-01-21','21'
                  ],
                  day7 : [
                    'Sunday'  ,'22 '+allTranslations.text('January')+' 2023','2023-01-22','22'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_4,
                child:
                new week2023_1(
                  hint: "Week 4",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'23 '+allTranslations.text('January')+' 2023','2023-01-23','23'
                  ],
                  day2 : [
                    'Theusday'  ,'24 '+allTranslations.text('January')+' 2023','2023-01-24','24'
                  ],
                  day3 : [
                    'Wednesday'  ,'25 '+allTranslations.text('January')+' 2023','2023-01-25','25'
                  ],
                  day4 : [
                    'Thursday'  ,'26 '+allTranslations.text('January')+' 2023','2023-01-26','26'
                  ],
                  day5 : [
                    'Friday'  ,'27 '+allTranslations.text('January')+' 2023','2023-01-27','27'
                  ],
                  day6 : [
                    'Saturday'  ,'28 '+allTranslations.text('January')+' 2023','2023-01-28','28'
                  ],
                  day7 : [
                    'Sunday'  ,'29 '+allTranslations.text('January')+' 2023','2023-01-29','29'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_5,
                child:
                new week2023_1(
                  hint: "Week 5",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'30 '+allTranslations.text('January')+' 2023','2023-01-30','30'
                  ],
                  day2 : [
                    'Theusday'  ,'31 '+allTranslations.text('January')+' 2023','2023-01-31','31'
                  ],
                  day3 : [
                    'Wednesday'  ,'1 '+allTranslations.text('February')+' 2023','2023-02-01','01'
                  ],
                  day4 : [
                    'Thursday'  ,'2 '+allTranslations.text('February')+' 2023','2023-02-02','02'
                  ],
                  day5 : [
                    'Friday'  ,'3 '+allTranslations.text('February')+' 2023','2023-02-03','03'
                  ],
                  day6 : [
                    'Saturday'  ,'4 '+allTranslations.text('February')+' 2023','2023-02-04','04'
                  ],
                  day7 : [
                    'Sunday'  ,'5 '+allTranslations.text('February')+' 2023','2023-02-05','05'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_6,
                child:
                new week2023_1(
                  hint: "Week 6",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'6 '+allTranslations.text('February')+' 2023','2023-02-06','06'
                  ],
                  day2 : [
                    'Theusday'  ,'7 '+allTranslations.text('February')+' 2023','2023-02-07','07'
                  ],
                  day3 : [
                    'Wednesday'  ,'8 '+allTranslations.text('February')+' 2023','2023-02-08','08'
                  ],
                  day4 : [
                    'Thursday'  ,'9 '+allTranslations.text('February')+' 2023','2023-02-09','09'
                  ],
                  day5 : [
                    'Friday'  ,'10 '+allTranslations.text('February')+' 2023','2023-02-10','10'
                  ],
                  day6 : [
                    'Saturday'  ,'11 '+allTranslations.text('February')+' 2023','2023-02-11','11'
                  ],
                  day7 : [
                    'Sunday'  ,'12 '+allTranslations.text('February')+' 2023','2023-02-12','12'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_7,
                child:
                new week2023_1(
                  hint: "Week 7",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'13 '+allTranslations.text('February')+' 2023','2023-02-13','13'
                  ],
                  day2 : [
                    'Theusday'  ,'14 '+allTranslations.text('February')+' 2023','2023-02-14','14'
                  ],
                  day3 : [
                    'Wednesday'  ,'15 '+allTranslations.text('February')+' 2023','2023-02-15','15'
                  ],
                  day4 : [
                    'Thursday'  ,'16 '+allTranslations.text('February')+' 2023','2023-02-16','16'
                  ],
                  day5 : [
                    'Friday'  ,'17 '+allTranslations.text('February')+' 2023','2023-02-17','17'
                  ],
                  day6 : [
                    'Saturday'  ,'18 '+allTranslations.text('February')+' 2023','2023-02-18','18'
                  ],
                  day7 : [
                    'Sunday'  ,'19 '+allTranslations.text('February')+' 2023','2023-02-19','19'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),






              Container(
                key:key2023_8,
                child:
                new week2023_1(
                  hint: "Week 8",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'20 '+allTranslations.text('February')+' 2023','2023-02-20','20'
                  ],
                  day2 : [
                    'Theusday'  ,'21 '+allTranslations.text('February')+' 2023','2023-02-21','21'
                  ],
                  day3 : [
                    'Wednesday'  ,'22 '+allTranslations.text('February')+' 2023','2023-02-22','22'
                  ],
                  day4 : [
                    'Thursday'  ,'23 '+allTranslations.text('February')+' 2023','2023-02-23','23'
                  ],
                  day5 : [
                    'Friday'  ,'24 '+allTranslations.text('February')+' 2023','2023-02-24','24'
                  ],
                  day6 : [
                    'Saturday'  ,'25 '+allTranslations.text('February')+' 2023','2023-02-25','25'
                  ],
                  day7 : [
                    'Sunday'  ,'26 '+allTranslations.text('February')+' 2023','2023-02-26','26'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),






              Container(
                key:key2023_9,
                child:
                new week2023_1(
                  hint: "Week 9",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'27 '+allTranslations.text('February')+' 2023','2023-02-27','27'
                  ],
                  day2 : [
                    'Theusday'  ,'28 '+allTranslations.text('February')+' 2023','2023-02-28','28'
                  ],
                  day3 : [
                    'Wednesday'  ,'1 '+allTranslations.text('March')+' 2023','2023-03-01','01'
                  ],
                  day4 : [
                    'Thursday'  ,'2 '+allTranslations.text('March')+' 2023','2023-03-02','02'
                  ],
                  day5 : [
                    'Friday'  ,'3 '+allTranslations.text('March')+' 2023','2023-03-03','03'
                  ],
                  day6 : [
                    'Saturday'  ,'4 '+allTranslations.text('March')+' 2023','2023-03-04','04'
                  ],
                  day7 : [
                    'Sunday'  ,'5 '+allTranslations.text('March')+' 2023','2023-03-05','05'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),






              Container(
                key:key2023_10,
                child:
                new week2023_1(
                  hint: "Week 10",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'6 '+allTranslations.text('March')+' 2023','2023-03-06','06'
                  ],
                  day2 : [
                    'Theusday'  ,'7 '+allTranslations.text('March')+' 2023','2023-03-07','07'
                  ],
                  day3 : [
                    'Wednesday'  ,'8 '+allTranslations.text('March')+' 2023','2023-03-08','08'
                  ],
                  day4 : [
                    'Thursday'  ,'9 '+allTranslations.text('March')+' 2023','2023-03-09','09'
                  ],
                  day5 : [
                    'Friday'  ,' 10 '+allTranslations.text('March')+' 2023','2023-03-10','10'
                  ],
                  day6 : [
                    'Saturday'  ,'11 '+allTranslations.text('March')+' 2023','2023-03-11','11'
                  ],
                  day7 : [
                    'Sunday'  ,'12 '+allTranslations.text('March')+' 2023','2023-03-12','12'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_11,
                child:     new week2023_1(
                  hint: "Week 11",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'13 '+allTranslations.text('March')+' 2023','2023-03-13','13'
                  ],
                  day2 : [
                    'Theusday'  ,'14 '+allTranslations.text('March')+' 2023','2023-03-14','14'
                  ],
                  day3 : [
                    'Wednesday'  ,'15 '+allTranslations.text('March')+' 2023','2023-03-15','15'
                  ],
                  day4 : [
                    'Thursday'  ,'16 '+allTranslations.text('March')+' 2023','2023-03-16','16'
                  ],
                  day5 : [
                    'Friday'  ,' 17 '+allTranslations.text('March')+' 2023','2023-03-17','17'
                  ],
                  day6 : [
                    'Saturday'  ,'18 '+allTranslations.text('March')+' 2023','2023-03-18','18'
                  ],
                  day7 : [
                    'Sunday'  ,'19 '+allTranslations.text('March')+' 2023','2023-03-19','19'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),






              Container(
                key:key2023_12,
                child:  new week2023_1(
                  hint: "Week 12",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'20 '+allTranslations.text('March')+' 2023','2023-03-20','20'
                  ],
                  day2 : [
                    'Theusday'  ,'21 '+allTranslations.text('March')+' 2023','2023-03-21','21'
                  ],
                  day3 : [
                    'Wednesday'  ,'22 '+allTranslations.text('March')+' 2023','2023-03-22','22'
                  ],
                  day4 : [
                    'Thursday'  ,'23 '+allTranslations.text('March')+' 2023','2023-03-23','23'
                  ],
                  day5 : [
                    'Friday'  ,' 24 '+allTranslations.text('March')+' 2023','2023-03-24','24'
                  ],
                  day6 : [
                    'Saturday'  ,'25 '+allTranslations.text('March')+' 2023','2023-03-25','25'
                  ],
                  day7 : [
                    'Sunday'  ,'26 '+allTranslations.text('March')+' 2023','2023-03-26','26'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),






              Container(
                key:key2023_13,
                child:   new week2023_1(
                  hint: "Week 13",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'27 '+allTranslations.text('March')+' 2023','2023-03-27','27'
                  ],
                  day2 : [
                    'Theusday'  ,'28 '+allTranslations.text('March')+' 2023','2023-03-28','28'
                  ],
                  day3 : [
                    'Wednesday'  ,'29 '+allTranslations.text('March')+' 2023','2023-03-29','29'
                  ],
                  day4 : [
                    'Thursday'  ,'30 '+allTranslations.text('March')+' 2023','2023-03-30','30'
                  ],
                  day5 : [
                    'Friday'  ,' 31 '+allTranslations.text('March')+' 2023','2023-03-31','31'
                  ],
                  day6 : [
                    'Saturday'  ,'1 '+allTranslations.text('April')+' 2023','2023-04-01','01'
                  ],
                  day7 : [
                    'Sunday'  ,'2 '+allTranslations.text('April')+' 2023','2023-04-02','02'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_14,
                child:    new week2023_1(
                  hint: "Week 14",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'3 '+allTranslations.text('April')+' 2023','2023-04-03','03'
                  ],
                  day2 : [
                    'Theusday'  ,'4 '+allTranslations.text('April')+' 2023','2023-04-04','04'
                  ],
                  day3 : [
                    'Wednesday'  ,'5 '+allTranslations.text('April')+' 2023','2023-04-05','05'
                  ],
                  day4 : [
                    'Thursday'  ,'6 '+allTranslations.text('April')+' 2023','2023-04-06','06'
                  ],
                  day5 : [
                    'Friday'  ,' 7 '+allTranslations.text('April')+' 2023','2023-04-07','07'
                  ],
                  day6 : [
                    'Saturday'  ,'8 '+allTranslations.text('April')+' 2023','2023-04-08','08'
                  ],
                  day7 : [
                    'Sunday'  ,'9 '+allTranslations.text('April')+' 2023','2023-04-09','09'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_15,
                child:   new week2023_1(
                  hint: "Week 15",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'10 '+allTranslations.text('April')+' 2023','2023-04-10','10'
                  ],
                  day2 : [
                    'Theusday'  ,'11 '+allTranslations.text('April')+' 2023','2023-04-11','11'
                  ],
                  day3 : [
                    'Wednesday'  ,'12 '+allTranslations.text('April')+' 2023','2023-04-12','12'
                  ],
                  day4 : [
                    'Thursday'  ,'13 '+allTranslations.text('April')+' 2023','2023-04-13','13'
                  ],
                  day5 : [
                    'Friday'  ,' 14 '+allTranslations.text('April')+' 2023','2023-04-14','14'
                  ],
                  day6 : [
                    'Saturday'  ,'15 '+allTranslations.text('April')+' 2023','2023-04-15','15'
                  ],
                  day7 : [
                    'Sunday'  ,'16 '+allTranslations.text('April')+' 2023','2023-04-16','16'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_16,
                child:    new week2023_1(
                  hint: "Week 16",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'17 '+allTranslations.text('April')+' 2023','2023-04-17','17'
                  ],
                  day2 : [
                    'Theusday'  ,'18 '+allTranslations.text('April')+' 2023','2023-04-18','18'
                  ],
                  day3 : [
                    'Wednesday'  ,'19 '+allTranslations.text('April')+' 2023','2023-04-19','19'
                  ],
                  day4 : [
                    'Thursday'  ,'20 '+allTranslations.text('April')+' 2023','2023-04-20','20'
                  ],
                  day5 : [
                    'Friday'  ,' 21 '+allTranslations.text('April')+' 2023','2023-04-21','21'
                  ],
                  day6 : [
                    'Saturday'  ,'22 '+allTranslations.text('April')+' 2023','2023-04-22','22'
                  ],
                  day7 : [
                    'Sunday'  ,'23 '+allTranslations.text('April')+' 2023','2023-04-23','23'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_17,
                child:    new week2023_1(
                  hint: "Week 17",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'24 '+allTranslations.text('April')+' 2023','2023-04-24','24'
                  ],
                  day2 : [
                    'Theusday'  ,'25 '+allTranslations.text('April')+' 2023','2023-04-25','25'
                  ],
                  day3 : [
                    'Wednesday'  ,'26 '+allTranslations.text('April')+' 2023','2023-04-26','26'
                  ],
                  day4 : [
                    'Thursday'  ,'27 '+allTranslations.text('April')+' 2023','2023-04-27','27'
                  ],
                  day5 : [
                    'Friday'  ,' 28 '+allTranslations.text('April')+' 2023','2023-04-28','28'
                  ],
                  day6 : [
                    'Saturday'  ,'29 '+allTranslations.text('April')+' 2023','2023-04-29','29'
                  ],
                  day7 : [
                    'Sunday'  ,'30 '+allTranslations.text('April')+' 2023','2023-04-30','30'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_18,
                child:   new week2023_1(
                  hint: "Week 18",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'1 '+allTranslations.text('May')+' 2023','2023-05-01','01'
                  ],
                  day2 : [
                    'Theusday'  ,'2 '+allTranslations.text('May')+' 2023','2023-05-02','02'
                  ],
                  day3 : [
                    'Wednesday'  ,'3 '+allTranslations.text('May')+' 2023','2023-05-03','03'
                  ],
                  day4 : [
                    'Thursday'  ,'4 '+allTranslations.text('May')+' 2023','2023-05-04','04'
                  ],
                  day5 : [
                    'Friday'  ,' 5 '+allTranslations.text('May')+' 2023','2023-05-05','05'
                  ],
                  day6 : [
                    'Saturday'  ,'6 '+allTranslations.text('May')+' 2023','2023-05-06','06'
                  ],
                  day7 : [
                    'Sunday'  ,'7 '+allTranslations.text('May')+' 2023','2023-05-07','07'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),


              Container(
                key:key2023_19,
                child:    new week2023_1(
                  hint: "Week 19",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'8 '+allTranslations.text('May')+' 2023','2023-05-08','08'
                  ],
                  day2 : [
                    'Theusday'  ,'9 '+allTranslations.text('May')+' 2023','2023-05-09','09'
                  ],
                  day3 : [
                    'Wednesday'  ,'10 '+allTranslations.text('May')+' 2023','2023-05-10','10'
                  ],
                  day4 : [
                    'Thursday'  ,'11 '+allTranslations.text('May')+' 2023','2023-05-11','11'
                  ],
                  day5 : [
                    'Friday'  ,' 12 '+allTranslations.text('May')+' 2023','2023-05-12','12'
                  ],
                  day6 : [
                    'Saturday'  ,'13 '+allTranslations.text('May')+' 2023','2023-05-13','13'
                  ],
                  day7 : [
                    'Sunday'  ,'14 '+allTranslations.text('May')+' 2023','2023-05-14','14'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),








              Container(
                key:key2023_20,
                child:   new week2023_1(
                  hint: "Week 20",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'15 '+allTranslations.text('May')+' 2023','2023-05-15','15'
                  ],
                  day2 : [
                    'Theusday'  ,'16 '+allTranslations.text('May')+' 2023','2023-05-16','16'
                  ],
                  day3 : [
                    'Wednesday'  ,'17 '+allTranslations.text('May')+' 2023','2023-05-17','17'
                  ],
                  day4 : [
                    'Thursday'  ,'18 '+allTranslations.text('May')+' 2023','2023-05-18','18'
                  ],
                  day5 : [
                    'Friday'  ,' 19 '+allTranslations.text('May')+' 2023','2023-05-19','19'
                  ],
                  day6 : [
                    'Saturday'  ,'20 '+allTranslations.text('May')+' 2023','2023-05-20','20'
                  ],
                  day7 : [
                    'Sunday'  ,'21 '+allTranslations.text('May')+' 2023','2023-05-21','21'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),







              Container(
                key:key2023_21,
                child:    new week2023_1(
                  hint: "Week 21",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'22 '+allTranslations.text('May')+' 2023','2023-05-22','22'
                  ],
                  day2 : [
                    'Theusday'  ,'23 '+allTranslations.text('May')+' 2023','2023-05-23','23'
                  ],
                  day3 : [
                    'Wednesday'  ,'24 '+allTranslations.text('May')+' 2023','2023-05-24','24'
                  ],
                  day4 : [
                    'Thursday'  ,'25 '+allTranslations.text('May')+' 2023','2023-05-25','25'
                  ],
                  day5 : [
                    'Friday'  ,' 26 '+allTranslations.text('May')+' 2023','2023-05-26','26'
                  ],
                  day6 : [
                    'Saturday'  ,'27 '+allTranslations.text('May')+' 2023','2023-05-27','27'
                  ],
                  day7 : [
                    'Sunday'  ,'28 '+allTranslations.text('May')+' 2023','2023-05-28','28'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_22,
                child:      new week2023_1(
                  hint: "Week 22",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'29 '+allTranslations.text('May')+' 2023','2023-05-29','29'
                  ],
                  day2 : [
                    'Theusday'  ,'30 '+allTranslations.text('May')+' 2023','2023-05-30','30'
                  ],
                  day3 : [
                    'Wednesday'  ,'31 '+allTranslations.text('May')+' 2023','2023-05-31','31'
                  ],
                  day4 : [
                    'Thursday'  ,'1 '+allTranslations.text('June')+' 2023','2023-06-01','01'
                  ],
                  day5 : [
                    'Friday'  ,' 2 '+allTranslations.text('June')+' 2023','2023-06-02','02'
                  ],
                  day6 : [
                    'Saturday'  ,'3 '+allTranslations.text('June')+' 2023','2023-06-03','03'
                  ],
                  day7 : [
                    'Sunday'  ,'4 '+allTranslations.text('June')+' 2023','2023-06-04','04'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),


              Container(
                key:key2023_23,
                child:    new week2023_1(
                  hint: "Week 23",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'5 '+allTranslations.text('June')+' 2023','2023-06-05','05'
                  ],
                  day2 : [
                    'Theusday'  ,'6 '+allTranslations.text('June')+' 2023','2023-06-06','06'
                  ],
                  day3 : [
                    'Wednesday'  ,'7 '+allTranslations.text('June')+' 2023','2023-06-07','07'
                  ],
                  day4 : [
                    'Thursday'  ,'8 '+allTranslations.text('June')+' 2023','2023-06-08','08'
                  ],
                  day5 : [
                    'Friday'  ,' 9 '+allTranslations.text('June')+' 2023','2023-06-09','09'
                  ],
                  day6 : [
                    'Saturday'  ,'10 '+allTranslations.text('June')+' 2023','2023-06-10','10'
                  ],
                  day7 : [
                    'Sunday'  ,'11 '+allTranslations.text('June')+' 2023','2023-06-11','11'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),






              Container(
                key:key2023_24,
                child:   new week2023_1(
                  hint: "Week 24",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'12 '+allTranslations.text('June')+' 2023','2023-06-12','12'
                  ],
                  day2 : [
                    'Theusday'  ,'13 '+allTranslations.text('June')+' 2023','2023-06-13','13'
                  ],
                  day3 : [
                    'Wednesday'  ,'14 '+allTranslations.text('June')+' 2023','2023-06-14','14'
                  ],
                  day4 : [
                    'Thursday'  ,'15 '+allTranslations.text('June')+' 2023','2023-06-15','15'
                  ],
                  day5 : [
                    'Friday'  ,' 16 '+allTranslations.text('June')+' 2023','2023-06-16','16'
                  ],
                  day6 : [
                    'Saturday'  ,'17 '+allTranslations.text('June')+' 2023','2023-06-17','17'
                  ],
                  day7 : [
                    'Sunday'  ,'18 '+allTranslations.text('June')+' 2023','2023-06-18','18'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_25,
                child:     new week2023_1(
                  hint: "Week 25",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'19 '+allTranslations.text('June')+' 2023','2023-06-19','19'
                  ],
                  day2 : [
                    'Theusday'  ,'20 '+allTranslations.text('June')+' 2023','2023-06-20','20'
                  ],
                  day3 : [
                    'Wednesday'  ,'21 '+allTranslations.text('June')+' 2023','2023-06-21','21'
                  ],
                  day4 : [
                    'Thursday'  ,'22 '+allTranslations.text('June')+' 2023','2023-06-22','22'
                  ],
                  day5 : [
                    'Friday'  ,' 23 '+allTranslations.text('June')+' 2023','2023-06-23','23'
                  ],
                  day6 : [
                    'Saturday'  ,'24 '+allTranslations.text('June')+' 2023','2023-06-24','24'
                  ],
                  day7 : [
                    'Sunday'  ,'25 '+allTranslations.text('June')+' 2023','2023-06-25','25'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_26,
                child:     new week2023_1(
                  hint: "Week 26",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'26 '+allTranslations.text('June')+' 2023','2023-06-26','26'
                  ],
                  day2 : [
                    'Theusday'  ,'27 '+allTranslations.text('June')+' 2023','2023-06-27','27'
                  ],
                  day3 : [
                    'Wednesday'  ,'28 '+allTranslations.text('June')+' 2023','2023-06-28','28'
                  ],
                  day4 : [
                    'Thursday'  ,'29 '+allTranslations.text('June')+' 2023','2023-06-29','29'
                  ],
                  day5 : [
                    'Friday'  ,' 30 '+allTranslations.text('June')+' 2023','2023-06-30','30'
                  ],
                  day6 : [
                    'Saturday'  ,'1 '+allTranslations.text('July')+' 2023','2023-07-01','01'
                  ],
                  day7 : [
                    'Sunday'  ,'2 '+allTranslations.text('July')+' 2023','2023-07-02','02'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_27,
                child:     new week2023_1(
                  hint: "Week 27",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'3 '+allTranslations.text('July')+' 2023','2023-07-03','03'
                  ],
                  day2 : [
                    'Theusday'  ,'4 '+allTranslations.text('July')+' 2023','2023-07-04','04'
                  ],
                  day3 : [
                    'Wednesday'  ,'5 '+allTranslations.text('July')+' 2023','2023-07-05','05'
                  ],
                  day4 : [
                    'Thursday'  ,'6 '+allTranslations.text('July')+' 2023','2023-07-06','06'
                  ],
                  day5 : [
                    'Friday'  ,' 7 '+allTranslations.text('July')+' 2023','2023-07-07','07'
                  ],
                  day6 : [
                    'Saturday'  ,'8 '+allTranslations.text('July')+' 2023','2023-07-08','08'
                  ],
                  day7 : [
                    'Sunday'  ,'9 '+allTranslations.text('July')+' 2023','2023-07-09','09'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_28,
                child:   new week2023_1(
                  hint: "Week 28",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'10 '+allTranslations.text('July')+' 2023','2023-07-10','10'
                  ],
                  day2 : [
                    'Theusday'  ,'11 '+allTranslations.text('July')+' 2023','2023-07-11','11'
                  ],
                  day3 : [
                    'Wednesday'  ,'12 '+allTranslations.text('July')+' 2023','2023-07-12','12'
                  ],
                  day4 : [
                    'Thursday'  ,'13 '+allTranslations.text('July')+' 2023','2023-07-13','13'
                  ],
                  day5 : [
                    'Friday'  ,' 14 '+allTranslations.text('July')+' 2023','2023-07-14','14'
                  ],
                  day6 : [
                    'Saturday'  ,'15 '+allTranslations.text('July')+' 2023','2023-07-15','15'
                  ],
                  day7 : [
                    'Sunday'  ,'16 '+allTranslations.text('July')+' 2023','2023-07-16','16'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_29,
                child:      new week2023_1(
                  hint: "Week 29",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'17 '+allTranslations.text('July')+' 2023','2023-07-17','17'
                  ],
                  day2 : [
                    'Theusday'  ,'18 '+allTranslations.text('July')+' 2023','2023-07-18','18'
                  ],
                  day3 : [
                    'Wednesday'  ,'19 '+allTranslations.text('July')+' 2023','2023-07-19','19'
                  ],
                  day4 : [
                    'Thursday'  ,'20 '+allTranslations.text('July')+' 2023','2023-07-20','20'
                  ],
                  day5 : [
                    'Friday'  ,' 21 '+allTranslations.text('July')+' 2023','2023-07-21','21'
                  ],
                  day6 : [
                    'Saturday'  ,'22 '+allTranslations.text('July')+' 2023','2023-07-22','22'
                  ],
                  day7 : [
                    'Sunday'  ,'23 '+allTranslations.text('July')+' 2023','2023-07-23','23'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_30,
                child:       new week2023_1(
                  hint: "Week 30",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'24 '+allTranslations.text('July')+' 2023','2023-07-24','24'
                  ],
                  day2 : [
                    'Theusday'  ,'25 '+allTranslations.text('July')+' 2023','2023-07-25','25'
                  ],
                  day3 : [
                    'Wednesday'  ,'26 '+allTranslations.text('July')+' 2023','2023-07-26','26'
                  ],
                  day4 : [
                    'Thursday'  ,'27 '+allTranslations.text('July')+' 2023','2023-07-27','27'
                  ],
                  day5 : [
                    'Friday'  ,' 28 '+allTranslations.text('July')+' 2023','2023-07-28','28'
                  ],
                  day6 : [
                    'Saturday'  ,'29 '+allTranslations.text('July')+' 2023','2023-07-29','29'
                  ],
                  day7 : [
                    'Sunday'  ,'30 '+allTranslations.text('July')+' 2023','2023-07-30','30'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_31,
                child:    new week2023_1(
                  hint: "Week 31",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'31 '+allTranslations.text('July')+' 2023','2023-07-31','31'
                  ],
                  day2 : [
                    'Theusday'  ,'1 '+allTranslations.text('August')+' 2023','2023-08-01','01'
                  ],
                  day3 : [
                    'Wednesday'  ,'2 '+allTranslations.text('August')+' 2023','2023-08-02','02'
                  ],
                  day4 : [
                    'Thursday'  ,'3 '+allTranslations.text('August')+' 2023','2023-08-03','03'
                  ],
                  day5 : [
                    'Friday'  ,' 4 '+allTranslations.text('August')+' 2023','2023-08-04','04'
                  ],
                  day6 : [
                    'Saturday'  ,'5 '+allTranslations.text('August')+' 2023','2023-08-05','05'
                  ],
                  day7 : [
                    'Sunday'  ,'6 '+allTranslations.text('August')+' 2023','2023-08-06','06'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),

              ),



              Container(
                key:key2023_32,
                child:    new week2023_1(
                  hint: "Week 32",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'7 '+allTranslations.text('August')+' 2023','2023-08-07','07'
                  ],
                  day2 : [
                    'Theusday'  ,'8 '+allTranslations.text('August')+' 2023','2023-08-08','08'
                  ],
                  day3 : [
                    'Wednesday'  ,'9 '+allTranslations.text('August')+' 2023','2023-08-09','09'
                  ],
                  day4 : [
                    'Thursday'  ,'10 '+allTranslations.text('August')+' 2023','2023-08-10','10'
                  ],
                  day5 : [
                    'Friday'  ,' 11 '+allTranslations.text('August')+' 2023','2023-08-11','11'
                  ],
                  day6 : [
                    'Saturday'  ,'12 '+allTranslations.text('August')+' 2023','2023-08-12','12'
                  ],
                  day7 : [
                    'Sunday'  ,'13 '+allTranslations.text('August')+' 2023','2023-08-13','13'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_33,
                child:    new week2023_1(
                  hint: "Week 33",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'14 '+allTranslations.text('August')+' 2023','2023-08-14','14'
                  ],
                  day2 : [
                    'Theusday'  ,'15 '+allTranslations.text('August')+' 2023','2023-08-15','15'
                  ],
                  day3 : [
                    'Wednesday'  ,'16 '+allTranslations.text('August')+' 2023','2023-08-16','16'
                  ],
                  day4 : [
                    'Thursday'  ,'17 '+allTranslations.text('August')+' 2023','2023-08-17','17'
                  ],
                  day5 : [
                    'Friday'  ,' 18 '+allTranslations.text('August')+' 2023','2023-08-18','18'
                  ],
                  day6 : [
                    'Saturday'  ,'19 '+allTranslations.text('August')+' 2023','2023-08-19','19'
                  ],
                  day7 : [
                    'Sunday'  ,'20 '+allTranslations.text('August')+' 2023','2023-08-20','20'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),



              Container(
                key:key2023_34,
                child:     new week2023_1(
                  hint: "Week 34",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'21 '+allTranslations.text('August')+' 2023','2023-08-21','21'
                  ],
                  day2 : [
                    'Theusday'  ,'22 '+allTranslations.text('August')+' 2023','2023-08-22','22'
                  ],
                  day3 : [
                    'Wednesday'  ,'23 '+allTranslations.text('August')+' 2023','2023-08-23','23'
                  ],
                  day4 : [
                    'Thursday'  ,'24 '+allTranslations.text('August')+' 2023','2023-08-24','24'
                  ],
                  day5 : [
                    'Friday'  ,' 25 '+allTranslations.text('August')+' 2023','2023-08-25','25'
                  ],
                  day6 : [
                    'Saturday'  ,'26 '+allTranslations.text('August')+' 2023','2023-08-26','26'
                  ],
                  day7 : [
                    'Sunday'  ,'27 '+allTranslations.text('August')+' 2023','2023-08-27','27'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_35,
                child:       new week2023_1(
                  hint: "Week 35",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'28 '+allTranslations.text('August')+' 2023','2023-08-28','28'
                  ],
                  day2 : [
                    'Theusday'  ,'29  '+allTranslations.text('August')+' 2023','2023-08-29','29'
                  ],
                  day3 : [
                    'Wednesday'  ,'30 '+allTranslations.text('August')+' 2023','2023-08-30','30'
                  ],
                  day4 : [
                    'Thursday'  ,'31 '+allTranslations.text('August')+' 2023','2023-08-31','31'
                  ],
                  day5 : [
                    'Friday'  ,' 1 '+allTranslations.text('September')+' 2023','2023-09-01','01'
                  ],
                  day6 : [
                    'Saturday'  ,'2 '+allTranslations.text('September')+' 2023','2023-09-02','02'
                  ],
                  day7 : [
                    'Sunday'  ,'3 '+allTranslations.text('September')+' 2023','2023-09-03','03'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_36,
                child:  new week2023_1(
                  hint: "Week 36",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'4 '+allTranslations.text('September')+' 2023','2023-09-04','04'
                  ],
                  day2 : [
                    'Theusday'  ,'5  '+allTranslations.text('September')+' 2023','2023-09-05','05'
                  ],
                  day3 : [
                    'Wednesday'  ,'6 '+allTranslations.text('September')+' 2023','2023-09-06','06'
                  ],
                  day4 : [
                    'Thursday'  ,'7 '+allTranslations.text('September')+' 2023','2023-09-07','07'
                  ],
                  day5 : [
                    'Friday'  ,' 8 '+allTranslations.text('September')+' 2023','2023-09-08','08'
                  ],
                  day6 : [
                    'Saturday'  ,'9 '+allTranslations.text('September')+' 2023','2023-09-09','09'
                  ],
                  day7 : [
                    'Sunday'  ,'10 '+allTranslations.text('September')+' 2023','2023-09-10','10'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_37,
                child:     new week2023_1(
                  hint: "Week 37",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'11 '+allTranslations.text('September')+' 2023','2023-09-11','11'
                  ],
                  day2 : [
                    'Theusday'  ,'12  '+allTranslations.text('September')+' 2023','2023-09-12','12'
                  ],
                  day3 : [
                    'Wednesday'  ,'13 '+allTranslations.text('September')+' 2023','2023-09-13','13'
                  ],
                  day4 : [
                    'Thursday'  ,'14 '+allTranslations.text('September')+' 2023','2023-09-14','14'
                  ],
                  day5 : [
                    'Friday'  ,' 15 '+allTranslations.text('September')+' 2023','2023-09-15','15'
                  ],
                  day6 : [
                    'Saturday'  ,'16 '+allTranslations.text('September')+' 2023','2023-09-16','16'
                  ],
                  day7 : [
                    'Sunday'  ,'17 '+allTranslations.text('September')+' 2023','2023-09-17','17'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_38,
                child:    new week2023_1(
                  hint: "Week 38",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'18 '+allTranslations.text('September')+' 2023','2023-09-18','18'
                  ],
                  day2 : [
                    'Theusday'  ,'19  '+allTranslations.text('September')+' 2023','2023-09-19','19'
                  ],
                  day3 : [
                    'Wednesday'  ,'20 '+allTranslations.text('September')+' 2023','2023-09-20','20'
                  ],
                  day4 : [
                    'Thursday'  ,'21 '+allTranslations.text('September')+' 2023','2023-09-21','21'
                  ],
                  day5 : [
                    'Friday'  ,' 22 '+allTranslations.text('September')+' 2023','2023-09-22','22'
                  ],
                  day6 : [
                    'Saturday'  ,'23 '+allTranslations.text('September')+' 2023','2023-09-23','23'
                  ],
                  day7 : [
                    'Sunday'  ,'24 '+allTranslations.text('September')+' 2023','2023-09-24','24'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_39,
                child:    new week2023_1(
                  hint: "Week 39",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'25 '+allTranslations.text('September')+' 2023','2023-09-25','25'
                  ],
                  day2 : [
                    'Theusday'  ,'26  '+allTranslations.text('September')+' 2023','2023-09-26','26'
                  ],
                  day3 : [
                    'Wednesday'  ,'27 '+allTranslations.text('September')+' 2023','2023-09-27','27'
                  ],
                  day4 : [
                    'Thursday'  ,'28 '+allTranslations.text('September')+' 2023','2023-09-28','28'
                  ],
                  day5 : [
                    'Friday'  ,' 29 '+allTranslations.text('September')+' 2023','2023-09-29','29'
                  ],
                  day6 : [
                    'Saturday'  ,'30 '+allTranslations.text('September')+' 2023','2023-09-30','30'
                  ],
                  day7 : [
                    'Sunday'  ,'1 '+allTranslations.text('October')+' 2023','2023-10-01','01'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_40,
                child:     new week2023_1(
                  hint: "Week 40",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'2 '+allTranslations.text('October')+' 2023','2023-10-02','02'
                  ],
                  day2 : [
                    'Theusday'  ,'3  '+allTranslations.text('October')+' 2023','2023-10-03','03'
                  ],
                  day3 : [
                    'Wednesday'  ,'4 '+allTranslations.text('October')+' 2023','2023-10-04','04'
                  ],
                  day4 : [
                    'Thursday'  ,'5 '+allTranslations.text('October')+' 2023','2023-10-05','05'
                  ],
                  day5 : [
                    'Friday'  ,' 6 '+allTranslations.text('October')+' 2023','2023-10-06','06'
                  ],
                  day6 : [
                    'Saturday'  ,'7 '+allTranslations.text('October')+' 2023','2023-10-07','07'
                  ],
                  day7 : [
                    'Sunday'  ,'8 '+allTranslations.text('October')+' 2023','2023-10-08','08'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),



              Container(
                key:key2023_41,
                child:    new week2023_1(
                  hint: "Week 41",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'9 '+allTranslations.text('October')+' 2023','2023-10-09','09'
                  ],
                  day2 : [
                    'Theusday'  ,'10  '+allTranslations.text('October')+' 2023','2023-10-10','10'
                  ],
                  day3 : [
                    'Wednesday'  ,'11 '+allTranslations.text('October')+' 2023','2023-10-11','11'
                  ],
                  day4 : [
                    'Thursday'  ,'12 '+allTranslations.text('October')+' 2023','2023-10-12','12'
                  ],
                  day5 : [
                    'Friday'  ,' 13 '+allTranslations.text('October')+' 2023','2023-10-13','13'
                  ],
                  day6 : [
                    'Saturday'  ,'14 '+allTranslations.text('October')+' 2023','2023-10-14','14'
                  ],
                  day7 : [
                    'Sunday'  ,'15 '+allTranslations.text('October')+' 2023','2023-10-15','15'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),


              Container(
                key:key2023_42,
                child:      new week2023_1(
                  hint: "Week 42",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'16 '+allTranslations.text('October')+' 2023','2023-10-16','16'
                  ],
                  day2 : [
                    'Theusday'  ,'17  '+allTranslations.text('October')+' 2023','2023-10-17','17'
                  ],
                  day3 : [
                    'Wednesday'  ,'18 '+allTranslations.text('October')+' 2023','2023-10-18','18'
                  ],
                  day4 : [
                    'Thursday'  ,'19 '+allTranslations.text('October')+' 2023','2023-10-19','19'
                  ],
                  day5 : [
                    'Friday'  ,' 20 '+allTranslations.text('October')+' 2023','2023-10-20','20'
                  ],
                  day6 : [
                    'Saturday'  ,'21 '+allTranslations.text('October')+' 2023','2023-10-21','21'
                  ],
                  day7 : [
                    'Sunday'  ,'22 '+allTranslations.text('October')+' 2023','2023-10-22','22'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_43,
                child:     new week2023_1(
                  hint: "Week 43",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'23 '+allTranslations.text('October')+' 2023','2023-10-23','23'
                  ],
                  day2 : [
                    'Theusday'  ,'24  '+allTranslations.text('October')+' 2023','2023-10-24','24'
                  ],
                  day3 : [
                    'Wednesday'  ,'25 '+allTranslations.text('October')+' 2023','2023-10-25','25'
                  ],
                  day4 : [
                    'Thursday'  ,'26 '+allTranslations.text('October')+' 2023','2023-10-26','26'
                  ],
                  day5 : [
                    'Friday'  ,' 27 '+allTranslations.text('October')+' 2023','2023-10-27','27'
                  ],
                  day6 : [
                    'Saturday'  ,'28 '+allTranslations.text('October')+' 2023','2023-10-28','28'
                  ],
                  day7 : [
                    'Sunday'  ,'29 '+allTranslations.text('October')+' 2023','2023-10-29','29'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),



              Container(
                key:key2023_44,
                child:      new week2023_1(
                  hint: "Week 44",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'30 '+allTranslations.text('October')+' 2023','2023-10-30','30'
                  ],
                  day2 : [
                    'Theusday'  ,'31  '+allTranslations.text('October')+' 2023','2023-10-31','31'
                  ],
                  day3 : [
                    'Wednesday'  ,'1 '+allTranslations.text('November')+' 2023','2023-11-01','01'
                  ],
                  day4 : [
                    'Thursday'  ,'2 '+allTranslations.text('November')+' 2023','2023-11-02','02'
                  ],
                  day5 : [
                    'Friday'  ,' 3 '+allTranslations.text('November')+' 2023','2023-11-03','03'
                  ],
                  day6 : [
                    'Saturday'  ,'4 '+allTranslations.text('November')+' 2023','2023-11-04','04'
                  ],
                  day7 : [
                    'Sunday'  ,'5 '+allTranslations.text('November')+' 2023','2023-11-05','05'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_45,
                child:      new week2023_1(
                  hint: "Week 45",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'6 '+allTranslations.text('November')+' 2023','2023-11-06','06'
                  ],
                  day2 : [
                    'Theusday'  ,'7  '+allTranslations.text('November')+' 2023','2023-11-07','07'
                  ],
                  day3 : [
                    'Wednesday'  ,'8 '+allTranslations.text('November')+' 2023','2023-11-08','08'
                  ],
                  day4 : [
                    'Thursday'  ,'9 '+allTranslations.text('November')+' 2023','2023-11-09','09'
                  ],
                  day5 : [
                    'Friday'  ,' 10 '+allTranslations.text('November')+' 2023','2023-11-10','10'
                  ],
                  day6 : [
                    'Saturday'  ,'11 '+allTranslations.text('November')+' 2023','2023-11-11','11'
                  ],
                  day7 : [
                    'Sunday'  ,'12 '+allTranslations.text('November')+' 2023','2023-11-12','12'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_46,
                child:    new week2023_1(
                  hint: "Week 46",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'13 '+allTranslations.text('November')+' 2023','2023-11-13','13'
                  ],
                  day2 : [
                    'Theusday'  ,'14  '+allTranslations.text('November')+' 2023','2023-11-14','14'
                  ],
                  day3 : [
                    'Wednesday'  ,'15 '+allTranslations.text('November')+' 2023','2023-11-15','15'
                  ],
                  day4 : [
                    'Thursday'  ,'16 '+allTranslations.text('November')+' 2023','2023-11-16','16'
                  ],
                  day5 : [
                    'Friday'  ,' 17 '+allTranslations.text('November')+' 2023','2023-11-17','17'
                  ],
                  day6 : [
                    'Saturday'  ,'18 '+allTranslations.text('November')+' 2023','2023-11-18','18'
                  ],
                  day7 : [
                    'Sunday'  ,'19 '+allTranslations.text('November')+' 2023','2023-11-19','19'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_47,
                child:      new week2023_1(
                  hint: "Week 47",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'20 '+allTranslations.text('November')+' 2023','2023-11-20','20'
                  ],
                  day2 : [
                    'Theusday'  ,'21  '+allTranslations.text('November')+' 2023','2023-11-21','21'
                  ],
                  day3 : [
                    'Wednesday'  ,'22 '+allTranslations.text('November')+' 2023','2023-11-22','22'
                  ],
                  day4 : [
                    'Thursday'  ,'23 '+allTranslations.text('November')+' 2023','2023-11-23','23'
                  ],
                  day5 : [
                    'Friday'  ,' 24 '+allTranslations.text('November')+' 2023','2023-11-24','24'
                  ],
                  day6 : [
                    'Saturday'  ,'25 '+allTranslations.text('November')+' 2023','2023-11-25','25'
                  ],
                  day7 : [
                    'Sunday'  ,'26 '+allTranslations.text('November')+' 2023','2023-11-26','26'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),





              Container(
                key:key2023_48,
                child:     new week2023_1(
                  hint: "Week 48",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'27 '+allTranslations.text('November')+' 2023','2023-11-27','27'
                  ],
                  day2 : [
                    'Theusday'  ,'28  '+allTranslations.text('November')+' 2023','2023-11-28','28'
                  ],
                  day3 : [
                    'Wednesday'  ,'29 '+allTranslations.text('November')+' 2023','2023-11-29','29'
                  ],
                  day4 : [
                    'Thursday'  ,'30 '+allTranslations.text('November')+' 2023','2023-11-30','30'
                  ],
                  day5 : [
                    'Friday'  ,' 1 '+allTranslations.text('December')+' 2023','2023-12-01','01'
                  ],
                  day6 : [
                    'Saturday'  ,'2 '+allTranslations.text('December')+' 2023','2023-12-02','02'
                  ],
                  day7 : [
                    'Sunday'  ,'3 '+allTranslations.text('December')+' 2023','2023-12-03','03'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_49,
                child:     new week2023_1(
                  hint: "Week 49",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'4 '+allTranslations.text('December')+' 2023','2023-12-04','04'
                  ],
                  day2 : [
                    'Theusday'  ,'5  '+allTranslations.text('December')+' 2023','2023-12-05','05'
                  ],
                  day3 : [
                    'Wednesday'  ,'6 '+allTranslations.text('December')+' 2023','2023-12-06','06'
                  ],
                  day4 : [
                    'Thursday'  ,'7 '+allTranslations.text('December')+' 2023','2023-12-07','07'
                  ],
                  day5 : [
                    'Friday'  ,' 8 '+allTranslations.text('December')+' 2023','2023-12-08','08'
                  ],
                  day6 : [
                    'Saturday'  ,'9 '+allTranslations.text('December')+' 2023','2023-12-09','09'
                  ],
                  day7 : [
                    'Sunday'  ,'10 '+allTranslations.text('December')+' 2023','2023-12-10','10'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),



              Container(
                key:key2023_50,
                child:    new week2023_1(
                  hint: "Week 50",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'11 '+allTranslations.text('December')+' 2023','2023-12-11','11'
                  ],
                  day2 : [
                    'Theusday'  ,'12  '+allTranslations.text('December')+' 2023','2023-12-12','12'
                  ],
                  day3 : [
                    'Wednesday'  ,'13 '+allTranslations.text('December')+' 2023','2023-12-13','13'
                  ],
                  day4 : [
                    'Thursday'  ,'14 '+allTranslations.text('December')+' 2023','2023-12-14','14'
                  ],
                  day5 : [
                    'Friday'  ,' 15 '+allTranslations.text('December')+' 2023','2023-12-15','15'
                  ],
                  day6 : [
                    'Saturday'  ,'16 '+allTranslations.text('December')+' 2023','2023-12-16','16'
                  ],
                  day7 : [
                    'Sunday'  ,'17 '+allTranslations.text('December')+' 2023','2023-12-17','17'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),

              ),



              Container(
                key:key2023_51,
                child:    new week2023_1(
                  hint: "Week 51",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'18 '+allTranslations.text('December')+' 2023','2023-12-18','18'
                  ],
                  day2 : [
                    'Theusday'  ,'19  '+allTranslations.text('December')+' 2023','2023-12-19','19'
                  ],
                  day3 : [
                    'Wednesday'  ,'20 '+allTranslations.text('December')+' 2023','2023-12-20','20'
                  ],
                  day4 : [
                    'Thursday'  ,'21 '+allTranslations.text('December')+' 2023','2023-12-21','21'
                  ],
                  day5 : [
                    'Friday'  ,' 22 '+allTranslations.text('December')+' 2023','2023-12-22','22'
                  ],
                  day6 : [
                    'Saturday'  ,'23 '+allTranslations.text('December')+' 2023','2023-12-23','23'
                  ],
                  day7 : [
                    'Sunday'  ,'24 '+allTranslations.text('December')+' 2023','2023-12-24','24'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),




              Container(
                key:key2023_52,
                child:       new week2023_1(
                  hint: "Week 52",
                  data:widget.data,
                  day1 : [
                    'Monday'  ,'25 '+allTranslations.text('December')+' 2023','2023-12-25','25'
                  ],
                  day2 : [
                    'Theusday'  ,'26  '+allTranslations.text('December')+' 2023','2023-12-26','26'
                  ],
                  day3 : [
                    'Wednesday'  ,'27 '+allTranslations.text('December')+' 2023','2023-12-27','27'
                  ],
                  day4 : [
                    'Thursday'  ,'28 '+allTranslations.text('December')+' 2023','2023-12-28','28'
                  ],
                  day5 : [
                    'Friday'  ,' 29 '+allTranslations.text('December')+' 2023','2023-12-29','29'
                  ],
                  day6 : [
                    'Saturday'  ,'30 '+allTranslations.text('December')+' 2023','2023-12-30','30'
                  ],
                  day7 : [
                    'Sunday'  ,'31 '+allTranslations.text('December')+' 2023','2023-12-31','31'
                  ],
                  backgroundcolor: widget.backgroundcolor,
                  color: widget.color,
                  gradiantcolor:widget.gradiantcolor,
                  cardcolor:widget.cardcolor,
                  shadowcolor:widget.shadowcolor,
                  appbarcolor: widget.appbarcolor,
                  titlecolor:widget.titlecolor,
                  textcolor:widget.textcolor,
                  bottombarcolor:widget.bottombarcolor,
                ),
              ),


            ],

          ),

        ),


      ),



    );
  }






  int weeksBetween(DateTime from, DateTime to) {
    from = DateTime.utc(from.year, from.month, from.day);
    to = DateTime.utc(to.year, to.month, to.day);

    return (to.difference(from).inDays / 7).ceil();
  }



  etscrol() {

    final now = DateTime.now();
    final firstJan = DateTime(now.year, 1, 1);
    final weekNumber = weeksBetween(firstJan, now);
    print('sss');
    print(weekNumber);

    if(weekNumber==1)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_1.currentContext);
      });
    }
    if(weekNumber==2)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_2.currentContext);
      });
    }
    if(weekNumber==3)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_3.currentContext);
      });
    }
    if(weekNumber==4)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_4.currentContext);
      });
    }
    if(weekNumber==5)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_5.currentContext);
      });
    }
    if(weekNumber==6)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_6.currentContext);
      });
    }
    if(weekNumber==7)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_7.currentContext);
      });
    }
    if(weekNumber==8)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_8.currentContext);
      });
    }
    if(weekNumber==9)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_9.currentContext);
      });
    }
    if(weekNumber==10)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_10.currentContext);
      });
    }
    if(weekNumber==11)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_11.currentContext);
      });
    }
    if(weekNumber==12)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_12.currentContext);
      });
    }
    if(weekNumber==13)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_13.currentContext);
      });
    }
    if(weekNumber==14)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_14.currentContext);
      });
    }
    if(weekNumber==15)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_15.currentContext);
      });
    }
    if(weekNumber==16)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_16.currentContext);
      });
    }
    if(weekNumber==17)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_17.currentContext);
      });
    }
    if(weekNumber==18)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_18.currentContext);
      });
    }
    if(weekNumber==19)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_19.currentContext);
      });
    }
    if(weekNumber==20)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_20.currentContext);
      });
    }
    if(weekNumber==21)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_21.currentContext);
      });
    }
    if(weekNumber==22)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_22.currentContext);
      });
    }
    if(weekNumber==23)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_23.currentContext);
      });
    }
    if(weekNumber==24)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_24.currentContext);
      });
    }
    if(weekNumber==25)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_25.currentContext);
      });
    }
    if(weekNumber==26)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_26.currentContext);
      });
    }
    if(weekNumber==27)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_27.currentContext);
      });
    }
    if(weekNumber==28)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_28.currentContext);
      });
    }
    if(weekNumber==29)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_29.currentContext);
      });
    }
    if(weekNumber==30)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_30.currentContext);
      });
    }
    if(weekNumber==31)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_31.currentContext);
      });
    }
    if(weekNumber==32)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_32.currentContext);
      });
    }
    if(weekNumber==33)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_33.currentContext);
      });
    }
    if(weekNumber==34)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_34.currentContext);
      });
    }
    if(weekNumber==35)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_35.currentContext);
      });
    }
    if(weekNumber==36)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_36.currentContext);
      });
    }
    if(weekNumber==37)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_37.currentContext);
      });
    }
    if(weekNumber==38)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_38.currentContext);
      });
    }
    if(weekNumber==39)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_39.currentContext);
      });
    }
    if(weekNumber==40)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_40.currentContext);
      });
    }
    if(weekNumber==41)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_41.currentContext);
      });
    }
    if(weekNumber==42)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_42.currentContext);
      });
    }
    if(weekNumber==43)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_43.currentContext);
      });
    }
    if(weekNumber==44)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_44.currentContext);
      });
    }
    if(weekNumber==45)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_45.currentContext);
      });
    }
    if(weekNumber==46)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_46.currentContext);
      });
    }
    if(weekNumber==47)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_47.currentContext);
      });
    }
    if(weekNumber==48)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_48.currentContext);
      });
    }
    if(weekNumber==49)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_49.currentContext);
      });
    }
    if(weekNumber==50)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_50.currentContext);
      });
    }
    if(weekNumber==51)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_51.currentContext);
      });
    }
    if(weekNumber==52)
    {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(key2023_52.currentContext);
      });
    }


  }






  getdet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/detassignment?token='+token+'&id='+12.toString();
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





