import 'package:flutter/material.dart';
import 'package:permium_parts/core/common/common.dart';
import 'package:permium_parts/core/services/route_generator.dart';
import 'package:permium_parts/permium_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Common.prefs = await SharedPreferences.getInstance();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return PermiumApp(RouteGenerator());
      },
    ),
  );
}
