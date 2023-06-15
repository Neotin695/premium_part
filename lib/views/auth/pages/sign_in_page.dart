import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/auth/bloc/auth_bloc.dart';

import '../views/sign_in_view.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = '/signin';
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => AuthBloc(),
        child: const SignInView(),
      ),
    );
  }
}
