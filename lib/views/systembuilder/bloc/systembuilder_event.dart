// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'systembuilder_bloc.dart';

enum Components {
  cpus,
  gpus,
  motherboards,
  memories,
  powersupplies,
  cases,
  storages,
  coolers
}

@immutable
abstract class SystembuilderEvent {}

class LoadAllParts extends SystembuilderEvent {
  final Components components;
  LoadAllParts({
    required this.components,
  });
}

class HandleViewEvent extends SystembuilderEvent {
  final Object model;
  HandleViewEvent({
    required this.model,
  });
}

class VoiceSearchEvent extends SystembuilderEvent{
  final String path;

  VoiceSearchEvent(this.path);
}

class LoadSelectedParts extends SystembuilderEvent {}

class AddComponent extends SystembuilderEvent {
  final String slug;
  final Components components;
  AddComponent(
    this.components, {
    required this.slug,
  });
}
