import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/home/bloc/home_bloc.dart';
import 'package:permium_parts/views/home/views/home_layout_view.dart';

class HomeLayoutPage extends StatelessWidget {
  static const String routeName = '/homelayout';
  const HomeLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeLayoutView(),
    );
  }
}
