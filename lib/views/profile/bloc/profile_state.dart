// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadedSuccess extends ProfileState {
  final UserModel user;
  LoadedSuccess({
    required this.user,
  });
}

class LoadedFailure extends ProfileState {
  final String message;
  LoadedFailure({
    required this.message,
  });
}

class LoadingData extends ProfileState {}
