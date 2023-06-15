import 'package:flutter/material.dart';
import 'package:permium_parts/core/services/decisions_tree.dart';
import 'package:permium_parts/core/services/route_generator.dart';
import 'package:permium_parts/views/auth/pages/sign_in_page.dart';

class PermiumApp extends MaterialApp {
  final RouteGenerator routeGenerator;
   PermiumApp(this.routeGenerator, {super.key})
      : super(
          home: const SignInPage(),
          initialRoute: DecisionsTree.routeName,
          onGenerateRoute: routeGenerator.generateRoute
        );
}
