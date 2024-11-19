import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text;
  // ignore: non_constant_identifier_names
  Function ButtonClick;
  int index;

  Button(
      {super.key,
      required this.text,
      required this.ButtonClick,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Color(0xffE8B647)),
          onPressed: () {
            ButtonClick(index);
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
