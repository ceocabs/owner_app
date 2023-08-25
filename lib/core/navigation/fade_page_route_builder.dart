import 'package:flutter/material.dart';

class FadePageRouteBuilder extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;

  FadePageRouteBuilder({required this.page, required this.settings})
      : super(
          opaque: false,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          settings: settings,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 200),
        );
}
