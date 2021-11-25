import 'package:flutter/material.dart';

class AppRoutes {
  static void push(BuildContext context, Widget page) {
    print('Navigation push to $page');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void replace(BuildContext context, Widget page) {
    print('Navigation replace to $page');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void makeFirst(BuildContext context, Widget page) {
    print('Navigation makeFirst to $page');
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static void setFirst(BuildContext context, String route) {
    print('Navigation setFirst to $route');
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacementNamed(context, route);
  }

  static void pop(BuildContext context) {
    print('Navigation pop');
    Navigator.pop(context);
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }
}
