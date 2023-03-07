import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Color c;
  final Function selecthandler;

  Button(this.buttonText, this.c, this.selecthandler);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: c,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.normal),
            ),
            onPressed: () => selecthandler(buttonText),
          ),
        ),
      ),
    );
  }
}
