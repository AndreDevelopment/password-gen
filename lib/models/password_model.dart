import 'dart:ui';
import 'package:flutter/material.dart';

class PasswordModel {

  String password;
  String name;
  Color backgroundColor =Color(0xffff5733);

  PasswordModel({
    required this.name,
    required this.password,
    required this.backgroundColor

  });

  static List<PasswordModel>getAllPasswords(){
    List<PasswordModel> passwords = [
      PasswordModel(name: "Gmail", password: "password", backgroundColor: Color(0xff88fc03)),
      PasswordModel(name: "Amazon", password: "password", backgroundColor: Color.fromARGB(255, 181, 3, 252)),
      PasswordModel(name: "Nintendo", password: "password", backgroundColor: Color.fromARGB(255, 3, 82, 252)),
    ];


    return passwords;
  }
  
}