import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/profile/view/profile_view.dart';

import '../bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  static const String screenRoute = 'UserScreen';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileBloc(),
        child: const ProfileView(),
      )
    );
  }
}
