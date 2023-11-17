//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/animations/singin_animation.dart';
import 'package:mijnzpc/components/Form.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/forgetpassword.dart';
import 'package:mijnzpc/pages/homeadmin.dart';
import 'package:mijnzpc/pages/mainregister.dart';
import 'package:mijnzpc/pages/resetpassword.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:http/http.dart' as http;
class Notactive extends StatefulWidget {


  Notactive(
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
  State<StatefulWidget> createState() => new NotactiveState();

}

class NotactiveState extends State<Notactive> with SingleTickerProviderStateMixin {
  AnimationController _loginButtonController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _emailValue;
  String _passwordValue;

  emailOnSaved(String value) {
    _emailValue = value;
  }

  passwordOnSaved(String value) {
    _passwordValue = value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setcolor();
    _loginButtonController = new AnimationController(vsync: this , duration: new Duration(milliseconds: 3000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonController.dispose();
    super.dispose();
  }
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    timeDilation = .4;
    var page = MediaQuery.of(context).size;

    return Scaffold(




      body:


      Container(
        color: Color(0xfff2f2f2),

        child: Container(

          // color: Colors.amber,
            alignment: Alignment.topCenter,
            child:
            new SingleChildScrollView(

              child: Form(
                key: _formKey,
                child:
                new Column(
                    children: <Widget>[



                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 13,
                              ),

                            ],
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xff425626),
                                Color(0xff89B44B),

                              ],
                            )
                        ),

                        child:

                        Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top:50,left: 12,right: 12,bottom: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                  Text(allTranslations.text("Dear user,"),style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                      fontSize: 20
                                  ),),),
                              ),


                              Padding(
                                padding: EdgeInsets.only(top:5,left: 12,right: 12,bottom: 25),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                  Text(allTranslations.text("Your account is not active"),style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                      fontSize: 14
                                  ),),),
                              ),







                            ]),




                      ),











                      Container(

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),

                        child:  new SingleChildScrollView(
                          child:new Column(
                              children: <Widget>[


                                new Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[



                                    Padding(
                                      padding: EdgeInsets.only(top:40.0),
                                      child:  new Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[







                                        Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  allTranslations.text("Your account is being processed."),
                                                  style: TextStyle(
                                                    color: Colors.grey[500],
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 14
                                                  ),
                                                ),
                                              ),

                                          Padding(
                                            padding: EdgeInsets.only(top:0,left: 1,right: 1,bottom: 40),
                                            child: new FlatButton(
                                              onPressed:  () {
                                                // Navigator.pop(context);
                                                // Navigator.push(context, new MaterialPageRoute(builder: (context) => new Forgetpassword()));
                                              },
                                              child:Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  allTranslations.text("You will receive an e-mail if status update occurs."),
                                                  style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 12
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),



                                      Padding(
                                        padding: EdgeInsets.only(top:0,left: 0,right: 0,bottom: 40),
                                        child: SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              height: 45,
                                              child:  DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.bottomCenter,
                                                          end: Alignment.topCenter,
                                                          colors: [
                                                            Color(0xff425626),
                                                            Color(0xff89B44B),
                                                            //add more colors
                                                          ]),
                                                      borderRadius: BorderRadius.circular(0),
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                            offset: Offset(0.0, 3.75),
                                                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                                                            blurRadius: 5) //blur radius of shadow
                                                      ]
                                                  ),
                                                  child:ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.transparent,
                                                        onSurface: Colors.transparent,
                                                        shadowColor: Colors.transparent,
                                                        //make color or elevated button transparent
                                                      ),

                                                      onPressed: ()async {
                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                        await prefs.remove('user.api_token');

                                                        Navigator.of(context).pushReplacementNamed('/login');

                                                      },
                                                      child: Padding(
                                                        padding:EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                        ),
                                                        child:Center(
                                                          child: Text(allTranslations.text('Log out') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                                        ),
                                                      )
                                                  )
                                              )

                                        ),
                                      ),



                                          InkWell(
                                            child: new Padding(
                                              padding: EdgeInsets.only(top: 50),
                                              child: Row(
                                                mainAxisAlignment : MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Image.asset(
                                                      "assets/images/newlogo.png",
                                                      height: 200,
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


                              ]),
                        ),
                      ),




                    ]
                ),
              ),

            )






        ),
      ),










    );
  }
  navigationToVerify() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int verify = prefs.getInt('user.verify');

    final response = await  http.get(Uri.parse('http://immer-kauf.de/api/v1/sendcode?token=' + verify.toString()));

    Navigator.of(context).pushReplacementNamed('/verify');
  }
  sendDataForLogin() async {

    Map response = await (new AuthService()).sendDataToLogin({ "email" : _emailValue  , "password" : _passwordValue });

    if( response['status'] == 'success' ) {
      await storeUserData(response['data']);


      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
          backgroundcolor: Colors.white,
          color: Color(0xff89B44B),
          gradiantcolor:Color(0xff313F1A),
          cardcolor:Colors.white,
          shadowcolor:Color.fromRGBO(0, 0, 0, 0.50),
          appbarcolor: Colors.white,
          titlecolor:Colors.grey[700],
          textcolor:Colors.grey[500]
      )));
      //Navigator.pushReplacementNamed(context, "/home");



    } else {
      await _loginButtonController.reverse();

      return showDialog(
          context: context,
          builder: (context) {
            return new Directionality(
                textDirection: TextDirection.ltr,
                child: new AlertDialog(
                  title: new Text(allTranslations.text('Alert')),
                  content: new Text(allTranslations.text(response['data']['msg'])),
                  actions: <Widget>[

                    new FlatButton(
                        onPressed: () {
                          // exit(0);
                          Navigator.of(context).pop();
                        },
                        child: new Text(allTranslations.text('Ok'), style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),)
                    ),
                  ],
                )
            );
          }
      ) ?? false;




    }
  }

  setcolor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user.color', '0xff89B44B');
  }




  storeUserData(Map userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user.api_token', userData['token']);
    await prefs.setString('user.first_name', userData['first_name']+" "+userData['last_name']);
    await prefs.setString('user.pic', userData['pic']);
    await prefs.setString('user.email', userData['email']);
    await prefs.setString('user.type', userData['user_type']);
    await prefs.setString('user.caninsertassignment', userData['caninsertassignment']);
    await prefs.setInt('user.id', userData['user_id']);
    await prefs.setInt('user.is_activated', userData['is_activated']);
    await prefs.setString('user.email_verified', userData['email_verified']);
    await prefs.setString('user.color', '1');
    await prefs.setString('user.darkmode', '0');
  }


  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.grey,
          width: 1,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.grey,
          width: 1,
        )
    );
  }


}