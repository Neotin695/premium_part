import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/core/common/common.dart';
import 'package:permium_parts/core/services/route_generator.dart';
import 'package:permium_parts/permium_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'premium_obserive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Common.prefs = await SharedPreferences.getInstance();
  Bloc.observer = const CounterObserver();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return PermiumApp(RouteGenerator());
      },
    ),
  );
}
