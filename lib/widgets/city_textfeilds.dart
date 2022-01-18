
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BCTextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  BCTextFieldWidget({this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          style: TextStyle(
            height: 1,
            color: Colors.black87,
            //ContainerText,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
              labelText: title,
              labelStyle: TextStyle(
                color: Colors.black87,
                fontSize: 19,
              ),
              //border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color:Colors.grey,
                  width: 1.0,
                ),
              ))),
    );
  }

}
