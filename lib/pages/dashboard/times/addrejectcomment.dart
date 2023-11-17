//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/animations/singin_animation.dart';
import 'package:mijnzpc/components/Form.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mijnzpc/pages/forgetpassword.dart';
import 'package:mijnzpc/pages/login_screen.dart';
import 'package:mijnzpc/pages/mainregister.dart';
import 'package:mijnzpc/pages/resetpassword.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/models/mtimes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mijnzpc/all_translations.dart';
class Addrejectcomment extends StatefulWidget {

  Addrejectcomment(
      {@required this.assignmentid,this.backgroundcolor,this.email,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,this.gradiantcolor
      });

  String assignmentid;
  String email;
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


  @override
  State<StatefulWidget> createState() => new AddrejectcommentState();

}

class AddrejectcommentState extends State<Addrejectcomment> with SingleTickerProviderStateMixin {
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
      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Reject Comment'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,

      ),


      backgroundColor: widget.backgroundcolor,
      body: Container(

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
                                      padding: EdgeInsets.only(top:0.0),
                                      child:  new Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[


                                          Padding(
                                            padding: EdgeInsets.only(top:40,left: 12,right: 12),
                                            child: TextFormField(
                                              style: TextStyle(color: Colors.grey), //<-- SEE HERE
                                              onChanged: (text){_emailValue=text;},
                                              decoration: InputDecoration(
                                                hintText: "",
                                                hintStyle: TextStyle(color: Colors.grey),

                                                border: myinputborder(),
                                                enabledBorder: myinputborder(),
                                                focusedBorder: myfocusborder(),
                                                filled: true, //<-- SEE HERE
                                                fillColor: widget.backgroundcolor, //<-- SEE HERE
                                              ),
                                              textAlign: TextAlign.left,

                                            ),
                                          ),








                                          Padding(
                                            padding: EdgeInsets.only(top:0,left: 6,right: 6),
                                            child: new FlatButton(
                                              onPressed:  () {

                                              },
                                              child:Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  allTranslations.text("please write your comment"),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.grey,
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
                                                            widget.gradiantcolor,
                                                            widget.color,
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

                                                      onPressed: ()async{

                                                        if(_emailValue==null)
                                                        {
                                                          return showDialog(
                                                              context: context,
                                                              builder: (context) {
                                                                return new Directionality(
                                                                    textDirection: TextDirection.ltr,
                                                                    child: new AlertDialog(
                                                                      backgroundColor: widget.bottombarcolor,
                                                                      title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                                      content: new Text(allTranslations.text("please fill your comment"),style: TextStyle(color: Colors.grey)),
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
                                                                        title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                                        content: new Text(allTranslations.text('Save reject comment?'),style: TextStyle(color: Colors.grey)),
                                                                        actions: <Widget>[
                                                                          new FlatButton(
                                                                              onPressed: () => Navigator.of(context).pop(false),
                                                                              child: new Text(allTranslations.text('No') , style: TextStyle(color: Colors.red),)
                                                                          ),
                                                                          new FlatButton(
                                                                              onPressed: () async {


                                                                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                String token = prefs.getString('user.api_token');

                                                                                String url ='https://mijnzpc.com/api/v1/addcommmentass?token='+token+'&id='+widget.assignmentid.toString()+'&comment='+_emailValue;
                                                                                print(url);
                                                                                final response = await http.get(Uri.parse(url),);
                                                                                var responseBody = json.decode(response.body);

                                                                                if(responseBody['code']==1)
                                                                                {
                                                                                  Navigator.of(context).pop();
                                                                                  return showDialog(
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return new Directionality(
                                                                                            textDirection: TextDirection.ltr,
                                                                                            child: new AlertDialog(
                                                                                              backgroundColor: widget.bottombarcolor,
                                                                                              title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                                                              content: new Text(allTranslations.text(responseBody['msg']),style: TextStyle(color: Colors.grey)),
                                                                                              actions: <Widget>[

                                                                                                new FlatButton(
                                                                                                    onPressed: () {
                                                                                                      // exit(0);

                                                                                                      Navigator.of(context).pop();
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
                                                                                else
                                                                                {
                                                                                  Navigator.of(context).pop();
                                                                                  return showDialog(
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return new Directionality(
                                                                                            textDirection: TextDirection.ltr,
                                                                                            child: new AlertDialog(
                                                                                              backgroundColor: widget.bottombarcolor,
                                                                                              title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                                                                                              content: new Text(allTranslations.text(responseBody['msg']),style: TextStyle(color: Colors.grey)),
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





                                                                              },
                                                                              child: new Text(allTranslations.text('Yes') , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                                                                          ),
                                                                        ],
                                                                      )
                                                                  )
                                                              );
                                                            }
                                                        ) ?? false;






                                                      },
                                                      child: Padding(
                                                        padding:EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                        ),
                                                        child:Center(
                                                          child: Text(allTranslations.text('Confirm') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                                        ),
                                                      )
                                                  )
                                              )

                                          ),



                                          // InkWell(
                                          //   child: new Padding(
                                          //     padding: EdgeInsets.only(top: 50),
                                          //     child: Row(
                                          //       mainAxisAlignment : MainAxisAlignment.center,
                                          //       mainAxisSize: MainAxisSize.max,
                                          //       children: <Widget>[
                                          //         Align(
                                          //           alignment: Alignment.bottomCenter,
                                          //           child: Image.asset(
                                          //             "assets/images/newlogo.png",
                                          //             height: 200,
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),




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


      // if(response['data']['verify']==0)
      //   {
      //     navigationToVerify();
      //   }
      // else
      //   {
      Navigator.pushReplacementNamed(context, "/home");
      //}



    } else {
      await _loginButtonController.reverse();

      return showDialog(
          context: context,
          builder: (context) {
            return new Directionality(
                textDirection: TextDirection.ltr,
                child: new AlertDialog(
                  backgroundColor: widget.bottombarcolor,
                  title: new Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey)),
                  content: new Text(allTranslations.text(response['data']['msg']),style: TextStyle(color: Colors.grey)),
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