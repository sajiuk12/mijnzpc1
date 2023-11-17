//@dart=2.9
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/my_home_page.dart';
import 'package:mijnzpc/pages/homeadmin.dart';
import 'package:mijnzpc/pages/login_screen.dart';

// import 'package:connectivity/connectivity.dart';
import 'package:mijnzpc/services/auth_services.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen(
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
  State<StatefulWidget> createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();


    //default colors
    Color backgroundcolor = Colors.white.withOpacity(0.90);
    Color color = Color(0xff89B44B);
    Color gradiantcolor = Color(0xff313F1A);
    Color cardcolor=Colors.white;
    Color shadowcolor=Colors.black;
    Color appbarcolor=Colors.white;
    Color titlecolor=Colors.grey[700];
    Color textcolor=Colors.grey[500];
    Color bottombarcolor=Colors.white;
    //default colors







  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor:Color(0xffFFFFFF),
      body:

        Center(
      child: InteractiveViewer(
      panEnabled: true, // Set it to false
      // minScale: 0.5,
      // maxScale: 2,
      child: Image.asset(
        'assets/images/splash-min.gif',
        width: 400,
        height: 400,
        fit: BoxFit.cover,
      ),
    ),
    ) ,



    );
  }

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString('user.api_token');
    String usercolor = prefs.getString('user.color');
    String darkmde = prefs.getString('user.darkmode');
    int is_activated = prefs.getInt('user.is_activated');


  if(usercolor=='1')
  {
    setState((){

        color = Color(0xff89B44B);
        gradiantcolor = Color(0xff313F1A);
        appbarcolor=Color(0xff89B44B);
    });
  }
  else
  if(usercolor=='2')
    {
      setState((){
        backgroundcolor = Color(0xffFF6B22);
        color = Color(0xffFF6B22);
        gradiantcolor = Color(0xff59240B);
      });
    }
  else
  if(usercolor=='3')
  {
    setState((){
      backgroundcolor = Color(0xff5E95BC);
      color = Color(0xff5E95BC);
      gradiantcolor = Color(0xff263E4C);
    });
  }
  else
  if(usercolor=='4')
  {
    setState((){
      backgroundcolor = Color(0xffF2C500);
      color = Color(0xffF2C500);
      gradiantcolor = Color(0xff554607);
    });
  }
  else
  if(usercolor=='5')
  {
    setState((){
      backgroundcolor = Color(0xff798BF2);
      color = Color(0xff798BF2);
      gradiantcolor = Color(0xff262C4C);
    });
  }
  else
  if(usercolor=='6')
  {
    setState((){
      backgroundcolor = Color(0xffDA4040);
      color = Color(0xffDA4040);
      gradiantcolor = Color(0xff4C1617);
    });
  }
  else
  if(usercolor=='7')
  {
    setState((){
      backgroundcolor = Color(0xff9E956E);
      color = Color(0xff9E956E);
      gradiantcolor = Color(0xff3F3B2C);
    });
  }
  else
  if(usercolor=='8')
  {
    setState((){
      backgroundcolor = Color(0xff606060);
      color = Color(0xff606060);
      gradiantcolor = Color(0xff000000);
    });
  }
  else
  if(usercolor=='9')
  {
    setState((){
      backgroundcolor = Color(0xff006AA5);
      color = Color(0xff006AA5);
      gradiantcolor = Color(0xff001C2B);
    });
  }
  else
  if(usercolor=='10')
  {
    setState((){
      backgroundcolor = Color(0xffE271A2);
      color = Color(0xffE271A2);
      gradiantcolor = Color(0xff4C2637);
    });
  }
  else
  if(usercolor=='11')
  {
    setState((){
      backgroundcolor = Color(0xff63C7C7);
      color = Color(0xff63C7C7);
      gradiantcolor = Color(0xff264C4C);
    });
  }
  else
  if(usercolor=='12')
  {
    setState((){
      backgroundcolor = Color(0xffC0C0C0);
      color = Color(0xffC0C0C0);
      gradiantcolor = Color(0xff4C4C4C);
    });
  }

    // print('dddddddddddddd');
    // print(darkmde);
    // print('ssssssssssss');
  if(darkmde=='0')
  {
      backgroundcolor = Color(0xffF4F4F4);
      cardcolor=Colors.white;
      shadowcolor=Colors.black;
      titlecolor=Colors.grey[700];
      textcolor=Colors.grey[500];
      bottombarcolor=Colors.white;
  }
  else
  {
      backgroundcolor = Color(0xff1a1d21);
      cardcolor=Color(0xff212529);
      shadowcolor=Colors.black;
      titlecolor=Colors.grey[700];
      textcolor=Colors.grey[500];
      bottombarcolor=Color(0xff1a1d21);
  }





    if(apiToken == null)
    {
      navigationToLogin();
    }
    else
      {

        final response = await http.get(Uri.parse('https://mijnzpc.com/api/v1/checkuser?token=' + apiToken));

        var responseBody = json.decode(response.body)['data'];
        print(responseBody['email']);

        if(responseBody['email'] == '0')
        {
          print('email not active');
          navigationToemail();
        }



        if(responseBody['code'] == -1)
        {
          print('user not login');
          navigationToLogin();
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
            print('user is seccoundactive');
            navigationToHome();
          }

      }


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
  navigationToVerify() {
    Navigator.of(context).pushReplacementNamed('/verify');
  }
  navigationToHome() {
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePages(
          backgroundcolor: backgroundcolor,
          color: color,
          gradiantcolor:gradiantcolor,
          cardcolor:cardcolor,
          shadowcolor:shadowcolor,
          appbarcolor:appbarcolor,
          titlecolor:titlecolor,
          textcolor:textcolor,
          bottombarcolor:bottombarcolor
      )));

     // Navigator.of(context).pushReplacementNamed('/home');
    });
  }


}