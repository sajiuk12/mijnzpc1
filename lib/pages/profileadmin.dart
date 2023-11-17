//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/models/musers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/pages/dashboard/invoices/managedocuments.dart';
import 'dart:convert';

import 'package:mijnzpc/pages/uploadavatar.dart';
import 'package:mijnzpc/all_translations.dart';

class Profileadmin extends StatefulWidget {

  Profileadmin(
      {@required this.data,this.backgroundcolor,this.gradiantcolor,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor
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
  final Musers data;

  @override
  State<StatefulWidget> createState() => new ProfileadminState();

}

class ProfileadminState extends State<Profileadmin> with AutomaticKeepAliveClientMixin<Profileadmin> {
  bool get wantKeepAlive => true;

  String first_name = '-';
  String last_name = '-';
  String pic ='https://mijnzpc.com/deeee.jpg';
  String email = '-';
  String tell ='-';


  String adress = '-';
  String homenumber = '-';
  String postalcode = '-';
  String city = '-';






  String addressextra = '-';
  String state = '-';
  String country = '-';
  String joinedat = '-';
  String role = '-';

  String registeras = '-';
  String birthdate = '-';
  String gender = '-';
  String mobile = '-';
  String educationtitle = '-';

  String kvk = '-';
  String companyname = '-';
  String btwnumber = '-';
  String ibannumber = '-';
  String ibanholder = '-';

  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    super.build(context);
    return Scaffold(

      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: widget.titlecolor, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Profile'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,

      ),
      backgroundColor: widget.backgroundcolor,

      body: Container(
        width: double.infinity,
        child: new SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            widget.gradiantcolor,
                            widget.color,

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
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,5,0,0),
                          child: new  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 12,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                                        child:  new  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 8,
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 10, 2, 20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      child:
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: new Text(
                                                          first_name+" "+last_name,
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
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 135,
                  alignment: Alignment.center,
                  child:Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top:10.0,left: 10,right: 10),
                        child:   Container(
                          decoration: BoxDecoration(
                            color: widget.cardcolor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(0.0),
                            ),
                          ),
                          child:  new SingleChildScrollView(
                            child:new Column(
                              children: <Widget>[
                                new Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[

                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Uploadavatar(
                                            backgroundcolor: widget.backgroundcolor,
                                            color: widget.color,
                                            gradiantcolor:widget.gradiantcolor,
                                            cardcolor:widget.cardcolor,
                                            shadowcolor:widget.shadowcolor,
                                            appbarcolor: widget.appbarcolor,
                                            titlecolor:widget.titlecolor,
                                            bottombarcolor:widget.bottombarcolor,
                                            textcolor:widget.textcolor,

                                          )),
                                        );
                                      }, // Image tapped
                                      child:  Padding(
                                        padding: EdgeInsets.only(top:10,left:10,right: 10,bottom: 10),
                                        child:  new Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0.0, 0.0, 0.0, 0.0),
                                              child: new Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: new BoxDecoration(
                                                      image: new DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: new NetworkImage(
                                                            pic
                                                        ),
                                                      )
                                                  )),
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
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top:10,left: 0,right: 0,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color:  widget.cardcolor,
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 3.75),
                              color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ]
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Column(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                          },
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  collapsedIconColor: Colors.grey,
                                  iconColor: Colors.grey,
                                  title: Text(allTranslations.text('Personal information'),style: TextStyle(color: Colors.grey,
                                    fontSize: 18.0,),),
                                  children: <Widget>[
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                      child:
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: Text(allTranslations.text('First name : '),style: TextStyle(color: Colors.grey[600],fontSize: 15.0,)),
                                          ),

                                          Expanded(
                                            flex: 5,
                                            child:  Text(first_name,style: TextStyle(color: Colors.grey,
                                              fontSize: 15.0,)),
                                          ),



                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                      child:
                                      Row(
                                        children: <Widget>[


                                          Expanded(
                                            flex: 3,
                                            child: Text(allTranslations.text('Last name :'),style: TextStyle(color: Colors.grey[600],fontSize: 15.0,)),
                                          ),

                                          Expanded(
                                            flex: 5,
                                            child:  Text(last_name,style: TextStyle(color: Colors.grey,
                                              fontSize: 15.0,)),
                                          ),




                                        ],
                                      ),
                                    ),







                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //information collapse
                //contact collapse
                Padding(
                  padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color:  widget.cardcolor,
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0.0, 3.75),
                              color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                              blurRadius: 5) //blur radius of shadow
                        ]
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: new Column(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                          },
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  collapsedIconColor: Colors.grey,
                                  iconColor: Colors.grey,
                                  title: Text(allTranslations.text('Contact information'),style: TextStyle(color: Colors.grey,
                                    fontSize: 18.0,),),
                                  children: <Widget>[
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:5,left: 15,right: 0,bottom: 5),
                                      child:
                                      Row(
                                        children: <Widget>[

                                          Expanded(
                                            flex: 3,
                                            child: Text(allTranslations.text('Email : '),style: TextStyle(color: Colors.grey[600],fontSize: 15.0,)),
                                          ),

                                          Expanded(
                                            flex: 5,
                                            child:  Text(email,style: TextStyle(color: Colors.grey,
                                              fontSize: 15.0,)),
                                          ),



                                        ],
                                      ),
                                    ),




                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Divider(
                        //     color: Colors.amberAccent[400]
                        // ),
                      ],
                    ),
                  ),
                ),
                //contact collapse

              ]),
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
      child: new Text(allTranslations.text('searching')),
    );
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



  getdet() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    int id = prefs.getInt('user.id');
    String url ='https://mijnzpc.com/api/v1/userinfo?token='+token+'&id='+id.toString();
    print(url);
    final response = await http.get(Uri.parse(url),);
    if(response.statusCode == 200) {
      var responseBody = json.decode(response.body)['data'];

      if(responseBody['profile'].toList().length > 0)
      {
        print('gggggggg');
        setState(() {
          first_name = responseBody['profile'][0]['first_name'];
          last_name = responseBody['profile'][0]['last_name'];
          if(responseBody['profile'][0]['registeras']!=null){
            registeras = responseBody['profile'][0]['registeras'];
          }
          if(responseBody['profile'][0]['registeras1']!=null && responseBody['profile'][0]['registeras1']!=""){
            registeras +=", "+responseBody['profile'][0]['registeras1'];
          }

          if(responseBody['profile'][0]['education_title']!=null && responseBody['profile'][0]['education_title']!="")
          {
            educationtitle+=responseBody['profile'][0]['education_title']+"\n";
          }


          if(responseBody['profile'][0]['educationtitle1']!=null && responseBody['profile'][0]['educationtitle1']!="")
          {
            educationtitle+=responseBody['profile'][0]['educationtitle1']+"\n";
          }

          if(responseBody['profile'][0]['educationtitle2']!=null && responseBody['profile'][0]['educationtitle2']!="")
          {
            educationtitle+=responseBody['profile'][0]['educationtitle2']+"\n";
          }


          if(responseBody['profile'][0]['educationtitle3']!=null && responseBody['profile'][0]['educationtitle3']!="")
          {
            educationtitle+=responseBody['profile'][0]['educationtitle3']+"\n";
          }

          if(responseBody['profile'][0]['educationtitle4']!=null && responseBody['profile'][0]['educationtitle4']!="")
          {
            educationtitle+=responseBody['profile'][0]['educationtitle4']+"\n";
          }

          if(responseBody['profile'][0]['educationtitle5']!=null && responseBody['profile'][0]['educationtitle5']!="")
          {
            educationtitle+=responseBody['profile'][0]['educationtitle5']+"\n";
          }

          if(responseBody['profile'][0]['educationtitle6']!=null && responseBody['profile'][0]['educationtitle6']!="")
          {
            educationtitle+=responseBody['profile'][0]['educationtitle6']+"\n";
          }

          if(responseBody['profile'][0]['profile_url']!=null) {
            pic = responseBody['profile'][0]['profile_url'];
            var tt = json.decode(pic);
            pic ='https://mijnzpc.com'+tt['images'];
          }

          if(responseBody['profile'][0]['company_name']!=null){
            companyname = responseBody['profile'][0]['company_name'];
          }




          if(responseBody['profile'][0]['mobile']!=null){
            mobile = responseBody['profile'][0]['mobile'];
          }



          if(responseBody['profile'][0]['phone']!=null){
            tell = responseBody['profile'][0]['phone'];
          }



          if(responseBody['profile'][0]['kvk_number']!=null){
            kvk = responseBody['profile'][0]['kvk_number'];
          }


          if(responseBody['profile'][0]['btw_number']!=null){
            btwnumber = responseBody['profile'][0]['btw_number'];
          }

          if(responseBody['profile'][0]['gender']!=null){
            gender = responseBody['profile'][0]['gender'];
          }

          if(responseBody['profile'][0]['role']!=null){
            role = responseBody['profile'][0]['role'];
          }

          joinedat = responseBody['profile'][0]['created_at'];

          if(responseBody['profile'][0]['date_of_birth']!=null){
            birthdate = responseBody['profile'][0]['date_of_birth'];
          }


          email = responseBody['User'][0]['email'];

          if(responseBody['Address'].toList().length > 0){
            print('11111');
            print(responseBody['Address'][0]['address']);


            if(responseBody['Address'][0]['address_extra']!=null){
              addressextra = responseBody['Address'][0]['address_extra'];
            }






            state = responseBody['Address'][0]['state'];
            country = responseBody['Address'][0]['country'];
            adress = responseBody['Address'][0]['address'];
            homenumber = responseBody['Address'][0]['home_number'];
            postalcode = responseBody['Address'][0]['postcode'];
            city = responseBody['Address'][0]['city'];
          }


          if(responseBody['Financial'].toList().length > 0) {
            ibannumber = responseBody['Financial'][0]['iban_number'];
            ibanholder = responseBody['Financial'][0]['iban_holder'];
          }



        });
      }

    }

  }


}
