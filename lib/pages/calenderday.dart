//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Calenderday extends StatefulWidget {
  Calenderday(
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
  State<StatefulWidget> createState() => new CalenderdayState();

}

class CalenderdayState extends State<Calenderday> with AutomaticKeepAliveClientMixin<Calenderday> {
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

  bool ten1h1=false;
  bool ten1h2=false;
  bool ten1h3=false;



  bool ten2h1=true;
  bool ten2h2=true;
  bool ten2h3=true;



  @override
  Widget build(BuildContext context) {

    super.build(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
          child: new Text('Calender',style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.backgroundcolor,
        actions: [
      Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child:
        Text('Day',style: TextStyle(color: Colors.grey,fontSize: 18),
        ),
      ),
          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Day"),
                  ),

                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Week"),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Month"),
                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){
                  print("My account menu is selected.");
                }else if(value == 1){
                  print("Settings menu is selected.");
                }else if(value == 2){
                  print("Logout menu is selected.");
                }
              }
          ),


        ],
      ),



      // backgroundColor:Colors.grey[300],
      body:

      SingleChildScrollView(
        child:

        Container(
        color: Color(0xffF5F4F5),
    child: Column(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 0),
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
                              padding: EdgeInsets.fromLTRB(0,20,0,0),
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
                                                "Week 4",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
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
                                  Expanded(
                                    flex: 2,
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
                                                "<    >",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25.0,
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









                    ]
                ),



                new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[


                      Expanded(
                        flex: 12,
                        child:     Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,20,0,10),
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
                                                "Mo",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
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
                          flex: 12,
                          child:

                          Container(
                            padding: const EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 2.0, color: Colors.white),
                              ),
                            ),
                            child:    Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0,20,0,10),
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
                                                    "The",
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w700,
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
                          )






                      ),

                      Expanded(
                        flex: 12,
                        child:     Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,20,0,10),
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
                                                "Wen",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
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
                        flex: 12,
                        child:     Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,20,0,10),
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
                                                "Thu",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
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
                        flex: 12,
                        child:     Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,20,0,10),
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
                                                "Fr",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
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
                        flex: 12,
                        child:     Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,20,0,10),
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
                                                "Sa",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
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
                        flex: 12,
                        child:     Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,20,0,10),
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
                                                "So",
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
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



                    ]
                ),




              ],
            ),
          ),


        ),



        Padding(
          padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
          child:     Container(
            width: MediaQuery.of(context).size.width,
            // height: 140.0,
            color: Colors.white,
            child:

            Column(
              children: [



                Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  child:  new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 2, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child:
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    "24 jun 2023",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
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
                  ),
                ),



              ],
            ),
          ),


        ),



        Padding(
          padding: EdgeInsets.only(top:0.0,left: 10,right: 0),
          child: Container(
            width: double.infinity,
            height: 1170,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/vv.jpg")
              ),
            ),


            child:Padding(
              padding: EdgeInsets.only(top:0.0,left: 70,right: 0),
              child:   Container(


                child:  new SingleChildScrollView(
                  child:new Column(
                      children: <Widget>[
                      Container(
                      height:570,
                        child: Container(
                          height:570,
                          width: double.infinity,

                          child:  Column(
                            children: <Widget>[


                              // 00:00 tile 01:00
                              ten1h1 ? Container(
                                height:24,
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  border: Border.all(width: 1, color: widget.color,),
                                ),
                                child: Center(
                                  child: Text('Department : Test' ,textAlign: TextAlign.left,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold)),
                                ),
                              ): new Container(),
                              ten1h2 ? Container(
                                height:24,
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  border: Border.all(width: 5, color: widget.color,),
                                ),
                                child: Center(
                                  child: Text('Client : Test' ,textAlign: TextAlign.left,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold)),
                                ),
                              ): new Container(),

                              // 00:00 tile 01:00


                              // 00:00 tile 01:00
                              ten2h1 ? Container(
                                height:25,
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  border: Border.all(width: 5, color: widget.color,),
                                ),
                              ): new Container(),
                              ten2h2 ? Container(
                                height:25,
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  border: Border.all(width: 5, color: widget.color,),
                                ),
                              ): new Container(),

                              // 00:00 tile 01:00


                            ]
                        ),
                        ),




                      ),

                      ]),
                ),
              ),
            ),





          ),

        )














      ],

    ),

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
      child: new Text('در حال جستجو  '),
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








}





