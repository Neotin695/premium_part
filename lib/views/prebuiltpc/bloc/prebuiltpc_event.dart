// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'prebuiltpc_bloc.dart';

enum PcType { highEndPc, budgetPc }

@immutable
abstract class PrebuiltpcEvent {}

class LoadAllPcs extends PrebuiltpcEvent {
  final PcType pcType;
  LoadAllPcs({
    required this.pcType,
  });
}
