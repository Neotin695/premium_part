import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/home/pages/home_page.dart';
import 'package:permium_parts/views/profile/pages/profile_page.dart';
import 'package:permium_parts/views/systembuilder/pages/selected_part_page.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc() : super(HomeInitial()) {
    on<ChangeIndex>(_changeIndex);
  }

  final TextEditingController search = TextEditingController();
  int index = 0;

  List<Widget> pages = [
    const HomePage(),
    const SelectedPartPage(),
    const ProfilePage(),
  ];

  FutureOr<void> _changeIndex(event, emit) {
    if (event is ChangeIndex) {
      index = event.index;
    }
  }
}
