import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/core/common/common.dart';
import 'package:permium_parts/core/constances/api_const.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc get(context) => BlocProvider.of(context);
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>(_signin);
    on<SignUpEvent>(_signup);
  }

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirm = TextEditingController();
  final Dio dio = Dio();

  FutureOr<void> _signup(event, emit) async {
    emit(LoadingState());
    try {
      final response =
          await dio.post(ApiConst.baseUrl + ApiConst.signupPath, data: {
        'name': name.text,
        'email': email.text,
        'password': password.text,
        'password_confirmation': passwordConfirm.text,
      });

      if (response.statusCode == 201) {
        emit(SuccessState());
      } else {
        emit(FailureState(message: response.data.toString()));
      }
    } on DioError catch (dioErr) {
      emit(FailureState(message: dioErr.message ?? 'dio error'));
    } catch (err) {
      emit(err.toString());
    }
  }

  FutureOr<void> _signin(event, emit) async {
    emit(LoadingState());
    try {
      final response = await dio.post(
        ApiConst.baseUrl + ApiConst.signinPath,
        data: {
          'email': email.text,
          'password': password.text,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        String token = (response.data as Map<String, dynamic>)['data']['token'];
        Common.prefs.setString('token', token);
        emit(SuccessState());
      } else {
        emit(FailureState(message: response.data.toString()));
      }
    } on DioError catch (dioErr) {
      emit(FailureState(message: dioErr.message ?? 'dio error'));
    } catch (err) {
      emit(err.toString());
    }
  }
}
