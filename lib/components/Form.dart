import 'package:flutter/material.dart';
import 'package:mijnzpc/components/InputFields.dart';
import 'package:validators/validators.dart';

class FormContainer extends StatelessWidget {
  final formKey;
  final emailOnSaved;
  final passwordOnSaved;

  FormContainer({@required this.formKey, this.emailOnSaved , this.passwordOnSaved });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: new Column(
        children: <Widget>[
          new Form(
            key : formKey,
            child: new Column(
              children: <Widget>[
                new InputFieldArea(
                  hint: "Email",
                  obscure: false,
                  icon : Icons.email_outlined,
                  validator: (String value) {
                    // if(! isEmail(value)) {
                    //   return 'Its Not Valid';
                    // }
                  },
                  onSaved : emailOnSaved
                ),
                new InputFieldArea(

                  hint: "Password",

                  obscure: true,
                  icon: Icons.lock_open,
                  validator: (String value) {
                    if(value.length < 5) {
                      return 'Must Be More Than 6 Char';
                    }
                  },
                  onSaved : passwordOnSaved
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}