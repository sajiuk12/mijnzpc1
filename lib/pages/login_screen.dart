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

import 'package:http/http.dart' as http;import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mijnzpc/all_translations.dart';
class LoginScreen extends StatefulWidget {


  LoginScreen(
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
  State<StatefulWidget> createState() => new LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  AnimationController _loginButtonController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _emailValue;
  String _passwordValue;

  bool _passwordVisible=false;

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

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) {
          return new Container(
              decoration:   BoxDecoration(
                color:widget.backgroundcolor,
              ),
              child: new Directionality(
                  textDirection: TextDirection.ltr,
                  child: new AlertDialog(
                    backgroundColor: widget.bottombarcolor,
                    title: new Text(allTranslations.text('Are you sure you want to leave?'),style: TextStyle(color: Colors.grey)),
                    content: new Text(allTranslations.text('Selecting the Yes option will exit the application'),style: TextStyle(color: Colors.grey)),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: new Text(allTranslations.text('No' ), style: TextStyle(color: Colors.red),)
                      ),
                      new FlatButton(
                          onPressed: () {
                            // exit(0);
                            SystemNavigator.pop();
                          },
                          child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                      ),
                    ],
                  )
              )
          );
        }
    ) ?? false;
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
    return new WillPopScope(
        child: new Scaffold(


      bottomSheet:

      new  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Expanded(
              flex: 1,
              child: Text("".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),

            Expanded(
              flex: 15,
              child: Text(allTranslations.text("Dont you have a account yet?"),
                  style: TextStyle(fontSize: 13,    color: Color(0xff89B44B),
                    fontWeight: FontWeight.w700,)),
            ),




            Expanded(
              flex: 12,
              child:  Padding(
                padding: EdgeInsets.only(top:6,left: 0,right: 0,bottom: 6),
                child:  SizedBox(
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

                            onPressed: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Mainregister()));
                            },
                            child: Padding(
                              padding:EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              child:Center(
                                child: Text(allTranslations.text('Create') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                              ),
                            )
                        )
                    )

                ),


              ),
            ),







          ]
      ),


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
                            Text(allTranslations.text("Sign in"),style: TextStyle(
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
                            Text(allTranslations.text("Please sign in to your registered account"),style: TextStyle(
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


                                      Padding(
                                        padding: EdgeInsets.only(top:5,left: 12,right: 12),
                                        child: TextFormField(
                                          onChanged: (text){_emailValue=text;
                                          print(_emailValue);},
                                          decoration: InputDecoration(
                                            hintText: allTranslations.text("Username"),
                                            hintStyle: TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(Icons.people,color: Colors.grey,),
                                            border: myinputborder(),
                                            enabledBorder: myinputborder(),
                                            focusedBorder: myfocusborder(),
                                            filled: true, //<-- SEE HERE
                                            fillColor: Colors.white, //<-- SEE HERE
                                          ),
                                          textAlign: TextAlign.left,

                                        ),
                                      ),


                                      Padding(
                                        padding: EdgeInsets.only(top:10.0,left: 12,right: 12),
                                        child:  TextFormField(
                                          obscureText: !_passwordVisible,//This will obscure text dynamically
                                          onChanged: (text){_passwordValue=text;},
                                          decoration: InputDecoration(
                                            hintText: allTranslations.text("Password"),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color:  Color(0xff89B44B),
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  _passwordVisible = !_passwordVisible;
                                                });
                                              },
                                            ),
                                            hintStyle: TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(Icons.password,color: Colors.grey,),
                                            border: myinputborder(),
                                            enabledBorder: myinputborder(),
                                            focusedBorder: myfocusborder(),
                                            filled: true, //<-- SEE HERE
                                            fillColor: Colors.white, //<-- SEE HERE
                                          ),
                                          textAlign: TextAlign.left,
                                          validator: (text) {
                                            if (text == null || text.isEmpty) {
                                              return 'Please Fill Out This Field';
                                            }
                                            return null;
                                          },
                                        ),

                                      ),





                                      Padding(
                                        padding: EdgeInsets.only(top:15,left: 6,right: 12,bottom: 15),
                                        child:Align(
                                          alignment: Alignment.centerRight,
                                          child:InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Forgetpassword()));
                                            },
                                            child: new Text(
                                              allTranslations.text("Forget Password"),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff89B44B),
                                                  fontSize: 14
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),



                                      SizedBox(
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

                                                onPressed: (){
                                                  sendDataForLogin();
                                                },
                                                child: Padding(
                                                  padding:EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                  ),
                                                  child:Center(
                                                    child: Text(allTranslations.text('Login') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                                  ),
                                                )
                                            )
                                        )

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










    ),
    onWillPop: _onWillPop
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

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String apiToken = prefs.getString('user.api_token');

        final response1 = await http.get(Uri.parse('https://mijnzpc.com/api/v1/checkuser?token=' + apiToken));

        var responseBody = json.decode(response1.body)['data'];
        print(responseBody);

        if(responseBody['email'] == 0)
        {
          print('email not active');
           navigationToemail();
        }


        if(responseBody['code'] == -1)
        {
          print('user not login');
          //navigationToLogin();
        }
        else
        if(responseBody['code'] == 0)
        {
          print('user not active');
          navigationTonotactive();
        }
        else
        if(responseBody['code'] == 1)
        {
          print('user is firstactive');
          navigationTofirstactive();
        }
        else
        if(responseBody['code'] == 2)
        {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
              backgroundcolor: Colors.white,
              color: Color(0xff89B44B),
              gradiantcolor:Color(0xff313F1A),
              cardcolor:Colors.white,
              shadowcolor:Color.fromRGBO(0, 0, 0, 0.50),
              appbarcolor: Colors.white,
              titlecolor:Colors.grey[700],
              textcolor:Colors.grey[500],
              bottombarcolor:Colors.white,
          )));
        }





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
  navigationToemail(){
    Navigator.of(context).pushReplacementNamed('/confirmemail');
  }

  navigationTonotactive() {
    Navigator.of(context).pushReplacementNamed('/notactive');
  }
  navigationTofirstactive() {
    Navigator.of(context).pushReplacementNamed('/firstactive');
  }
  navigationToLogin() {


    Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginScreen()));


    //Navigator.of(context).pushReplacementNamed('/login');
  }


  storeUserData(Map userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user.api_token', userData['token']);
    await prefs.setString('user.first_name', userData['first_name']+" "+userData['last_name']);
    await prefs.setString('user.pic', userData['pic']);
    await prefs.setString('user.email', userData['email']);
    await prefs.setString('user.type', userData['user_type']);
    if(userData['caninsertassignment']!=null){
      await prefs.setString('user.caninsertassignment', userData['caninsertassignment']);
    }
    else
      {
        await prefs.setString('user.caninsertassignment', '0');
      }


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