//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/all_translations.dart';
class Selectcolor extends StatefulWidget {
  Selectcolor(
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
  ClientsState createState() => ClientsState();
}

class ClientsState extends State<Selectcolor> {



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: new AppBar(
          toolbarHeight: 40,
          iconTheme: IconThemeData(
            color: widget.titlecolor, //change your color here
          ),
          title:Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Text(allTranslations.text('Select color'),style: TextStyle(color: Colors.grey),),),
          backgroundColor: widget.bottombarcolor,

        ),
        backgroundColor: widget.backgroundcolor,

        body:
        SingleChildScrollView(
          child:      Column(
              children: <Widget>[

        Container(
          padding: EdgeInsets.fromLTRB(5, 12, 5, 5),

          child:


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child: SizedBox(

                        height: 100, // <-- match-parent
                        child :  ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xff89B44B),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xff89B44B);
                            widget.gradiantcolor = Color(0xff313F1A);
                            widget.appbarcolor=Color(0xff89B44B);
                          });


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


                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '1');
                          // Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
               ),
                ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child: SizedBox(

                      height: 100, // <-- match-parent
                      child :    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xffFF6B22),
                        ),
                        onPressed: () async{

                          setState(() {
                            widget.color = Color(0xffFF6B22);
                            widget.gradiantcolor = Color(0xff59240B);
                            widget.appbarcolor=Color(0xffFF6B22);
                          });


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




                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '2');
                          // Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                    ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                        child: SizedBox(

                      height: 100, // <-- match-parent
                      child :    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xff5E95BC),
                        ),
                        onPressed: () async{

                          setState(() {
                            widget.color = Color(0xff5E95BC);
                            widget.gradiantcolor = Color(0xff263E4C);
                            widget.appbarcolor=Color(0xff5E95BC);
                          });


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

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '3');
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                        ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                          height: 100, // <-- match-parent
                          child :    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xffF2C500),
                        ),
                        onPressed: () async {
                          setState(() {
                            widget.color = Color(0xffF2C500);
                            widget.gradiantcolor = Color(0xff554607);
                            widget.appbarcolor=Color(0xffF2C500);
                          });


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

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '4');
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                          ),
                        ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                          height: 100, // <-- match-parent
                          child :    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xff798BF2),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xff798BF2);
                            widget.gradiantcolor = Color(0xff262C4C);
                            widget.appbarcolor=Color(0xff798BF2);
                          });


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
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '5');
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                        ),
                        ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                          height: 100, // <-- match-parent
                          child :     ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xffDA4040),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xffDA4040);
                            widget.gradiantcolor = Color(0xff4C1617);
                            widget.appbarcolor=Color(0xffDA4040);
                          });


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
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '6');
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                        ),
                        ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                            height: 100, // <-- match-parent
                            child :    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xff9E956E),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xff9E956E);
                            widget.gradiantcolor = Color(0xff3F3B2C);
                            widget.appbarcolor=Color(0xff9E956E);
                          });


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
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '7');
                          // Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                          ),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child:   Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                            height: 100, // <-- match-parent
                            child :   ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xff606060),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xff606060);
                            widget.gradiantcolor = Color(0xff000000);
                            widget.appbarcolor=Color(0xff606060);
                          });


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
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '8');
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                          ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child:     Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                            height: 100, // <-- match-parent
                            child : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xff006AA5),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xff006AA5);
                            widget.gradiantcolor = Color(0xff001C2B);
                            widget.appbarcolor=Color(0xff006AA5);
                          });


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
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '9');
                          // Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child:   Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                            height: 100, // <-- match-parent
                            child :   ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xffE271A2),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xffE271A2);
                            widget.gradiantcolor = Color(0xff4C2637);
                            widget.appbarcolor=Color(0xffE271A2);
                          });


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
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '10');
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                          ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child:   Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                            height: 100, // <-- match-parent
                            child :   ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xff63C7C7),
                        ),
                        onPressed: () async{
                          setState(() {
                            widget.color = Color(0xff63C7C7);
                            widget.gradiantcolor = Color(0xff264C4C);
                            widget.appbarcolor=Color(0xff63C7C7);
                          });


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
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user.color', '11');
                          // Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                          ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Expanded(
                      flex: 15,
                      child:    Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(

                            height: 100, // <-- match-parent
                            child :  ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          primary: Color(0xffC0C0C0),
                        ),
                        onPressed: () async{                          setState(() {
                          widget.color = Color(0xffC0C0C0);
                          widget.gradiantcolor = Color(0xff4C4C4C);
                          widget.appbarcolor=Color(0xffC0C0C0);
                        });


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
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('user.color', '12');
                          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashScreen()));
                        },
                        child: Text(''),
                      ),
                          ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ]
              ),



            ],
          ),
        ),
        ],),),

      );
  }








  _changeLanguage(BuildContext context,String lang) async {
    await allTranslations.setNewLanguage(lang);
    Navigator.pushReplacementNamed(context, '/home');
  }

  checkLanguage(String lang) {
    return allTranslations.currentLanguage == lang
        ? new Icon(Icons.check)
        : new SizedBox();
  }


}