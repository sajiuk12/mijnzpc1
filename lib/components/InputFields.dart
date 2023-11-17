//@dart=2.9
import 'package:flutter/material.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final validator;
  final onSaved;

  InputFieldArea({this.hint , this.obscure , this.icon , this.validator , this.onSaved});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: new TextFormField(
        validator: validator,
        onSaved: onSaved,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.black
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            icon ,
            color: Colors.black,
          ),
          enabledBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.black
              )
          ),
          focusedBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Colors.black
              )
          ),
          errorStyle: new TextStyle(color : Color(0xffD7092B)),
          errorBorder: new UnderlineInputBorder(
            borderSide: new BorderSide(
              color: Color(0xffD7092B)
            )
          ),
          focusedErrorBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(
                  color: Color(0xffD7092B)
              )
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black , fontSize: 15),
          contentPadding: const EdgeInsets.only(
            top: 15 , right: 0 , bottom: 20 , left: 5
          )
        ),
      ),
    );
  }

}