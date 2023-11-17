//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/pages/select_language_secreen.dart';
import 'package:mijnzpc/pages/selectcolor.dart';
import 'package:mijnzpc/all_translations.dart';
class SettingScreen extends StatefulWidget {
  SettingScreen(
      {@required this.backgroundcolor,
        this.color,this.gradiantcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor
      });

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
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: widget.titlecolor, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Configuration'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,

      ),
      backgroundColor: widget.backgroundcolor,

      body: new ListView(
        children: <Widget>[

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
              child:   new ListTile(
                leading: new Icon(Icons.language,color: Colors.grey,),
                title: new Text(allTranslations.text('Select Language'),style: TextStyle(
                   // fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 14
                ),),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SelectLanguageScreen(
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
                  //Navigator.pushNamed(context, '/settings/select_language');
                },
              ),
            ),


          ),








          Padding(
            padding: EdgeInsets.only(top:5,left: 0,right: 0,bottom: 5),
            child:   Container(
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
              child:    new ListTile(
                leading: new Icon(Icons.color_lens,color: Colors.grey,),
                title: new Text(allTranslations.text('Select Color'),style: TextStyle(
                    //fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 14
                ),),
                onTap: () {

                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Selectcolor(
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



                  // Navigator.push(context, new MaterialPageRoute(builder: (context) => new Selectcolor()));
                },
              ),
            ),

          ),









        ],
      ),
    );
  }









}