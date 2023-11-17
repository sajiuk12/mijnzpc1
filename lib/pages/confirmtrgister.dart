import 'package:flutter/material.dart';
import 'package:mijnzpc/pages/login_screen.dart';
import 'package:mijnzpc/all_translations.dart';

class Confirmverify extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title:Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: new Text(allTranslations.text('Registration succesfull'),style: TextStyle(color: Colors.grey),),),
        backgroundColor: Colors.white,

      ),

      body:
      Column(
        children: <Widget>[

      Padding(
      padding: EdgeInsets.only(top:50),
        child: Center(
            child: Text(
              allTranslations.text('Your Account Has been Created Successfuly.'),
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
              child: Text(allTranslations.text('Back to Login'))
          )




        ]
      ),






    );
  }

}