//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';
import 'package:mijnzpc/pages/dashboard/assignments/detassignment.dart';
import 'package:mijnzpc/all_translations.dart';
class week2023_1 extends StatefulWidget {
  final String hint;
  var day1;
  var day2;
  var day3;
  var day4;
  var day5;
  var day6;
  var day7;
  Color backgroundcolor;
  Color color;
  Color gradiantcolor;
  Color cardcolor;
  Color shadowcolor;
  Color appbarcolor;
  Color titlecolor;
  Color textcolor;
  Color bottombarcolor;
  week2023_1({this.hint, this.data, this.day1, this.day2, this.day3, this.day4, this.day5, this.day6, this.day7,this.backgroundcolor,
    this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
    this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,});


  List<Massignment> data = [];

  @override
  State<StatefulWidget> createState() => new week2023_1State();

}
class week2023_1State extends State<week2023_1> {

  String selectedmonth="01";




  void initState() {

    print('dsdsdsdsd');
   // print(widget.data[1].title);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new   Column(
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
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    child:  new  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(40, 10, 2, 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  child:
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: new Text(
                                                      allTranslations.text(widget.hint),
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
                                ],
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
              ),

              _buildPage(context,allTranslations.text(widget.day1[2]),allTranslations.text(widget.day1[0]),allTranslations.text(widget.day1[1]),1),
              _buildPage(context,allTranslations.text(widget.day2[2]),allTranslations.text(widget.day2[0]),allTranslations.text(widget.day2[1]),2),
              _buildPage(context,allTranslations.text(widget.day3[2]),allTranslations.text(widget.day3[0]),allTranslations.text(widget.day3[1]),3),
              _buildPage(context,allTranslations.text(widget.day4[2]),allTranslations.text(widget.day4[0]),allTranslations.text(widget.day4[1]),4),
              _buildPage(context,allTranslations.text(widget.day5[2]),allTranslations.text(widget.day5[0]),allTranslations.text(widget.day5[1]),5),
              _buildPage(context,allTranslations.text(widget.day6[2]),allTranslations.text(widget.day6[0]),allTranslations.text(widget.day6[1]),6),
              _buildPage(context,allTranslations.text(widget.day7[2]),allTranslations.text(widget.day7[0]),allTranslations.text(widget.day7[1]),7),
            ]

        );
  }





  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }


  Widget _buildPage(BuildContext context,String Date,String daytitle,String showdate,int numberoweek) {




    int counter1=1;
    int counter2=1;
    int counter3=1;

    int hasnot=0;
    String department1='';
    String client1='';
    String time1='';

    String department2='';
    String client2='';
    String time2='';

    String department3='';
    String client3='';
    String time3='';

    for (var i = 0; i < widget.data.length; i++) {
      print(widget.data[i].start_date);
      if(Date==widget.data[i].start_date){
        hasnot++;
        if(hasnot==1)
        {
          counter1=i;
          department1=gettoz(widget.data[i].title);
          client1=gettoz(widget.data[i].company_name);
          time1=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }
        else
        if(hasnot==2){
          counter2=i;
          department2=gettoz(widget.data[i].title);
          client2=gettoz(widget.data[i].company_name);
          time2=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }
        else
        if(hasnot==3){
          counter3=i;
          department3=gettoz(widget.data[i].title);
          client3=gettoz(widget.data[i].company_name);
          time3=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }

      }
    }

    if(hasnot==0)
    {

      if(numberoweek==7){
        return   Padding(
            padding: EdgeInsets.only(top:10,left: 8,right: 8,bottom: 0),
            child:Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Expanded(
                        flex: 1,
                        child: Text("".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 10,
                        child: Text(daytitle+" "+showdate,
                            style: TextStyle(fontSize: 14,    color: Colors.grey[500],
                              fontWeight: FontWeight.w700,)),
                      ),

                      Expanded(
                        flex: 1,
                        child: Text("".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ),





                    ]
                ),
                Padding(
                  padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
                  child: Divider(
                    height: 1,
                    color:Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            )


        );
      }
      else
        {
          return   Padding(
              padding: EdgeInsets.only(top:10,left: 8,right: 8,bottom: 0),
              child:Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: Text("".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(daytitle+" "+showdate,
                              style: TextStyle(fontSize: 14,    color: Colors.grey[500],
                                fontWeight: FontWeight.w700,)),
                        ),

                        Expanded(
                          flex: 1,
                          child: Text("".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),





                      ]
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 0),
                    child: Divider(
                      height: 1,
                      color:Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              )


          );
        }


    }
    else
    {
      if(hasnot==1)
      {
        return   Padding(
          padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
          child:  Column(
            children: <Widget>[
          Padding(
          padding: EdgeInsets.only(top:0,left: 8,right: 0,bottom: 0),
          child:
          Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(daytitle+" "+showdate,
                          style: TextStyle(fontSize: 14,      color: Colors.grey[500],
                            fontWeight: FontWeight.w700,)),
                    ),

                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
          ),



              GestureDetector(
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
                },
                child:Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                  child: Container(
                    height:110,
                    decoration: BoxDecoration(
                      color: widget.backgroundcolor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(0.0),
                      ),
                    ),

                    child: Container(
                      height:570,
                      width: double.infinity,

                      child:  Column(
                          children: <Widget>[

                            new Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                              child:Align(
                                alignment: Alignment.centerLeft,
                                child:Text(
                                  department1,
                                  style:   TextStyle(
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                    color: widget.color,
                                  ),
                                ),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.fromLTRB(40, 5, 2, 0),
                              child:Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  client1,
                                  style:   TextStyle(
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 13.0,
                                    color: widget.color,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.fromLTRB(30,1,0,0),
                              child:  new  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:   EdgeInsets.fromLTRB(9, 5, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child:   Icon(Icons.access_time,color: widget.color,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(2, 5, 2, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            child:
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                time1,
                                                textAlign: TextAlign.left,
                                                style:   TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                  color: widget.color,
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


                          ]
                      ),
                    ),




                  ),),
              ),
              Padding(
                padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 0),
                child: Divider(
                  height: 1,
                  color:Colors.grey,
                  thickness: 1,
                ),
              ),

            ],
          ),
        );
      }
      else
      if(hasnot==2)
      {
        return   Padding(
          padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
          child:  Column(
            children: <Widget>[
          Padding(
          padding: EdgeInsets.only(top:0,left: 8,right: 0,bottom: 0),
          child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(daytitle+" "+showdate,
                          style: TextStyle(fontSize: 14,    color: Colors.grey[500],
                            fontWeight: FontWeight.w700,)),
                    ),

                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
          ),


    GestureDetector(
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
    },
    child:Padding(
      padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
      child: Container(
        height:110,
        decoration: BoxDecoration(
          color: widget.backgroundcolor,
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),

        child: Container(
          height:570,
          width: double.infinity,

          child:  Column(
              children: <Widget>[

                new Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child:Text(
                      department1,
                      style:   TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      client1,
                      style:   TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(30,1,0,0),
                  child:  new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:   EdgeInsets.fromLTRB(9, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:   Icon(Icons.access_time,color: widget.color,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
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
                                    time1,
                                    textAlign: TextAlign.left,
                                    style:   TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: widget.color,
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


              ]
          ),
        ),




      ),),
    ),

    GestureDetector(
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
    },
    child:Padding(
      padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
      child: Container(
        height:110,
        decoration: BoxDecoration(
          color: widget.backgroundcolor,
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),

        child: Container(
          height:570,
          width: double.infinity,

          child:  Column(
              children: <Widget>[

                new Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child:Text(
                      department2,
                      style:  TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      client2,
                      style:  TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(30,1,0,0),
                  child:  new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(9, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:   Icon(Icons.access_time,color: widget.color,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
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
                                    time2,
                                    textAlign: TextAlign.left,
                                    style:  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: widget.color,
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


              ]
          ),
        ),




      ),),
    ),


              Padding(
                padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 0),
                child: Divider(
                  height: 1,
                  color:Colors.grey,
                  thickness: 1,
                ),
              ),




            ],
          ),
        );
      }
      else
      if(hasnot==3)
      {
        return   Padding(
          padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
          child:  Column(
            children: <Widget>[
          Padding(
          padding: EdgeInsets.only(top:0,left: 8,right: 0,bottom: 0),
          child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(daytitle+" "+showdate,
                          style: TextStyle(fontSize: 14,   color: Colors.grey[500],
                            fontWeight: FontWeight.w700,)),
                    ),

                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
          ),



    GestureDetector(
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
    },
    child: Padding(
      padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
      child: Container(
        height:110,
        decoration: BoxDecoration(
          color: widget.backgroundcolor,
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),

        child: Container(
          height:570,
          width: double.infinity,

          child:  Column(
              children: <Widget>[

                new Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child:Text(
                      department1,
                      style:  TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      client1,
                      style:  TextStyle(
                        // fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                        color: widget.color,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(30,1,0,0),
                  child:  new  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(9, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:   Icon(Icons.access_time,color: widget.color,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
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
                                    time1,
                                    textAlign: TextAlign.left,
                                    style:  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      color: widget.color,
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


              ]
          ),
        ),




      ),),
    ),


              GestureDetector(
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
                  },
                  child:    Padding(
                    padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                    child: Container(
                      height:110,
                      decoration: BoxDecoration(
                        color: widget.backgroundcolor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(0.0),
                        ),
                      ),

                      child: Container(
                        height:570,
                        width: double.infinity,

                        child:  Column(
                            children: <Widget>[

                              new Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text(
                                    department2,
                                    style:   TextStyle(
                                      // fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                      color: widget.color,
                                    ),
                                  ),
                                ),
                              ),
                              new Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    client2,
                                    style:   TextStyle(
                                      // fontWeight: FontWeight.w700,
                                      fontSize: 13.0,
                                      color: widget.color,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(30,1,0,0),
                                child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(9, 10, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child:   Icon(Icons.access_time,color:widget.color ,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
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
                                                  time2,
                                                  textAlign: TextAlign.left,
                                                  style:   TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0,
                                                    color: widget.color,
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


                            ]
                        ),
                      ),




                    ),),
              ),

              GestureDetector(
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
                  },
                  child:   Padding(
                    padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                    child: Container(
                      height:110,
                      decoration: BoxDecoration(
                        color: widget.backgroundcolor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(0.0),
                        ),
                      ),

                      child: Container(
                        height:570,
                        width: double.infinity,

                        child:  Column(
                            children: <Widget>[

                              new Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text(
                                    department3,
                                    style:   TextStyle(
                                      // fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                      color: widget.color,
                                    ),
                                  ),
                                ),
                              ),
                              new Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 2, 0),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    client3,
                                    style:   TextStyle(
                                      // fontWeight: FontWeight.w700,
                                      fontSize: 13.0,
                                      color: widget.color,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(30,1,0,0),
                                child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:   EdgeInsets.fromLTRB(9, 10, 0, 0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child:   Icon(Icons.access_time,color: widget.color,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
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
                                                  time3,
                                                  textAlign: TextAlign.left,
                                                  style:   TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0,
                                                    color: widget.color,
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


                            ]
                        ),
                      ),




                    ),),
              ),
              Padding(
                padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 0),
                child: Divider(
                  height: 1,
                  color:Colors.grey,
                  thickness: 1,
                ),
              ),


            ],
          ),
        );
      }


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


}