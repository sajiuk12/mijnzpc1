//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/animations/singin_animation.dart';
import 'package:mijnzpc/components/Form.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mijnzpc/pages/dashboard/invoices/homecartinvoice.dart';
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
class Sendinvoice extends StatefulWidget {

  Sendinvoice(
      {@required this.timesid,this.backgroundcolor,this.email,
        this.color,this.bottomcolor,this.cardcolor,this.shadowcolor,
        this.appbarcolor,this.titlecolor,this.textcolor,this.bottombarcolor,this.gradiantcolor
      });

   int timesid;
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
  State<StatefulWidget> createState() => new SendtimesState();

}

class SendtimesState extends State<Sendinvoice> with SingleTickerProviderStateMixin {
  AnimationController _loginButtonController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _emailValue;
  String _passwordValue;
  bool sendinvoice=true;






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
    checksendinvoice();
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
          color: widget.titlecolor, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Choose invoice number : '),style: TextStyle(color: Colors.grey),),),
        backgroundColor: widget.bottombarcolor,

      ),


      backgroundColor: widget.backgroundcolor,
      body: Container(
        color: widget.backgroundcolor,

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
                                              style: TextStyle(color: widget.textcolor),
                                              onChanged: (text){_emailValue=text;},
                                              decoration: InputDecoration(
                                                hintText: "#",
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
                                            padding: EdgeInsets.only(top:20,left: 6,right: 6,bottom: 50),
                                            child: new FlatButton(
                                              onPressed:  () {

                                              },
                                              child:Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  allTranslations.text("The number can only include digits and (-) sign"),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.grey,
                                                      fontSize: 14
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),


                                          sendinvoice ?  SizedBox(
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
                                                                      content: new Text(allTranslations.text("please insert your invoice number"),style: TextStyle(color: Colors.grey)),
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



                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              bool showyes=true;
                                                              bool noshowyes=false;

                                                              return AlertDialog(
                                                                backgroundColor: widget.bottombarcolor,
                                                                content: StatefulBuilder(  // You need this, notice the parameters below:
                                                                  builder: (BuildContext context, StateSetter setState) {
                                                                    return Column(  // Then, the content of your dialog.
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      children: <Widget>[
                                                                        Align(
                                                                            alignment: Alignment.centerLeft,
                                                                            child: Padding(
                                                                            padding: EdgeInsets.only(left: 1.0,bottom: 20),
                                                                        child: Text(allTranslations.text('Alert'),style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,  fontSize: 18.0,)),),),

                                                                        showyes ?  Align(
                                                                            alignment: Alignment.centerLeft,
                                                                            child: Text(allTranslations.text('You are about to send this invoice. Proceed?'),style: TextStyle(color: Colors.grey)),):new Container(),
                                                                        noshowyes ?  Align(
                                                                            alignment: Alignment.centerLeft,
                                                                            child: Text(allTranslations.text('In progress'),style: TextStyle(color: Colors.grey)),):new Container(),
                                                                    Padding(
                                                                    padding: EdgeInsets.only(left: 1.0,top: 20),
                                                                    child: Row(
                                                                    children: <Widget>[
                                                                    Expanded(
                                                                    flex: 8,
                                                                    child:Text(""),),

                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:  showyes? FlatButton(
                                                                          child: Text(allTranslations.text('No'),style: TextStyle(color: Colors.red)),
                                                                          onPressed: () => setState(() {
                                                                            Navigator.of(context).pop(false);
                                                                          })):new Container(),
                                                                    ),

                                                                      Expanded(
                                                                        flex: 8,
                                                                        child:   showyes?  FlatButton(
                                                                            child: Text(allTranslations.text('Yes'),style: TextStyle(color: Colors.green)),
                                                                            onPressed: () async {

                                                                              setState(() {
                                                                                sendinvoice = false;
                                                                                showyes = false;
                                                                                noshowyes = true;
                                                                              });
                                                                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                              String token = prefs.getString('user.api_token');

                                                                              String url ='https://mijnzpc.com/api/v1/addinvoicenumber?token='+token+'&times_id='+widget.timesid.toString()+'&invoicenumber='+_emailValue;
                                                                              final response = await http.get(Uri.parse(url),);
                                                                              var responseBody = json.decode(response.body);
                                                                              print(responseBody);

                                                                              if(responseBody['code']==1)
                                                                              {

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
                                                                                                    Navigator.push(
                                                                                                      context,
                                                                                                      MaterialPageRoute(builder: (context) => HomecartInvoice(
                                                                                                        backgroundcolor:widget.backgroundcolor,
                                                                                                        color : widget.color,
                                                                                                        gradiantcolor:widget.gradiantcolor,
                                                                                                        cardcolor:widget.cardcolor,
                                                                                                        shadowcolor:widget.shadowcolor,
                                                                                                        appbarcolor:widget.appbarcolor,
                                                                                                        titlecolor:widget.titlecolor,
                                                                                                        textcolor:widget.textcolor,
                                                                                                        bottombarcolor:widget.bottombarcolor,
                                                                                                      )),
                                                                                                    );
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
                                                                                setState(() {
                                                                                  sendinvoice=true;
                                                                                  showyes=true;
                                                                                  noshowyes=false;
                                                                                });
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
                                                                                                    Navigator.of(context).pop(false);
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

                                                                            }):new Container(),
                                                                    ),

                                                                  ]),),
                                                                      ],

                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            });







                                                      },
                                                      child: Padding(
                                                        padding:EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                        ),
                                                        child:Center(
                                                          child: Text(allTranslations.text('Send invoice') ,textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
                                                        ),
                                                      )
                                                  )
                                              )

                                          ):new Container(),






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


  checksendinvoice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('user.api_token');
    String type = prefs.getString('user.type');

        if (type=="EMPLOYEE")
        {
          setState(() {
            sendinvoice=true;
          });
        }
        else
          {
            setState(() {
              sendinvoice=false;
            });
          }


  }




}


// class MyDialog extends StatefulWidget {
//   @override
//   _MyDialogState createState() => new _MyDialogState();
// }

// class _MyDialogState extends State<MyDialog> {
//   Color _c = Colors.redAccent;
//   bool showyes=true;
//   bool noshowyes=false;
//
//
//
//   @override
//
// }