import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permium_parts/core/constances/api_const.dart';
import 'package:permium_parts/models/pc_model.dart';

part 'prebuiltpc_event.dart';
part 'prebuiltpc_state.dart';

class PrebuiltpcBloc extends Bloc<PrebuiltpcEvent, PrebuiltpcState> {
  static PrebuiltpcBloc get(context) => BlocProvider.of(context);
  PrebuiltpcBloc() : super(PrebuiltpcInitial()) {
    on<LoadAllPcs>(_loadAllPcs);
  }
  final Dio dio = Dio();
  FutureOr<void> _loadAllPcs(event, emit) async {
    emit(PcLoading());

    if (event is LoadAllPcs) {
      try {
        final response = await dio.get(
            '${ApiConst.baseUrl}${ApiConst.specialPcPath}/${event.pcType.name}');

        if (response.statusCode == 200) {
          final List<PcModel> pcs = List.from(
              (response.data as Map<String, dynamic>)['pcs']
                  .map((e) => PcModel.fromMap(e)));
          emit(PcLoaded(pcs: pcs));
        }
      } on DioError catch (dioErr) {
        emit(PcLoadFailure(message: dioErr.message ?? 'Dio Error'));
      } catch (err) {
        emit(PcLoadFailure(message: err.toString()));
      }
    }
  }
}
