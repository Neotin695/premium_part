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

class LoadingState extends SystembuilderState {}

class AddedSuccessfully extends SystembuilderState {}

class LoadedSelectedFailure extends SystembuilderState {
  final String message;
  LoadedSelectedFailure({
    required this.message,
  });
}

class LoadedSelectedPart extends SystembuilderState {
  final SelectedPartModel selectedPartModel;
  LoadedSelectedPart({
    required this.selectedPartModel,
  });
}

class AddedFailure extends SystembuilderState {
  final String message;
  AddedFailure({
    required this.message,
  });
}

class LoadViewState extends SystembuilderState {
  final Widget view;
  LoadViewState({
    required this.view,
  });
}
