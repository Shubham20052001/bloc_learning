import 'package:bloc_1/presentation/screens/home_screen.dart';
import 'package:bloc_1/presentation/screens/second_screen.dart';
import 'package:bloc_1/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerated(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'Home Page',
                  color: Colors.blueAccent,
                ));
        break;
      case "/second":
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: 'Second Screen',
                  color: Colors.redAccent,
                ));
        break;
      case "/third":
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.greenAccent,
                ));
        break;
      default:
        return null;
    }
  }
}
