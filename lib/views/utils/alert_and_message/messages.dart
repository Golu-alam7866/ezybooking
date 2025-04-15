import 'package:flutter/material.dart';

class Messages{
  static  successScaffoldMessenger(BuildContext context,String message){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,));
  }
  static errorScaffoldMessenger(BuildContext context,String message){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: TextStyle(color: Colors.white)),backgroundColor: Colors.red,));
  }
}