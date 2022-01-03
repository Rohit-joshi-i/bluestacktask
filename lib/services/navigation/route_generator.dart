import 'package:bluestacktask/app/ui/homepage/homepage.dart';
import 'package:bluestacktask/services/navigation/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;//Used for passing data
    switch (settings.name) {
      case EnumRoute.homepage:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(
            builder: (context) => Container(
                  child: Text('Nothing Here'),
                ));
    }
  }
}
