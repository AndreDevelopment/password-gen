import 'package:flutter/material.dart';
import 'package:password_gen/button.dart';
import 'package:password_gen/models/password_model.dart';
import 'package:password_gen/password_card.dart';
import 'package:password_gen/utils/file_manager.dart';
import 'package:password_gen/utils/generator.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> with WidgetsBindingObserver {
  List<PasswordModel> _passwords = [];

  void _generateNewPassForIndex(int index) {
    setState(() {
      if (index >= 0 && index < _passwords.length) {
        _passwords[index].password = generateStrongPassword();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _passwords = FileManager.readPasswordsToFile() as List<PasswordModel>;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // App is visible and active
        print('App resumed');
        break;
      case AppLifecycleState.inactive:
        // App is in an inactive state and not receiving user input.
        // This might happen briefly before pausing or being killed.
        print('App inactive');
        FileManager.writePasswordsToFile(_passwords);
        break;
      case AppLifecycleState.paused:
        // App is not currently visible to the user, not responding
        // to user input, and running in the background.
        print('App paused');
        // This is a good place to save critical data or pause resources.
        break;
      case AppLifecycleState.detached:
        // The application is still hosted on a flutter engine but is
        // detached from any host views. This is called before the
        // application is completely shut down.
        FileManager.writePasswordsToFile(_passwords);
        print('App detached');
        // Perform final cleanup here.
        break;
      case AppLifecycleState.hidden: // iOS-only, similar to paused
        print('App hidden');
        FileManager.writePasswordsToFile(_passwords);
        break;
    }
  }

  addNewPassword(name) {
    setState(() {
      _passwords.add(PasswordModel(name: name, password: generateStrongPassword(), backgroundColor: '0xffeb9b34'));
    });

  }

  deletePassword(index) {
    setState(() {
      _passwords.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Button(
              onPressed: addNewPassword('New name'),
              text: "Add New",
              color: Color.fromARGB(0, 43, 243, 3),
            ),

          ],
        ),
        ListView.builder(
          itemCount: _passwords.length,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            return PasswordCard(
              password: _passwords[index],
              onGenerate: () => _generateNewPassForIndex(index),
              onDelete: () => deletePassword(index),
            );
          },
        ),
      ],
    );
  }
}
