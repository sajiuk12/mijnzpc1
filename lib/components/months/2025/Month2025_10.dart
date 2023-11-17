//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
class Month2025_10 extends StatefulWidget {
  final String hint;
  Color backgroundcolor;
  Color color;
  Color gradiantcolor;
  Color cardcolor;
  Color shadowcolor;
  Color appbarcolor;
  Color titlecolor;
  Color textcolor;
  Color bottombarcolor;
  Month2025_10({this.hint, this.data,this.backgroundcolor,
    this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
    this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,});


  List<Massignment> data = [];

  @override
  State<StatefulWidget> createState() => new Month2025_10State();

}
class Month2025_10State extends State<Month2025_10> {

  String selectedmonth="10";
  String selectedyear="2025";

  var days = [
    '' ,'' ,'01'  , '02',
    '03'  , '04'  , '05' , '06' , '07' , '08' , '09',
    '10' , '11' , '12' , '13' , '14' , '15' , '16',
    '17' , '18' , '19' , '20' , '21' , '22' , '23',
    '24' , '25' , '26' , '27' , '28' , '29' , '30',
    '31' , '' , '' , '' , '' , '' ,''  ,''  ,''  ,''  ,''  ,
  ];



  void initState() {

    print('dsdsdsdsd');
    print(widget.data[1].title);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new  Padding(
      padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
      child:     Container(
        width: MediaQuery.of(context).size.width,
        // height: 140.0,

        child: Column(
            children: <Widget>[

              //title of month
              Padding(
                padding: EdgeInsets.fromLTRB(0,5,0,5),
                child: new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[


                      Expanded(
                        flex: 25,
                        child:     Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,0,0,0),
                              child:  new  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  Expanded(
                                    flex: 20,
                                    child: Container(

                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 0, 2, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child:
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: new Text(
                                                  widget.hint,
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    // fontWeight: FontWeight.w700,
                                                    fontSize: 16.0,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),


                                            ),
                                          ],
                                        ),
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
                          flex: 5,
                          child:

                          Container(
                            padding: const EdgeInsets.all(0.0),

                            child:    Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                                  child:  new  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[

                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                child:
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: new Text(
                                                    "",
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
                        flex: 5,
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
                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child:
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                "",
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
                        flex: 5,
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
                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child:
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                "",
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
                        flex: 5,
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
                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child:
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                "",
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
                        flex: 5,
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
                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child:
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                "",
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
                        flex: 5,
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
                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child:
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                "",
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

              ),
              //title of month

              //title of week
              Container(
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        widget.gradiantcolor,
                        widget.color,
                        //add more colors
                      ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(0.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                  child: new  Row(
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
                                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child:
                                              Align(
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "Mo",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    // fontWeight: FontWeight.w700,
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

                              child:    Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    child:  new  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[

                                        Expanded(
                                          flex: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  child:
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: new Text(
                                                      "The",
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                        // fontWeight: FontWeight.w700,
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
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child:
                                              Align(
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "Wen",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    // fontWeight: FontWeight.w700,
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
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child:
                                              Align(
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "Thu",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    // fontWeight: FontWeight.w700,
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
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child:
                                              Align(
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "Fr",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    // fontWeight: FontWeight.w700,
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
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child:
                                              Align(
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "Sa",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    // fontWeight: FontWeight.w700,
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
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Expanded(
                                      flex: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child:
                                              Align(
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "So",
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    // fontWeight: FontWeight.w700,
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
                ),
              ),
              //title of week


              //title of days
              Container(
                color: widget.backgroundcolor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                  child: new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[0],days[0]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[1],days[1]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[2],days[2]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[3],days[3]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[4],days[4]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[5],days[5]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[6],days[6]),
                        ),
                      ]
                  ),
                ),
              ),
              //title of days
              Divider(
                height: 1,
                color:Colors.grey,
                thickness: 1,
              ),
              //title of days


              //title of days
              Container(
                color: widget.backgroundcolor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                  child: new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[7],days[7]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[8],days[8]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[9],days[9]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[10],days[10]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[11],days[11]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[12],days[12]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[13],days[13]),
                        ),
                      ]
                  ),
                ),
              ),
              //title of days
              Divider(
                height: 1,
                color:Colors.grey,
                thickness: 1,
              ),
              //title of days


              //title of days
              Container(
                color: widget.backgroundcolor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                  child: new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[14],days[14]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[15],days[15]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[16],days[16]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[17],days[17]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[18],days[18]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[19],days[19]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[20],days[20]),
                        ),
                      ]
                  ),
                ),
              ),
              //title of days
              Divider(
                height: 1,
                color:Colors.grey,
                thickness: 1,
              ),
              //title of days





              //title of days
              Container(
                color: widget.backgroundcolor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                  child: new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[21],days[21]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[22],days[22]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[23],days[23]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[24],days[24]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[25],days[25]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[26],days[26]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[27],days[27]),
                        ),
                      ]
                  ),
                ),
              ),
              //title of days
              Divider(
                height: 1,
                color:Colors.grey,
                thickness: 1,
              ),
              //title of days


              //title of days
              Container(
                color: widget.backgroundcolor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                  child: new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[28],days[28]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[29],days[29]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[30],days[30]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[31],days[31]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[32],days[32]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[33],days[33]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[34],days[34]),
                        ),
                      ]
                  ),
                ),
              ),
              //title of days
              Divider(
                height: 1,
                color:Colors.grey,
                thickness: 1,
              ),
              //title of days


              //title of days
              Container(
                color: widget.backgroundcolor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,5,0,5),
                  child: new  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[35],days[35]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[36],days[36]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[37],days[37]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[38],days[38]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[39],days[39]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[40],days[40]),
                        ),
                        Expanded(
                          flex: 12,
                          child:
                          _buildChatPage(context,selectedyear+'-'+selectedmonth+"-"+days[41],days[41]),
                        ),
                      ]
                  ),
                ),
              ),
              //title of days
              Divider(
                height: 1,
                color:Colors.grey,
                thickness: 1,
              ),
              //title of days






            ]

        ),
      ),


    );
  }





  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }


  Widget _buildChatPage(BuildContext context,String Date,String days) {


    if(_isNumeric(days) != true)
    {
      return   Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,7,0,7),
            child:  new  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 2, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[


                        SizedBox(
                          child:
                          Align(
                            alignment: Alignment.centerLeft,
                            child:    Container(
                              // margin: EdgeInsets.all(10),
                              // padding: EdgeInsets.all(10),
                              width: 30,
                              height: 30,
                              child:   Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onSurface: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    //make color or elevated button transparent
                                  ),onPressed: (){},
                                  child: Text('',  style: TextStyle(fontSize: 11.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                  ),

                                    textAlign: TextAlign.center,),),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                color: widget.backgroundcolor,
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
      );
    }



    int day=0;
    day=int.parse(days)+1;
    day=day-1;
    print('ewewewe');
    print(Date);
    int hasnot=0;
    String department1='';
    String client1='';
    String date1='';
    String time1='';

    int counter1=1;
    int counter2=1;
    int counter3=1;

    String department2='';
    String client2='';
    String date2='';
    String time2='';

    String department3='';
    String client3='';
    String date3='';
    String time3='';

    for (var i = 0; i < widget.data.length; i++) {
      if(Date==widget.data[i].start_date){
        hasnot++;
        if(hasnot==1)
        {
          counter1=i;
          department1=gettoz(widget.data[i].title);
          client1=gettoz(widget.data[i].clientfirstname)+" "+gettoz(widget.data[i].clientlastname);
          date1=widget.data[i].start_date;
          time1=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }
        else
        if(hasnot==2){
          counter2=i;
          department2=gettoz(widget.data[i].title);
          client2=gettoz(widget.data[i].clientfirstname)+" "+gettoz(widget.data[i].clientlastname);
          date2=widget.data[i].start_date;
          time2=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }
        else
        if(hasnot==3){
          counter3=i;
          department3=gettoz(widget.data[i].title);
          client3=gettoz(widget.data[i].clientfirstname)+" "+gettoz(widget.data[i].clientlastname);
          date3=widget.data[i].start_date;
          time3=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }

      }
    }

    if(hasnot==0)
    {
      return   Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child:  new  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[


                        SizedBox(
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            // padding: EdgeInsets.all(10),
                            width: 50,
                            height: 50,
                            child:  ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                                //make color or elevated button transparent
                              ),onPressed: (){},
                              child: Text(day.toString(),  style: TextStyle(fontSize: 12.0,
                                // fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),

                              ),),


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
      );
    }
    else
    {
      return   Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child:  new  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[


                        SizedBox(
                          child:
                          Align(
                            alignment: Alignment.center,
                            child:    Container(

                              // margin: EdgeInsets.all(10),
                              // padding: EdgeInsets.all(10),
                              width: 50,
                              height: 50,
                              child:   Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onSurface: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    //make color or elevated button transparent
                                  ),onPressed: (){

                                  showDialog(

                                      context: context,
                                      builder: (BuildContext context)
                                      {

                                        if(hasnot==1)
                                        {
                                          return Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  AlertDialog(
                                                    backgroundColor: widget.backgroundcolor,
                                                    content:    Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            height: 150.0, // Change as per your requirement
                                                            width: 300.0, // Change as per your requirement
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                                                                  data: widget.data[counter1],
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
                                                                // Navigator.push(context,
                                                                //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                                                // );
                                                              },
                                                              child: Padding(
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
                                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                  child:   new Column(
                                                                    children: <Widget>[

                                                                      Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: <Widget>[
                                                                          Align(
                                                                            alignment: Alignment.centerLeft,
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                              child:Text(department1,style: TextStyle(
                                                                                color: Colors.grey[700],
                                                                                // fontWeight: FontWeight.w700,
                                                                                fontSize: 17.0,
                                                                              ),),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment: Alignment.centerLeft,
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                              child: Text(client1.toString(), style: TextStyle(
                                                                                color: Colors.grey,
                                                                                // fontWeight: FontWeight.w700,
                                                                                fontSize: 12.0,
                                                                              ),),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height: 5.0,
                                                                          ),
                                                                          Align(
                                                                            alignment: Alignment.centerLeft,
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                                                              child:  Wrap(
                                                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                                                children: [
                                                                                  Icon(Icons.calendar_today,color: widget.color,),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                                                    child: Text(eurodate(date1.toString()),
                                                                                      style: TextStyle(
                                                                                        color: Colors.grey,
                                                                                        // fontWeight: FontWeight.w700,
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height: 5.0,
                                                                          ),
                                                                          Align(
                                                                            alignment: Alignment.centerLeft,
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                              child: Wrap(
                                                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                                                children: [
                                                                                  Icon(Icons.access_time,color: widget.color,),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                                                    child:Text(time1,style: TextStyle(
                                                                                      color: Colors.grey,
                                                                                      // fontWeight: FontWeight.w700,
                                                                                      fontSize: 14.0,
                                                                                    ),),),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),



                                                                        ],
                                                                      ),

                                                                      // Divider(
                                                                      //     color: Colors.amberAccent[400]
                                                                      // ),
                                                                    ],
                                                                  ),

                                                                ),
                                                              ), ),
                                                          ),
                                                        ]
                                                    ),

                                                  )
                                                ],
                                              )
                                          );
                                        }
                                        else
                                        if(hasnot==2)
                                        {
                                          return Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                AlertDialog(
                                                  backgroundColor: widget.backgroundcolor,
                                                  content:    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          height: 150.0, // Change as per your requirement
                                                          width: 300.0, // Change as per your requirement
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                                                                data: widget.data[counter1],
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
                                                              // Navigator.push(context,
                                                              //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                                              // );
                                                            },
                                                            child: Padding(
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
                                                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                child:   new Column(
                                                                  children: <Widget>[

                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: <Widget>[
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child:Text(department1,style: TextStyle(
                                                                              color: Colors.grey[700],
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 17.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child: Text(client1.toString(), style: TextStyle(
                                                                              color: Colors.grey,
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 12.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                                                            child:  Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.calendar_today,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                                                  child: Text(eurodate(date1.toString()),
                                                                                    style: TextStyle(
                                                                                      color: Colors.grey,
                                                                                      // fontWeight: FontWeight.w700,
                                                                                      fontSize: 14.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                            child: Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.access_time,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                                                  child:Text(time1,style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                    // fontWeight: FontWeight.w700,
                                                                                    fontSize: 14.0,
                                                                                  ),),),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),



                                                                      ],
                                                                    ),

                                                                    // Divider(
                                                                    //     color: Colors.amberAccent[400]
                                                                    // ),
                                                                  ],
                                                                ),

                                                              ),
                                                            ), ),
                                                        ),
                                                        Container(
                                                          height: 150.0, // Change as per your requirement
                                                          width: 300.0, // Change as per your requirement
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                                                                data: widget.data[counter2],
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
                                                              // Navigator.push(context,
                                                              //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                                              // );
                                                            },
                                                            child: Padding(
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
                                                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                child:   new Column(
                                                                  children: <Widget>[

                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: <Widget>[
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child:Text(department2,style: TextStyle(
                                                                              color: Colors.grey[700],
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 17.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child: Text(client2.toString(), style: TextStyle(
                                                                              color: Colors.grey,
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 12.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                                                            child:  Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.calendar_today,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                                                  child: Text(eurodate(date2.toString()),
                                                                                    style: TextStyle(
                                                                                      color: Colors.grey,
                                                                                      // fontWeight: FontWeight.w700,
                                                                                      fontSize: 14.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                            child: Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.access_time,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                                                  child:Text(time2,style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                    // fontWeight: FontWeight.w700,
                                                                                    fontSize: 14.0,
                                                                                  ),),),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),



                                                                      ],
                                                                    ),

                                                                    // Divider(
                                                                    //     color: Colors.amberAccent[400]
                                                                    // ),
                                                                  ],
                                                                ),

                                                              ),
                                                            ), ),
                                                        ),
                                                      ]
                                                  ),

                                                ),
                                              ],),);
                                        }
                                        else
                                        if(hasnot==3)
                                        {
                                          return Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                AlertDialog(
                                                  backgroundColor: widget.backgroundcolor,
                                                  content:    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          height: 150.0, // Change as per your requirement
                                                          width: 300.0, // Change as per your requirement
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                                                                data: widget.data[counter1],
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
                                                              // Navigator.push(context,
                                                              //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                                              // );
                                                            },
                                                            child: Padding(
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
                                                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                child:   new Column(
                                                                  children: <Widget>[

                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: <Widget>[
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child:Text(department1,style: TextStyle(
                                                                              color: Colors.grey[700],
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 17.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child: Text(client1.toString(), style: TextStyle(
                                                                              color: Colors.grey,
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 12.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                                                            child:  Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.calendar_today,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                                                  child: Text(eurodate(1.toString()),
                                                                                    style: TextStyle(
                                                                                      color: Colors.grey,
                                                                                      // fontWeight: FontWeight.w700,
                                                                                      fontSize: 14.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                            child: Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.access_time,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                                                  child:Text(time1,style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                    // fontWeight: FontWeight.w700,
                                                                                    fontSize: 14.0,
                                                                                  ),),),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),



                                                                      ],
                                                                    ),

                                                                    // Divider(
                                                                    //     color: Colors.amberAccent[400]
                                                                    // ),
                                                                  ],
                                                                ),

                                                              ),
                                                            ), ),
                                                        ),
                                                        Container(
                                                          height: 150.0, // Change as per your requirement
                                                          width: 300.0, // Change as per your requirement
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                                                                data: widget.data[counter2],
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
                                                              // Navigator.push(context,
                                                              //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                                              // );
                                                            },
                                                            child: Padding(
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
                                                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                child:   new Column(
                                                                  children: <Widget>[

                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: <Widget>[
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child:Text(department2,style: TextStyle(
                                                                              color: Colors.grey[700],
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 17.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child: Text(client2.toString(), style: TextStyle(
                                                                              color: Colors.grey,
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 12.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                                                            child:  Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.calendar_today,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                                                  child: Text(eurodate(date2.toString()),
                                                                                    style: TextStyle(
                                                                                      color: Colors.grey,
                                                                                      // fontWeight: FontWeight.w700,
                                                                                      fontSize: 14.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                            child: Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.access_time,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                                                  child:Text(time2,style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                    // fontWeight: FontWeight.w700,
                                                                                    fontSize: 14.0,
                                                                                  ),),),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),



                                                                      ],
                                                                    ),

                                                                    // Divider(
                                                                    //     color: Colors.amberAccent[400]
                                                                    // ),
                                                                  ],
                                                                ),

                                                              ),
                                                            ), ),
                                                        ),
                                                        Container(
                                                          height: 150.0, // Change as per your requirement
                                                          width: 300.0, // Change as per your requirement
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Detassignment(
                                                                data: widget.data[counter3],
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
                                                              // Navigator.push(context,
                                                              //     new MaterialPageRoute(builder: (context) => new Detassignment(data: _recordsdata[index] ))
                                                              // );
                                                            },
                                                            child: Padding(
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
                                                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                child:   new Column(
                                                                  children: <Widget>[

                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: <Widget>[
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child:Text(department3,style: TextStyle(
                                                                              color: Colors.grey[700],
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 17.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                                            child: Text(client3.toString(), style: TextStyle(
                                                                              color: Colors.grey,
                                                                              // fontWeight: FontWeight.w700,
                                                                              fontSize: 12.0,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                                                            child:  Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.calendar_today,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                                                                                  child: Text(eurodate(date3.toString()),
                                                                                    style: TextStyle(
                                                                                      color: Colors.grey,
                                                                                      // fontWeight: FontWeight.w700,
                                                                                      fontSize: 14.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 5.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                                            child: Wrap(
                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                              children: [
                                                                                Icon(Icons.access_time,color: widget.color,),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                                                                                  child:Text(time3,style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                    // fontWeight: FontWeight.w700,
                                                                                    fontSize: 14.0,
                                                                                  ),),),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),



                                                                      ],
                                                                    ),

                                                                    // Divider(
                                                                    //     color: Colors.amberAccent[400]
                                                                    // ),
                                                                  ],
                                                                ),

                                                              ),
                                                            ), ),
                                                        ),
                                                      ]
                                                  ),

                                                ),
                                              ],),);

                                        }




                                      }
                                  );

                                },
                                  child: Text(day.toString(),  style: TextStyle(fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    color:widget.color,

                                  ),

                                    textAlign: TextAlign.center,),),
                              ),

                              // decoration: BoxDecoration(
                              //
                              //   border:Border.all(width:2,color: Color(0xff89B44B),),
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(100),
                              //   ),
                              //   color: Colors.white,
                              // ),
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
      );
    }



  }



  gettoz(string)
  {
    if(string==null)
    {
      return "-";
    }
    else
    {
      return string;
    }
  }

  eurodate(String date)
  {

    final splitted = date.split('-');
    return splitted[2]+"-"+splitted[1]+"-"+splitted[0];


  }
}