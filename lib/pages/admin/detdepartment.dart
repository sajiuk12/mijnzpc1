//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/mdepartments.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:maps_launcher/maps_launcher.dart';
class Detdepartments extends StatefulWidget {

  Detdepartments(
      {@required this.data,this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor});

  final Mdepartments data;
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
  State<StatefulWidget> createState() => new DetdepartmentState();

}

class DetdepartmentState extends State<Detdepartments> with AutomaticKeepAliveClientMixin<Detdepartments> {
  bool get wantKeepAlive => true;


  String title='';
  String cost='';
  String education_title='';
  String phone='';
  String requirements='';
  String description='';

  String department_description='';
  String department_requirment='';
  String department_Address='';
  String department_Phone='';
  String department_Conditions='';
  String department_Cost='';




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
          child: new Text(allTranslations.text('Department Detail'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,

      ),
      backgroundColor: widget.backgroundcolor,

      body: SingleChildScrollView(
        child:      Column(
          children: <Widget>[

            new  Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                                                           title,
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
                                        padding: EdgeInsets.fromLTRB(0,2,0,0),
                                        child:  new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[

                                            Expanded(
                                              flex: 8,
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 10, 2, 15),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      child:
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: FutureBuilder<String>(
                                                          future: getclientname(widget.data.client_id.toString()),
                                                          builder: (context, snapshot) {
                                                            if (snapshot.hasData) return Text(snapshot.data, style: TextStyle(
                                                              color: Colors.white,
                                                              // fontWeight: FontWeight.w700,
                                                              fontSize: 15.0,
                                                            ),);
                                                            else if (snapshot.hasError) return Text(snapshot.error);
                                                            return Text(allTranslations.text("Searching"));
                                                          },
                                                        ),
                                                      ),


                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),


                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      child:
                                                      Align(
                                                        alignment: Alignment.centerRight,
                                                        child: new Text(
                                                          cost,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            //fontWeight: FontWeight.w500,
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







                  Expanded(
                    flex: 10,
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

                              onPressed: (){

                              },
                              child: Padding(
                                padding:EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child:Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(Icons.delete, size: 25),
                                          ),
                                        ],
                                      ),
                                    )
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

                            onPressed: (){

                            },
                            child: Center(
                              child: Text(allTranslations.text("Agreement")),
                            ),

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
                    flex: 10,
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

                            onPressed: (){

                            },
                            child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.create_rounded, size: 25),
                                      ),
                                    ],
                                  ),
                                )
                            ),

                          )





                      ),


                    ),
                  ),


                ]
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
                              child:   Icon(Icons.location_on_outlined,color:widget.color,),
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
                              child:InkWell(
                                onTap: () {
                                  MapsLauncher.launchQuery(department_Address,);
                                },
                                child:                             new Text(
                                  department_Address,
                                  textAlign: TextAlign.left,
                                  style:   TextStyle(
                                    //fontWeight: FontWeight.w500,
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
              padding: EdgeInsets.fromLTRB(0,1,0,10),
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
                              child:   Icon(Icons.call,color:widget.color,),
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
                              child: InkWell(
                                onTap: () {
                                  _launchPhoneURL();
                                },
                                child:    new Text(
                                  phone,
                                  textAlign: TextAlign.left,
                                  style:   TextStyle(
                                    //fontWeight: FontWeight.w500,
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
                                            //fontWeight: FontWeight.w500,
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
                                            //fontWeight: FontWeight.w500,
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
                                            //fontWeight: FontWeight.w500,
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
                                            //fontWeight: FontWeight.w500,
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
      child: new Text(allTranslations.text('Searching'),style:TextStyle(color: Colors.grey,)),
    );
  }



  getdet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/departmentinfo?token='+token+'&id='+widget.data.id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['department'].toList().length > 0)
      {
        setState(() {
          title=responseBody['department'][0]['title'].toString();
          cost=responseBody['department'][0]['cost'].toString();
          education_title=responseBody['department'][0]['education_title'].toString();
          phone=responseBody['department'][0]['phone'].toString();
          description=responseBody['department'][0]['description'].toString();
          requirements=responseBody['department'][0]['requirements'].toString();

          if(responseBody['department'][0]['cost']!=null){
            department_Cost=responseBody['department'][0]['cost'].toString();
          }





          if(responseBody['department'][0]['description']!=null){
             department_description=responseBody['department'][0]['description'].toString();
          }


          if(responseBody['department'][0]['requirements']!=null){
            department_requirment=responseBody['department'][0]['requirements'].toString();
          }

          if(responseBody['department'][0]['phone']!=null){
            department_Phone=responseBody['department'][0]['phone'].toString();
          }

          if(responseBody['department'][0]['conditions']!=null){
            department_Conditions=responseBody['department'][0]['conditions'].toString();
          }




          // department_Address=responseBody['department_addresses'][0]['address'].toString()+" "+responseBody['department_addresses'][0]['city'].toString();
            //

          department_Address=responseBody['department_addresses'][0]['address'].toString()+" "+responseBody['department_addresses'][0]['home_number'].toString()+"\n"+responseBody['department_addresses'][0]['postcode'].toString()+" "+responseBody['department_addresses'][0]['city'].toString();





        });
      }

    }

  }


  Future<String> getclientname(String id) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+id.toString();
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];
      if(responseBody['profile'].toList().length > 0)
      {
        return responseBody['profile'][0]['company_name'].toString();
      }
      else
      {
        return '0';
      }
    }
  }


  _launchPhoneURL() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String type = prefs.getString('user.type');
    String tell='';

    String url ='https://mijnzpc.com/api/v1/departmentinfo?token='+token+'&id='+widget.data.id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];


      if(responseBody['department'].toList().length > 0)
      {


        tell=responseBody['department'][0]['phone'].toString();








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





