//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/massignment.dart';

class week2023_50 extends StatefulWidget {
  final String hint;

  week2023_50({this.hint, this.data});


  List<Massignment> data = [];

  @override
  State<StatefulWidget> createState() => new week2023_50State();

}
class week2023_50State extends State<week2023_50> {

  String selectedmonth="01";


  var day1 = [
    'Monday'  ,'02 January 2023','2023-01-02','02'
  ];
  var day2 = [
    'Theusday'  ,'03 January 2023','2023-01-03','03'
  ];
  var day3 = [
    'Wednesday'  ,'04 January 2023','2023-01-04','04'
  ];
  var day4 = [
    'Thursday'  ,'05 January 2023','2023-01-05','05'
  ];
  var day5 = [
    'Friday'  ,'06 January 2023','2023-01-06','06'
  ];
  var day6 = [
    'Saturday'  ,'07 January 2023','2023-01-07','07'
  ];
  var day7 = [
    'Sunday'  ,'08 January 2023','2023-01-08','08'
  ];

  void initState() {

    print('dsdsdsdsd');
    print(widget.data[1].title);

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
                          Color(0xff425626),
                          Color(0xff89B44B),
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
                                            padding: const EdgeInsets.fromLTRB(10, 10, 2, 10),
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

              _buildPage(context,day1[2],day1[0],day1[1]),
              _buildPage(context,day2[2],day2[0],day2[1]),
              _buildPage(context,day3[2],day3[0],day3[1]),
              _buildPage(context,day4[2],day4[0],day4[1]),
              _buildPage(context,day5[2],day5[0],day5[1]),
              _buildPage(context,day6[2],day6[0],day6[1]),
              _buildPage(context,day7[2],day7[0],day7[1]),
            ]

        );
  }





  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }


  Widget _buildPage(BuildContext context,String Date,String daytitle,String showdate) {






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
          department1=gettoz(widget.data[i].title);
          client1=gettoz(widget.data[i].clientfirstname)+" "+gettoz(widget.data[i].clientlastname);
          time1=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }
        else
        if(hasnot==2){
          department2=gettoz(widget.data[i].title);
          client2=gettoz(widget.data[i].clientfirstname)+" "+gettoz(widget.data[i].clientlastname);
          time2=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }
        else
        if(hasnot==3){
          department3=gettoz(widget.data[i].title);
          client3=gettoz(widget.data[i].clientfirstname)+" "+gettoz(widget.data[i].clientlastname);
          time3=gettoz(widget.data[i].maintime_from)+"-"+gettoz(widget.data[i].maintime_to);
        }

      }
    }

    if(hasnot==0)
    {
      return   Padding(
  padding: EdgeInsets.only(top:20,left: 0,right: 0,bottom: 40),
  child: Row(
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
              style: TextStyle(fontSize: 14,    color: Color(0xff89B44B),
                fontWeight: FontWeight.w700,)),
        ),
        Expanded(
          flex: 10,
          child:  Divider(
            height: 1,
            color:Colors.grey,
            thickness: 1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text("".toUpperCase(),
              style: TextStyle(fontSize: 14)),
        ),
      ]
  ),
);
    }
    else
    {
      if(hasnot==1)
      {
        return   Padding(
          padding: EdgeInsets.only(top:20,left: 0,right: 0,bottom: 0),
          child:  Column(
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
                          style: TextStyle(fontSize: 14,    color: Color(0xff89B44B),
                            fontWeight: FontWeight.w700,)),
                    ),
                    Expanded(
                      flex: 10,
                      child:  Divider(
                        height: 1,
                        color:Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                child: Container(
                  height:110,
                  decoration: BoxDecoration(
                    color: Color(0xff89B44B),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Colors.white,
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: Colors.white,
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
                                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child:   Icon(Icons.access_time,color: Colors.white,),
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
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
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


                        ]
                    ),
                  ),




                ),),
            ],
          ),
        );
      }
      else
      if(hasnot==2)
      {
        return   Padding(
          padding: EdgeInsets.only(top:20,left: 0,right: 0,bottom: 0),
          child:  Column(
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
                          style: TextStyle(fontSize: 14,    color: Color(0xff89B44B),
                            fontWeight: FontWeight.w700,)),
                    ),
                    Expanded(
                      flex: 10,
                      child:  Divider(
                        height: 1,
                        color:Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                child: Container(
                  height:110,
                  decoration: BoxDecoration(
                    color: Color(0xff89B44B),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Colors.white,
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: Colors.white,
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
                                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child:   Icon(Icons.access_time,color: Colors.white,),
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
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
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


                        ]
                    ),
                  ),




                ),),
              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                child: Container(
                  height:110,
                  decoration: BoxDecoration(
                    color: Color(0xff89B44B),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Colors.white,
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: Colors.white,
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
                                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child:   Icon(Icons.access_time,color: Colors.white,),
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
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
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


                        ]
                    ),
                  ),




                ),),
            ],
          ),
        );
      }
      else
      if(hasnot==3)
      {
        return   Padding(
          padding: EdgeInsets.only(top:20,left: 0,right: 0,bottom: 0),
          child:  Column(
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
                          style: TextStyle(fontSize: 14,    color: Color(0xff89B44B),
                            fontWeight: FontWeight.w700,)),
                    ),
                    Expanded(
                      flex: 10,
                      child:  Divider(
                        height: 1,
                        color:Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                child: Container(
                  height:110,
                  decoration: BoxDecoration(
                    color: Color(0xff89B44B),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Colors.white,
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: Colors.white,
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
                                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child:   Icon(Icons.access_time,color: Colors.white,),
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
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
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


                        ]
                    ),
                  ),




                ),),
              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                child: Container(
                  height:110,
                  decoration: BoxDecoration(
                    color: Color(0xff89B44B),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Colors.white,
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: Colors.white,
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
                                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child:   Icon(Icons.access_time,color: Colors.white,),
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
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
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


                        ]
                    ),
                  ),




                ),),
              Padding(
                padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 0),
                child: Container(
                  height:110,
                  decoration: BoxDecoration(
                    color: Color(0xff89B44B),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Colors.white,
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: Colors.white,
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
                                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child:   Icon(Icons.access_time,color: Colors.white,),
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
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
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


                        ]
                    ),
                  ),




                ),),
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