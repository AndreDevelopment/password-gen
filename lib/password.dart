import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_gen/models/password_model.dart';
import 'package:password_gen/password_card.dart';

class Password extends StatefulWidget {
  const Password({super.key});

    
  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  List<PasswordModel> passwords = [];
  
  Future<void> _loadPasswords() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      passwords = data.map((json) => PasswordModel.fromJson(json)).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    _loadPasswords();
    return ListView.builder(
      itemCount: passwords.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        final password = passwords[index];
        return PasswordCard(password: password);
      },
    );
  }
}
