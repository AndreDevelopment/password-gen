import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key, this.onPressed, this.text,this.color});

  final Function? onPressed;
  final String? text;
  final Color? color ;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        widget.onPressed!;
      },
      icon: Icon(Icons.visibility_outlined),
      label: Text(widget.text!),
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        side: BorderSide(
          color: widget.color ?? Theme.of(context).primaryColor,
        ), // Style the border
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
    );
  }
}
