import 'dart:io';
import 'dart:convert';
import 'package:password_gen/models/password_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class FileManager {
  static final FileManager _instance = FileManager._internal();

  factory FileManager() {
    return _instance;
  }

  FileManager._internal();

  static Future<File> _getLocalFile() async {
    if (kIsWeb) {
      // Use web storage APIs here
      return File(''); // Or implement web-specific logic
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return File('${directory.path}/passwords.json');
    }
  }

  static Future<void> writePasswordsToFile(passwords) async {
    try {
      final file = await _getLocalFile();
      final String data = json.encode(
        passwords.map((pass) => pass.toJson()).toList(),
      );
      print(data);
      await file.writeAsString(data);
      print('Dogs data saved to: ${file.path}');
      // Optionally provide feedback to the user
    } catch (e) {
      print('Error saving dogs to file: $e');
      // Handle error appropriately
    }
  }

  static Future<void> readPasswordsToFile() async {
    File file = await _getLocalFile();
    String fileContent;
    var passwords;
    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
        final List<dynamic> data = json.decode(fileContent);
        passwords = data.map((json) => PasswordModel.fromJson(json)).toList();
      } catch (e) {
        print(e);
      }
    }

    return passwords;
  }
}
