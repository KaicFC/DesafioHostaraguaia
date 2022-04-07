import 'package:desafio_hostaraguaia/src/presentation/modules/home/home_page.dart';
import 'package:desafio_hostaraguaia/src/shared/navigation/navigation_handler.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationHandler.appGlobalKey,
      onGenerateRoute: NavigationHandler.appRoute,
    );
  }
}
