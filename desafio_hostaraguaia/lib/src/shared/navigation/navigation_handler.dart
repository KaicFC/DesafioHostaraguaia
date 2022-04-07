import 'package:desafio_hostaraguaia/src/presentation/modules/details/details_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/home/home_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/search/search_page.dart';
import 'package:desafio_hostaraguaia/src/shared/navigation/nav_fade.dart';
import 'package:flutter/material.dart';

class NavigationHandler {
  static GlobalKey<NavigatorState> appGlobalKey = GlobalKey();

  static Route<dynamic> appRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomePage.route:
        return NavFade(page: const HomePage(), settings: settings);

      case SearchPage.route:
        if (args is String) {
          return NavFade(page: SearchPage(query: args), settings: settings);
        }
        return NavFade(page: const HomePage(), settings: settings);

      case DetailsPage.route:
        if (args is String) {
          return NavFade(page: DetailsPage(name: args), settings: settings);
        }
        return NavFade(page: const HomePage(), settings: settings);

      default:
        return NavFade(page: const HomePage(), settings: settings);
    }
  }

  static Future<T?> push<T extends Object?>(String route,
      {Object? arguments}) async {
    return Navigator.pushNamed(
      appGlobalKey.currentContext!,
      route,
      arguments: arguments,
    );
  }

  static void pop<T extends Object?>([BuildContext? context, T? result]) async {
    return Navigator.pop(appGlobalKey.currentContext!, result);
  }
}
