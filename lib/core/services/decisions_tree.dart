import 'package:flutter/material.dart';
import 'package:permium_parts/core/common/common.dart';
import 'package:permium_parts/views/auth/pages/sign_in_page.dart';
import 'package:permium_parts/views/home/pages/home_layout_page.dart';

class DecisionsTree extends StatelessWidget {
  static const String routeName = '/decisions';
  const DecisionsTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Common.prefs.getString('token') != null
        ? Common.prefs.getString('token')!.isNotEmpty
            ? const HomeLayoutPage()
            : const SignInPage()
        : const SignInPage();
  }
}
