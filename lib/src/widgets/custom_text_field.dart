import 'package:flutter/material.dart';

Widget customTextField(String title, {bool enabled, String helperText, TextInputType keyboardType, String hintText}){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    child: TextField(
      enabled: enabled,
      cursorHeight: 30.0,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        helperText: helperText,
        helperMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent)
        ),
      ),
    ),
  );
}