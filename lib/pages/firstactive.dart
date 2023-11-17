import 'package:flutter/material.dart';
import 'package:mijnzpc/pages/login_screen.dart';
import 'package:mijnzpc/pages/splash_screen.dart';
import 'package:mijnzpc/all_translations.dart';
class Firstactive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff525C66),
        title: Center(
          child: Text(allTranslations.text('Registration Successfull!')),),
        automaticallyImplyLeading: false,),
      body:
      Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:50),
              child:
              Center(
                child: Text(
                  allTranslations.text('Your account has been created succesfully.'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.blue.withOpacity(0.04);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.blue.withOpacity(0.12);
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginScreen()));
                },
                child: Text(allTranslations.text('Back to login'))
            )
          ]
      ),
    );
  }

}