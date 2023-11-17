//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SelectLanguageScreen extends StatefulWidget {
  SelectLanguageScreen(
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
  SelectLanguageScreenState createState() => SelectLanguageScreenState();
}

class SelectLanguageScreenState extends State<SelectLanguageScreen> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print(allTranslations.currentLanguage);

    return new Scaffold(

      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: widget.titlecolor, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Select language'),style: TextStyle(color: Colors.grey),),),
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
                leading: new Image.asset("assets/images/nl.png",
                    width: 25,
                    height: 25,
                    fit:BoxFit.fill),
                trailing: checkLanguage('en'),
                title: new Text('NL',style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 14
                ),),
                onTap: () {
                  _changeLanguage(context,'en');
                },
              ),
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
              child:   new ListTile(
                leading: new Image.asset("assets/images/en.png",
                    width: 25,
                    height: 25,
                    fit:BoxFit.fill),
                trailing: checkLanguage('nl'),
                title: new Text('EN',style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 14
                ),),
                onTap: () {
                  _changeLanguage(context,'nl');
                },
              ),
            ),


          ),

          // new ListTile(
          //   title: new Text('en'),
          //   onTap: () {
          //     _changeLanguage(context,'en');
          //   },
          //   trailing: checkLanguage('en'),
          // ),
          // new ListTile(
          //   title: new Text('nl'),
          //   onTap: () {
          //     _changeLanguage(context,'nl');
          //   },
          //   trailing: checkLanguage('nl'),
          // ),   // new ListTile(
          //   title: new Text('nl'),
          //   onTap: () {
          //     _changeLanguage(context,'nl');
          //   },
          //   trailing: checkLanguage('nl'),
          // ),
        ],
      ),
    );
  }






  _changeLanguage(BuildContext context,String lang) async {
    await allTranslations.setNewLanguage(lang);
    // Navigator.pushReplacementNamed(context, '/home');

    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
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



  }

  checkLanguage(String lang) {
    return allTranslations.currentLanguage == lang
        ? new Icon(Icons.check,color: Colors.grey,)
        : new SizedBox();
  }


}