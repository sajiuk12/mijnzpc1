//@dart=2.9
import 'package:flutter/material.dart';

import 'package:mijnzpc/components/months/2022/Month2022_1.dart';
import 'package:mijnzpc/components/months/2022/Month2022_2.dart';
import 'package:mijnzpc/components/months/2022/Month2022_3.dart';
import 'package:mijnzpc/components/months/2022/Month2022_4.dart';
import 'package:mijnzpc/components/months/2022/Month2022_5.dart';
import 'package:mijnzpc/components/months/2022/Month2022_6.dart';
import 'package:mijnzpc/components/months/2022/Month2022_7.dart';
import 'package:mijnzpc/components/months/2022/Month2022_8.dart';
import 'package:mijnzpc/components/months/2022/Month2022_9.dart';
import 'package:mijnzpc/components/months/2022/Month2022_10.dart';
import 'package:mijnzpc/components/months/2022/Month2022_11.dart';
import 'package:mijnzpc/components/months/2022/Month2022_12.dart';

import 'package:mijnzpc/components/months/2023/Month2023_1.dart';
import 'package:mijnzpc/components/months/2023/Month2023_2.dart';
import 'package:mijnzpc/components/months/2023/Month2023_3.dart';
import 'package:mijnzpc/components/months/2023/Month2023_4.dart';
import 'package:mijnzpc/components/months/2023/Month2023_5.dart';
import 'package:mijnzpc/components/months/2023/Month2023_6.dart';
import 'package:mijnzpc/components/months/2023/Month2023_7.dart';
import 'package:mijnzpc/components/months/2023/Month2023_8.dart';
import 'package:mijnzpc/components/months/2023/Month2023_9.dart';
import 'package:mijnzpc/components/months/2023/Month2023_10.dart';
import 'package:mijnzpc/components/months/2023/Month2023_11.dart';
import 'package:mijnzpc/components/months/2023/Month2023_12.dart';


import 'package:mijnzpc/components/months/2024/Month2024_1.dart';
import 'package:mijnzpc/components/months/2024/Month2024_2.dart';
import 'package:mijnzpc/components/months/2024/Month2024_3.dart';
import 'package:mijnzpc/components/months/2024/Month2024_4.dart';
import 'package:mijnzpc/components/months/2024/Month2024_5.dart';
import 'package:mijnzpc/components/months/2024/Month2024_6.dart';
import 'package:mijnzpc/components/months/2024/Month2024_7.dart';
import 'package:mijnzpc/components/months/2024/Month2024_8.dart';
import 'package:mijnzpc/components/months/2024/Month2024_9.dart';
import 'package:mijnzpc/components/months/2024/Month2024_10.dart';
import 'package:mijnzpc/components/months/2024/Month2024_11.dart';
import 'package:mijnzpc/components/months/2024/Month2024_12.dart';

import 'package:mijnzpc/components/months/2025/Month2025_1.dart';
import 'package:mijnzpc/components/months/2025/Month2025_2.dart';
import 'package:mijnzpc/components/months/2025/Month2025_3.dart';
import 'package:mijnzpc/components/months/2025/Month2025_4.dart';
import 'package:mijnzpc/components/months/2025/Month2025_5.dart';
import 'package:mijnzpc/components/months/2025/Month2025_6.dart';
import 'package:mijnzpc/components/months/2025/Month2025_7.dart';
import 'package:mijnzpc/components/months/2025/Month2025_8.dart';
import 'package:mijnzpc/components/months/2025/Month2025_9.dart';
import 'package:mijnzpc/components/months/2025/Month2025_10.dart';
import 'package:mijnzpc/components/months/2025/Month2025_11.dart';
import 'package:mijnzpc/components/months/2025/Month2025_12.dart';

import 'package:mijnzpc/components/months/2026/Month2026_1.dart';
import 'package:mijnzpc/components/months/2026/Month2026_2.dart';
import 'package:mijnzpc/components/months/2026/Month2026_3.dart';
import 'package:mijnzpc/components/months/2026/Month2026_4.dart';
import 'package:mijnzpc/components/months/2026/Month2026_5.dart';
import 'package:mijnzpc/components/months/2026/Month2026_6.dart';
import 'package:mijnzpc/components/months/2026/Month2026_7.dart';
import 'package:mijnzpc/components/months/2026/Month2026_8.dart';
import 'package:mijnzpc/components/months/2026/Month2026_9.dart';
import 'package:mijnzpc/components/months/2026/Month2026_10.dart';
import 'package:mijnzpc/components/months/2026/Month2026_11.dart';
import 'package:mijnzpc/components/months/2026/Month2026_12.dart';

import 'package:mijnzpc/models/manimal.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/models/mdepartments.dart';
import 'package:mijnzpc/pages/calenderweek.dart';
import 'package:mijnzpc/services/getservices.dart';

import 'package:mijnzpc/all_translations.dart';


class Calendermonth extends StatefulWidget {
  Calendermonth(
      {@required  this.data,this.backgroundcolor,
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

  List<Massignment> data ;


  @override
  State<StatefulWidget> createState() => new CalendermonthState();

}

class CalendermonthState extends State<Calendermonth> with AutomaticKeepAliveClientMixin<Calendermonth> {

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

  var key2022_1 = GlobalKey();
  var key2022_2 = GlobalKey();
  var key2022_3 = GlobalKey();
  var key2022_4 = GlobalKey();
  var key2022_5 = GlobalKey();
  var key2022_6 = GlobalKey();
  var key2022_7 = GlobalKey();
  var key2022_8 = GlobalKey();
  var key2022_9 = GlobalKey();
  var key2022_10 = GlobalKey();
  var key2022_11 = GlobalKey();
  var key2022_12 = GlobalKey();

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

  var key2024_1 = GlobalKey();
  var key2024_2 = GlobalKey();
  var key2024_3 = GlobalKey();
  var key2024_4 = GlobalKey();
  var key2024_5 = GlobalKey();
  var key2024_6 = GlobalKey();
  var key2024_7 = GlobalKey();
  var key2024_8 = GlobalKey();
  var key2024_9 = GlobalKey();
  var key2024_10 = GlobalKey();
  var key2024_11 = GlobalKey();
  var key2024_12 = GlobalKey();

  var key2025_1 = GlobalKey();
  var key2025_2 = GlobalKey();
  var key2025_3 = GlobalKey();
  var key2025_4 = GlobalKey();
  var key2025_5 = GlobalKey();
  var key2025_6 = GlobalKey();
  var key2025_7 = GlobalKey();
  var key2025_8 = GlobalKey();
  var key2025_9 = GlobalKey();
  var key2025_10 = GlobalKey();
  var key2025_11 = GlobalKey();
  var key2025_12 = GlobalKey();

  var key2026_1 = GlobalKey();
  var key2026_2 = GlobalKey();
  var key2026_3 = GlobalKey();
  var key2026_4 = GlobalKey();
  var key2026_5 = GlobalKey();
  var key2026_6 = GlobalKey();
  var key2026_7 = GlobalKey();
  var key2026_8 = GlobalKey();
  var key2026_9 = GlobalKey();
  var key2026_10 = GlobalKey();
  var key2026_11 = GlobalKey();
  var key2026_12 = GlobalKey();


  void initState() {

    print('pppppppppppppppppppssssssssssssss');
    print(widget.gradiantcolor);
    getdet();
    super.initState();
    etscrol();

  }


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
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new Calenderweek(backgroundcolor:widget.backgroundcolor,
              color : widget.color,
              data : widget.data,
              gradiantcolor:widget.gradiantcolor,
              cardcolor:widget.cardcolor,
              shadowcolor:widget.shadowcolor,
              appbarcolor:widget.appbarcolor,
              titlecolor:widget.titlecolor,
              textcolor:widget.textcolor,
              bottombarcolor:widget.bottombarcolor,)));

          }else if(value == 1){

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
        child: Container(
          color: widget.backgroundcolor,
          child: Column(
            children: <Widget>[

          // month 2022
          Container(
          key:key2022_1,
          child:new Month2022_1(
            selectedmonth: "01",
            selectedyear: "2022",
            days: [
              ''  , ''  , ''  , ''  , ''  , '01'  , '02',
              '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
              '10' , '11' , '12' , '13' , '14' , '15' , '16',
              '17' , '18' , '19' , '20' , '21' , '22' , '23',
              '24' , '25' , '26' , '27' , '28' , '29' , '30',
              '31' , '' , '' , '' , '' , '' , '',
            ],
              hint: allTranslations.text("January")+" 2022",
              data:widget.data,
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
  key:key2022_2,
  child:new Month2022_1(
    selectedmonth: "02",
    selectedyear: "2022",
              days:[
                ''  , '01'  , '02',
                '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                '10' , '11' , '12' , '13' , '14' , '15' , '16',
                '17' , '18' , '19' , '20' , '21' , '22' , '23',
                '24' , '25' , '26' , '27' , '28' , '' , '',
                '' , '' , '' , '' , '' , '' , '',''  , ''  , ''  , ''  ,
              ],
              hint: allTranslations.text("February")+" 2022",
              data:widget.data,
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
      key:key2022_3,
      child:new Month2022_1(
        selectedmonth: "04",
        selectedyear: "2022",
        days:[
          ''  , '01'  , '02',
          '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
          '10' , '11' , '12' , '13' , '14' , '15' , '16',
          '17' , '18' , '19' , '20' , '21' , '22' , '23',
          '24' , '25' , '26' , '27' , '28' , '29' , '30',
          '31' , '' , '' , '' , '' , '' , '',''  , ''  , ''  , ''  ,
        ],
              hint: allTranslations.text("March")+" 2022",
              data:widget.data,
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
  key:key2022_4,
  child:new Month2022_1(
    selectedmonth: "04",
    selectedyear: "2022",
    days: [
      ''  , ''  , ''  ,''  , '01'  , '02',
      '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
      '10' , '11' , '12' , '13' , '14' , '15' , '16',
      '17' , '18' , '19' , '20' , '21' , '22' , '23',
      '24' , '25' , '26' , '27' , '28' , '29' , '30',
      '' , '' , '' , '' , '' , '' , '',''  ,
    ],
              hint: allTranslations.text("April")+" 2022",
              data:widget.data,
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
  key:key2022_5,
  child:new Month2022_1(
    selectedmonth: "05",
    selectedyear: "2022",
    days:[
      '',''  ,''  , ''  , ''  ,''  , '01'  , '02',
      '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
      '10' , '11' , '12' , '13' , '14' , '15' , '16',
      '17' , '18' , '19' , '20' , '21' , '22' , '23',
      '24' , '25' , '26' , '27' , '28' , '29' , '30',
      '31' , '' , '' , '' , '' , '' ,
    ],
              hint: allTranslations.text("May")+" 2022",
              data:widget.data,
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
  key:key2022_6,
  child:new Month2022_1(
    selectedmonth: "06",
    selectedyear: "2022",
    days: [
      ''  ,''  , '01'  , '02',
      '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
      '10' , '11' , '12' , '13' , '14' , '15' , '16',
      '17' , '18' , '19' , '20' , '21' , '22' , '23',
      '24' , '25' , '26' , '27' , '28' , '29' , '30',
      '' , '' , '' , '' , '' , '' ,'',''  ,''  , ''  ,
    ],
              hint: allTranslations.text("June")+" 2022",
              data:widget.data,
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
  key:key2022_7,
  child: new Month2022_1(
    selectedmonth: "07",
    selectedyear: "2022",
    days:[
      ''  , ''  ,''  ,''  , '01'  , '02',
      '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
      '10' , '11' , '12' , '13' , '14' , '15' , '16',
      '17' , '18' , '19' , '20' , '21' , '22' , '23',
      '24' , '25' , '26' , '27' , '28' , '29' , '30',
      '31' , '' , '' , '' , '' , '' ,'',''  ,
    ],
              hint: allTranslations.text("July")+" 2022",
              data:widget.data,
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
  key:key2022_8,
  child: new Month2022_1(
    selectedmonth: "08",
    selectedyear: "2022",
    days:[
      '01'  , '02',
      '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
      '10' , '11' , '12' , '13' , '14' , '15' , '16',
      '17' , '18' , '19' , '20' , '21' , '22' , '23',
      '24' , '25' , '26' , '27' , '28' , '29' , '30',
      '31' , '' , '' , '' , '' , '' ,'',''  ,''  , ''  ,''  ,''  ,
    ],
              hint: allTranslations.text("August")+" 2022",
              data:widget.data,
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
          key:key2022_9,
          child: new Month2022_1(
            selectedmonth: "09",
            selectedyear: "2022",
            days:[
              ''  ,''  ,''  ,'01'  , '02',
              '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
              '10' , '11' , '12' , '13' , '14' , '15' , '16',
              '17' , '18' , '19' , '20' , '21' , '22' , '23',
              '24' , '25' , '26' , '27' , '28' , '29' , '30',
              '' , '' , '' , '' , '' , '' ,'',''  ,''  ,
            ],
              hint: allTranslations.text("September")+" 2022",
              data:widget.data,
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
  key:key2022_10,
  child: new Month2022_1(
    selectedmonth: "10",
    selectedyear: "2022",
    days:[
      ''  ,''  ,''  ,''  ,''  ,'01'  , '02',
      '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
      '10' , '11' , '12' , '13' , '14' , '15' , '16',
      '17' , '18' , '19' , '20' , '21' , '22' , '23',
      '24' , '25' , '26' , '27' , '28' , '29' , '30',
      '31' , '' , '' , '' , '' , '' ,'',
    ],
              hint: allTranslations.text("October")+" 2022",
              data:widget.data,
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
            key:key2022_11,
            child:new Month2022_1(
              selectedmonth: "11",
              selectedyear: "2022",
              days:[
                ''  ,'01'  , '02',
                '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                '10' , '11' , '12' , '13' , '14' , '15' , '16',
                '17' , '18' , '19' , '20' , '21' , '22' , '23',
                '24' , '25' , '26' , '27' , '28' , '29' , '30',
                '' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,''  ,
              ],
              hint: allTranslations.text("November")+" 2022",
              data:widget.data,
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
  key:key2022_12,
  child:new Month2022_1(
    selectedmonth: "12",
    selectedyear: "2022",
    days:[
      ''  ,''  ,''  ,'01'  , '02',
      '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
      '10' , '11' , '12' , '13' , '14' , '15' , '16',
      '17' , '18' , '19' , '20' , '21' , '22' , '23',
      '24' , '25' , '26' , '27' , '28' , '29' , '30',
      '' , '' , '' , '' , '' , '' ,'',''  ,''  ,
    ],
              hint: allTranslations.text("December")+" 2022",
              data:widget.data,
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
          // month 2022



          // month 2023
          Container(
            key:key2023_1,
            child:new Month2022_1(
              days: [
                '',''  ,''  ,''  ,''  ,''  ,'01'  , '02',
                '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                '10' , '11' , '12' , '13' , '14' , '15' , '16',
                '17' , '18' , '19' , '20' , '21' , '22' , '23',
                '24' , '25' , '26' , '27' , '28' , '29' , '30',
                '31' , '' , '' , '' , '' , '' ,
              ],
              selectedmonth: "01",
              selectedyear: "2023",
              hint: allTranslations.text("January")+" 2023",
                data:widget.data,
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
    key:key2023_2,
    child:new Month2022_1(
      days:[
        ''  ,''  ,'01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '' , '',
        '' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,
      ],
      selectedmonth: "02",
      selectedyear: "2023",
                hint: allTranslations.text("February")+" 2023",
                data:widget.data,
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
        child:new Month2022_1(
          selectedmonth: "03",
          selectedyear: "2023",
          days: [
            ''  ,''  ,'01'  , '02',
            '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
            '10' , '11' , '12' , '13' , '14' , '15' , '16',
            '17' , '18' , '19' , '20' , '21' , '22' , '23',
            '24' , '25' , '26' , '27' , '28' , '29' , '30',
            '31' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,
          ],
                hint: allTranslations.text("March")+" 2023",
                data:widget.data,
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
    key:key2023_4,
    child:new Month2022_1(
      selectedmonth: "04",
      selectedyear: "2023",
      days:[
        ''  ,''  ,''  ,''  ,''  ,'01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '29' , '30',
        '' , '' , '' , '' , '' , '' , '',
      ],
                hint: allTranslations.text("April")+" 2023",
                data:widget.data,
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
    key:key2023_5,
    child:new Month2022_1(
      selectedmonth: "05",
      selectedyear: "2023",
      days:[
        '01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '29' , '30',
        '31' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,''  ,''  ,
      ],
                hint: allTranslations.text("May")+" 2023",
                data:widget.data,
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
            key:key2023_6,
            child:new Month2022_1(
              selectedmonth: "06",
              selectedyear: "2023",
              days:[
                ''  ,''  ,''  ,'01'  , '02',
                '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                '10' , '11' , '12' , '13' , '14' , '15' , '16',
                '17' , '18' , '19' , '20' , '21' , '22' , '23',
                '24' , '25' , '26' , '27' , '28' , '29' , '30',
                '' , '' , '' , '' , '' , '' ,'',''  ,''  ,
              ],
                hint: allTranslations.text("June")+" 2023",
                data:widget.data,
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
    key:key2023_7,
    child:new Month2022_1(
      selectedmonth: "07",
      selectedyear: "2023",
      days:[
        '01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '29' , '30',
        '31' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,''  ,''  ,
      ],
                hint: allTranslations.text("July")+" 2023",
                data:widget.data,
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
    key:key2023_8,
    child:new Month2022_1(
      selectedmonth: "08",
      selectedyear: "2023",
      days:[
        ''  ,'01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '29' , '30',
        '31' , '' , '' , '' , '' , '' ,'',''  ,''  , ''  ,''  ,
      ],
                hint: allTranslations.text("August")+" 2023",
                data:widget.data,
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
    key:key2023_9,
    child:new Month2022_1(
      selectedmonth: "09",
      selectedyear: "2023",
      days:[
        ''  ,''  ,''  ,''  ,'01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '29' , '30',
        '' , '' , '' , '' , '' , '' ,'',''  ,
      ],
                hint: allTranslations.text("September")+" 2023",
                data:widget.data,
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
    key:key2023_10,
    child:new Month2022_1(
      selectedmonth: "10",
      selectedyear: "2023",
      days:[
        '',''  ,''  ,''  ,''  ,''  ,'01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '29' , '30',
        '31' , '' , '' , '' , '' , '' ,
      ],
                hint: allTranslations.text("October")+" 2023",
                data:widget.data,
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
              key:key2023_11,
              child:new Month2022_1(
                selectedmonth: "11",
                selectedyear: "2023",
                days:[
                  ''  ,''  ,'01'  , '02',
                  '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                  '10' , '11' , '12' , '13' , '14' , '15' , '16',
                  '17' , '18' , '19' , '20' , '21' , '22' , '23',
                  '24' , '25' , '26' , '27' , '28' , '29' , '30',
                  '' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,
                ],
                hint: allTranslations.text("November")+" 2023",
                data:widget.data,
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
    key:key2023_12,
    child:new Month2022_1(
      selectedmonth: "12",
      selectedyear: "2023",
      days:[
        ''  ,''  ,''  ,''  ,'01'  , '02',
        '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
        '10' , '11' , '12' , '13' , '14' , '15' , '16',
        '17' , '18' , '19' , '20' , '21' , '22' , '23',
        '24' , '25' , '26' , '27' , '28' , '29' , '30',
        '31' , '' , '' , '' , '' , '' ,'',''  ,
      ],
                hint: allTranslations.text("December")+" 2023",
                data:widget.data,
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
          // month 2023



              // month 2024
              Container(
                key:key2024_1,
                child:new Month2022_1(
                  selectedmonth: "01",
                  selectedyear: "2024",
                  days:[
                    '01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '31' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,''  ,''  ,
                  ],
                  hint: allTranslations.text("January")+" 2024",
                  data:widget.data,
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
                key:key2024_2,
                child:new Month2022_1(
                  selectedmonth: "02",
                  selectedyear: "2024",
                  days:[
                    ''  , ''  ,''  ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '',
                    '' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,
                  ],
                  hint: allTranslations.text("February")+" 2024",
                  data:widget.data,
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
                key:key2024_3,
                child:new Month2022_1(
                  selectedmonth: "03",
                  selectedyear: "2024",
                  days: [
                    ''  ,''  , ''  ,''  ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '31' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,
                  ],
                  hint: allTranslations.text("March")+" 2024",
                  data:widget.data,
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
                key:key2024_4,
                child:new Month2022_1(
                  selectedmonth: "04",
                  selectedyear: "2024",
                  days:[
                    '01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '' , '' , '' , '' , '' , '' , '','','','','','',
                  ],
                  hint: allTranslations.text("April")+" 2024",
                  data:widget.data,
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
                key:key2024_5,
                child:new Month2022_1(
                  selectedmonth: "05",
                  selectedyear: "2024",
                  days:[
                    ''  ,''  , '01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '31' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,''  ,
                  ],
                  hint: allTranslations.text("May")+" 2024",
                  data:widget.data,
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
                key:key2024_6,
                child:new Month2022_1(
                  selectedmonth: "06",
                  selectedyear: "2024",
                  days:[
                    ''  ,''  , ''  ,''  ,''  ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '' , '' , '' , '' , '' , '' ,'',''  ,''  ,
                  ],
                  hint: allTranslations.text("June")+" 2024",
                  data:widget.data,
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
                key:key2024_7,
                child:new Month2022_1(
                  selectedmonth: "07",
                  selectedyear: "2024",
                  days:[
                    '01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '31' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,''  ,''  ,''  ,
                  ],
                  hint: allTranslations.text("July")+" 2024",
                  data:widget.data,
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
                key:key2024_8,
                child:new Month2022_1(
                  selectedmonth: "08",
                  selectedyear: "2024",
                  days:[
                    ''  ,''  , ''  ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '31' , '' , '' , '' , '' , '' ,'',''  ,''  , ''  ,''  ,
                  ],
                  hint: allTranslations.text("August")+" 2024",
                  data:widget.data,
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
                key:key2024_9,
                child:new Month2022_1(
                  selectedmonth: "09",
                  selectedyear: "2024",
                  days:[
                    ''  ,''  , ''  ,''  ,''  ,''  ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '' , '' , '' , '' , '' , '' ,'',''  ,
                  ],
                  hint: allTranslations.text("September")+" 2024",
                  data:widget.data,
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
                key:key2024_10,
                child:new Month2022_1(
                  selectedmonth: "10",
                  selectedyear: "2024",
                  days:[
                    '' ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '31' , '' , '' , '' , '' , '' ,''  ,''  ,''  ,''  ,''  ,
                  ],
                  hint: allTranslations.text("October")+" 2024",
                  data:widget.data,
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
                key:key2024_11,
                child:new Month2022_1(
                  selectedmonth: "11",
                  selectedyear: "2024",
                  days:[
                    ''  ,''  ,''  ,''  ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '' , '' , '' , '' , '' , '' ,'',''  ,''  ,''  ,
                  ],
                  hint: allTranslations.text("November")+" 2024",
                  data:widget.data,
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
                key:key2024_12,
                child:new Month2022_1(
                  selectedmonth: "12",
                  selectedyear: "2024",
                  days:[
                    ''  ,''  , ''  ,''  ,''  ,''  ,'01'  , '02',
                    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
                    '10' , '11' , '12' , '13' , '14' , '15' , '16',
                    '17' , '18' , '19' , '20' , '21' , '22' , '23',
                    '24' , '25' , '26' , '27' , '28' , '29' , '30',
                    '31' , '' , '' , '' , '' , '' ,'',''  ,
                  ],
                  hint: allTranslations.text("December")+" 2024",
                  data:widget.data,
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
              // month 2024








            ],

          ),

        ),


      ),



    );
  }


  Widget listIsEmpty() {
    return new Center(
      child: new Text('Searching'),
    );
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


  void etscrol() {

    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    print('ddsdsdsdsdsdsdsdsdsgg');
    print(date);

    if(now.year==2022)
    {

      if(now.month==01)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_1.currentContext);
        });
      }
      if(now.month==02)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_2.currentContext);
        });
      }
      if(now.month==03)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_3.currentContext);
        });
      }
      if(now.month==04)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_4.currentContext);
        });
      }
      if(now.month==05)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_5.currentContext);
        });
      }
      if(now.month==06)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_6.currentContext);
        });
      }
      if(now.month==07)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_7.currentContext);
        });
      }
      if(now.month==08)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_8.currentContext);
        });
      }
      if(now.month==09)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_9.currentContext);
        });
      }
      if(now.month==10)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_10.currentContext);
        });
      }
      if(now.month==11)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_11.currentContext);
        });
      }
      if(now.month==12)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2022_12.currentContext);
        });
      }


    }



    if(now.year==2023){

      if(now.month==01)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_1.currentContext);
        });
      }
      if(now.month==02)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_2.currentContext);
        });
      }
      if(now.month==03)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_3.currentContext);
        });
      }
      if(now.month==04)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_4.currentContext);
        });
      }
      if(now.month==05)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_5.currentContext);
        });
      }
      if(now.month==06)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_6.currentContext);
        });
      }
      if(now.month==07)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_7.currentContext);
        });
      }
      if(now.month==08)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_8.currentContext);
        });
      }
      if(now.month==09)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_9.currentContext);
        });
      }
      if(now.month==10)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_10.currentContext);
        });
      }
      if(now.month==11)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_11.currentContext);
        });
      }

      if(now.month==12)
      {
        Future.delayed(Duration.zero, () {
          Scrollable.ensureVisible(key2023_12.currentContext);
        });
      }
    }




  }




}

