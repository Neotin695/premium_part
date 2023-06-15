part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  
}

class SignUpEvent extends AuthEvent{}
class SignInEvent extends AuthEvent{}



