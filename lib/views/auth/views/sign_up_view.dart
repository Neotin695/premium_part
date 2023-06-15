import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/views/auth/bloc/auth_bloc.dart';
import 'package:permium_parts/views/auth/pages/sign_in_page.dart';
import 'package:sizer/sizer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = AuthBloc.get(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, SignInPage.routeName);
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: 'Account crated successfylly, please sign in',
          );
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 50.w,
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                child: TextFormField(
                  controller: bloc.name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: const Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                child: TextFormField(
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                child: TextFormField(
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                child: TextFormField(
                  controller: bloc.passwordConfirm,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password Confirm",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              MaterialButton(
                minWidth: 80.w,
                height: 6.5.h,
                color: Colors.blue[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  bloc.add(SignUpEvent());
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
