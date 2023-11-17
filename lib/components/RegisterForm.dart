import 'package:flutter/material.dart';
import 'package:mijnzpc/components/InputFields.dart';
import 'package:validators/validators.dart';

class RegisterFormContainer extends StatelessWidget {
  final formKey;
  final emailOnSaved;
  final nameOnSaved;
  final mobileOnSaved;
  final addressOnSaved;
  final postalcodeOnSaved;
  final passwordOnSaved;
  final repasswordOnSaved;

  RegisterFormContainer({@required this.formKey, this.emailOnSaved , this.passwordOnSaved, this.nameOnSaved , this.mobileOnSaved, this.addressOnSaved, this.postalcodeOnSaved, this.repasswordOnSaved });

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
                    hint: "Name",
                    obscure: false,
                    icon : Icons.person_outline,
                    validator: (String value) {
                      if(value.length < 4) {
                        return 'must be more than 4 char';
                      }
                    },
                    onSaved : nameOnSaved
                ),
                new InputFieldArea(
                    hint: "Email",
                    obscure: false,
                    icon : Icons.email,
                    validator: (String value) {
                      if(value.length < 4) {
                        return 'must be more than 4 char';
                      }
                    },
                    onSaved : emailOnSaved
                ),
                new InputFieldArea(
                    hint: "Mobile",
                    obscure: false,
                    icon : Icons.mobile_friendly,
                    validator: (String value) {
                      if(value.length < 5) {
                        return 'must be more than 6 char';
                      }
                    },
                    onSaved : mobileOnSaved
                ),
                new InputFieldArea(
                    hint: "Address",
                    obscure: false,
                    icon : Icons.note_add_outlined,
                    validator: (String value) {
                      if(value.length < 5) {
                        return 'must be more than 6 char';
                      }
                    },
                    onSaved : addressOnSaved
                ),
                new InputFieldArea(
                    hint: "PostalCode",
                    obscure: false,
                    icon : Icons.post_add_rounded,
                    validator: (String value) {
                      if(value.length < 5) {
                        return 'must be more than 6 char';
                      }
                    },
                    onSaved : postalcodeOnSaved
                ),
                new InputFieldArea(
                    hint: "Password",
                    obscure: true,
                    icon: Icons.lock_open,
                    validator: (String value) {
                      if(value.length < 5) {
                        return 'must be more than 6 char';
                      }
                    },
                    onSaved : passwordOnSaved
                ),
                new InputFieldArea(
                    hint: "Re-Password",
                    obscure: true,
                    icon: Icons.lock_open,
                    validator: (String value) {
                      if(value.length < 5) {
                        return 'must be more than 6 char';
                      }
                    },
                    onSaved : repasswordOnSaved
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}