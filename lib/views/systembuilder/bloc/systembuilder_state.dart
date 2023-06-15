// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'systembuilder_bloc.dart';

@immutable
abstract class SystembuilderState {}

class SystembuilderInitial extends SystembuilderState {}

class PartsLoadedSuccess extends SystembuilderState {
  final List<ComponentModel> parts;
  PartsLoadedSuccess({
    required this.parts,
  });
}

class PartsLoadedFailure extends SystembuilderState {
  final String message;
  PartsLoadedFailure({required this.message});
}

class PartsLoading extends SystembuilderState {}

class LoadViewState extends SystembuilderState {
  final Widget view;
  LoadViewState({
    required this.view,
  });
}
