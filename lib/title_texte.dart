import 'package:flutter/material.dart';

class TitleText extends Text {
  final String texte;

  const TitleText({Key? key, required this.texte})
      : super(
            key: key,
            texte,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold));
}
