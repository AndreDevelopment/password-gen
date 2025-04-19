import 'package:flutter/material.dart';
import 'package:password_gen/button.dart';
import 'package:password_gen/models/password_model.dart';

class PasswordCard extends StatefulWidget {
  const PasswordCard({
    super.key,
    required this.password,
    required this.onGenerate,
    required this.onDelete,
  });

  final PasswordModel password;
  final VoidCallback onGenerate;
  final VoidCallback onDelete;
  @override
  State<PasswordCard> createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {
  bool _isVisible = false;

  void _toggleVisibility() {
    print('Showing pass');
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: Color(int.parse(widget.password.backgroundColor)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.password.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              _isVisible ? widget.password.password : "••••••••",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: _toggleVisibility,
                  icon: Icon(Icons.visibility_outlined),
                  label: Text(_isVisible ? "Hide" : "Show"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
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
                    // Implement your generate new password logic
                    widget.onGenerate();
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
                const SizedBox(width: 8.0),
                Button(
                  onPressed: () {
                    widget.onDelete();
                  },
                  text: "Delete Password",
                  color: Color.fromARGB(0, 243, 3, 3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
