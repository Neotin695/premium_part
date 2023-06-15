// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'prebuiltpc_bloc.dart';

@immutable
abstract class PrebuiltpcState {}

class PrebuiltpcInitial extends PrebuiltpcState {}

class PcLoaded extends PrebuiltpcState {
  final List<PcModel> pcs;
  PcLoaded({
    required this.pcs,
  });
}

class PcLoadFailure extends PrebuiltpcState {
  final String message;
  PcLoadFailure({
    required this.message,
  });
}

class PcLoading extends PrebuiltpcState {}
