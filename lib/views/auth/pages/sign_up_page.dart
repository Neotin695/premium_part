import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../views/sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = '/signup';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0.0,
        leading: IconButton(
          color: Colors.blue[900],
          onPressed: () {
            // Navigator.pushNamed(context, LoginScreen.screenRoute);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => AuthBloc(),
        child: const SignUpView(),
      ),
    );
  }
}
