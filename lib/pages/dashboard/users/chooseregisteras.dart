//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mijnzpc/all_translations.dart';
import 'package:mijnzpc/animations/register_animation.dart';
import 'package:mijnzpc/components/RegisterForm.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mijnzpc/pages/forms/chooseregisteras.dart';
import 'package:mijnzpc/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mijnzpc/pages/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mijnzpc/translations.dart';
class Choosregisteras extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EmployeeState();
  Choosregisteras(
      {@required this.registeras1,this.registeras2});

  String  registeras1="";
  String  registeras2="";

}

class EmployeeState extends State<Choosregisteras> with SingleTickerProviderStateMixin {
  AnimationController _loginButtonController;

  bool _isChecked = true;
  String _currText = '';


  bool registeras1 = false;
  bool registeras2 = false;


  @override
  void initState() {


    // TODO: implement initState
    super.initState();
    _loginButtonController = new AnimationController(vsync: this , duration: new Duration(milliseconds: 3000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text("Get check Value Example")),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(_currText,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Expanded(
              child: Container(
                height: 350.0,
                child: Column(
                  children:
    <Widget>
    [
      CheckboxListTile(
        title: Text(allTranslations.text("healthcare")),
        value: this.registeras1,
        onChanged: (newValue) {
          setState(() {
            print(newValue);
             registeras1 = newValue;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
      )

    ]

                ),
              )),
        ],
      ),
    );
  }












}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }
}