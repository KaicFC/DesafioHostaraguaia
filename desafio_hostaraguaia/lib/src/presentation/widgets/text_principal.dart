import 'package:desafio_hostaraguaia/src/shared/constants/constants.dart';
import 'package:desafio_hostaraguaia/src/shared/constants/strings.dart';
import 'package:flutter/material.dart';

class TextPrincipal extends StatelessWidget {
  final String text;
  const TextPrincipal({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      toTitleText(text),
      style: Constants.fontOpenSans(Constants.textStyle1),
    );
  }
}
