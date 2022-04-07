import 'package:desafio_hostaraguaia/src/app.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupInjection();
  runApp(const MyApp());
}
