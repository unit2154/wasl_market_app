import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> _stack = [];

  List<Route<dynamic>> get stack => List.unmodifiable(_stack);

  Route<dynamic>? get currentRoute =>
      _stack.isNotEmpty ? _stack.last : null;

  List<String?> get routeNames =>
      _stack.map((r) => r.settings.name).toList();

  @override
  void didPush(Route route, Route? previousRoute) {
    _stack.add(route);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _stack.remove(route);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _stack.remove(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute != null) _stack.remove(oldRoute);
    if (newRoute != null) _stack.add(newRoute);
  }
}


final MyNavigatorObserver navigatorObserver = MyNavigatorObserver();