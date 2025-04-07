import 'package:flutter/material.dart';
import 'package:password_gen/models/password_model.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  List<PasswordModel> passwords = [];

  void _getPasswords() {
    passwords = PasswordModel.getAllPasswords();
  }

  @override
  Widget build(BuildContext context) {
    _getPasswords();
    return ListView.builder(
      itemCount: passwords.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        final password = passwords[index];
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: password.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  password.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  password.password,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16.0), 
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, 
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                  
                        print('Show password for ${password.name}');
                      },
                      icon: const Icon(Icons.visibility_outlined),
                      label: const Text("Show"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            Theme.of(
                              context,
                            ).primaryColor, 
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ), // Style the border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    OutlinedButton.icon(
                      onPressed: () {
                        print('Edit password for ${password.name}');
                      },
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text("Edit"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey[700],
                        side: BorderSide(color: Colors.grey[400]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Implement your generate new password logic
                        print('Generate new password for ${password.name}');
                      },
                      icon: const Icon(Icons.refresh_outlined),
                      label: const Text("Generate New"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green[600],
                        side: BorderSide(color: Colors.green[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
