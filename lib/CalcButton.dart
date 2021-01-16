import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  CalcButton(
      {Key key,
      this.text,
      this.fillColor,
      this.textColor = 0xFFFFFFFF,
      this.textSize = 28, this.callback
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Varela",
              fontSize: textSize,
            ),
          ),
          onPressed: (){callback(text);},
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
