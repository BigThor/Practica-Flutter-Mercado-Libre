import 'package:flutter/material.dart';

Widget RT_EnvioGratis_Full(){
  return RichText(
    text: TextSpan(
      style: TextStyle(color: Colors.green[600]),
      children: [
        TextSpan(text: 'Envío gratis '),
        WidgetSpan(
          child: Icon(
            Icons.electric_rickshaw_rounded,
            size: 17.0,
            color: Colors.green[600],
          ),
        ),
        TextSpan(
          text: ' FULL',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic
          )
        ),
      ],
    ),
  );
}
