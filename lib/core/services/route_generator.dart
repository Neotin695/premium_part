import 'package:flutter/material.dart';
import 'package:permium_parts/core/services/decisions_tree.dart';
import 'package:permium_parts/views/auth/pages/sign_in_page.dart';
import 'package:permium_parts/views/auth/pages/sign_up_page.dart';
import 'package:permium_parts/views/home/pages/home_layout_page.dart';
import 'package:permium_parts/views/home/pages/home_page.dart';
import 'package:permium_parts/views/prebuiltpc/pages/budget_pc_page.dart';
import 'package:permium_parts/views/prebuiltpc/pages/high_end_pc_page.dart';
import 'package:permium_parts/views/systembuilder/pages/all_parts_page.dart';
import 'package:permium_parts/views/systembuilder/pages/details_part_page.dart';

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DecisionsTree.routeName:
        return _pageRoute(const DecisionsTree());
      case SignInPage.routeName:
        return _pageRoute(const SignInPage());
      case SignUpPage.routeName:
        return _pageRoute(const SignUpPage());
      case AllPartsPage.routeName:
        final args = settings.arguments;
        return _pageRoute(const AllPartsPage(), args);
      case DetailsPartPage.routeName:
        final args = settings.arguments;
        return _pageRoute(const DetailsPartPage(), args);
      case HomeLayoutPage.routeName:
        return _pageRoute(const HomeLayoutPage());
      case HomePage.routeName:
        return _pageRoute(const HomePage());
      case HighEndPcPage.routeName:
        return _pageRoute(const HighEndPcPage());
      case BudgetPcPage.routeName:
        return _pageRoute(const BudgetPcPage());
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error Screen'),
        ),
        body: const Center(
          child: Text(
              'somthing went wrong! please send a screenshot and send to support'),
        ),
      );
    });
  }

  MaterialPageRoute _pageRoute(page, [arg]) {
    return MaterialPageRoute(
        builder: (context) => page, settings: RouteSettings(arguments: arg));
  }
}
