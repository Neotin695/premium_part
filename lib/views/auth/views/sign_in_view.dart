import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/core/services/decisions_tree.dart';
import 'package:permium_parts/views/auth/bloc/auth_bloc.dart';
import 'package:permium_parts/views/auth/pages/sign_up_page.dart';
import 'package:sizer/sizer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AuthBloc.get(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, DecisionsTree.routeName);
        } else if (state is LoadingState) {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.loading,
              text: 'Please wait');
        } else if (state is FailureState) {
          Navigator.pop(context);
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: state.message,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 40.w,
                  height: 30.h,
                ),
                TextFormField(
                  controller: bloc.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                  controller: bloc.password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 12.sp,
                          color: const Color.fromARGB(255, 19, 0, 190),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                MaterialButton(
                  minWidth: 70.w,
                  height: 7.h,
                  color: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    bloc.add(SignInEvent());
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't you have an account?",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpPage.routeName);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
