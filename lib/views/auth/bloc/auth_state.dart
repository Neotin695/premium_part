part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class SuccessState extends AuthState {}

class FailureState extends AuthState {
  final String message;
  FailureState({required this.message});
}
