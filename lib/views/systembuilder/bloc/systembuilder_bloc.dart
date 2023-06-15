import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:permium_parts/core/constances/api_const.dart';
import 'package:permium_parts/models/component_model.dart';
import 'package:permium_parts/models/case_model.dart';
import 'package:permium_parts/models/cooler_model.dart';
import 'package:permium_parts/models/cpu_model.dart';
import 'package:permium_parts/models/gpu_mdoel.dart';
import 'package:permium_parts/models/memories_model.dart';
import 'package:permium_parts/models/mother_board_model.dart';
import 'package:permium_parts/models/power_supplies_model.dart';
import 'package:permium_parts/models/storage_model.dart';
import 'package:permium_parts/views/systembuilder/views/detailsviews/gpu_details_view.dart';

import '../views/detailsviews/case_details_view.dart';
import '../views/detailsviews/cooler_details_view.dart';
import '../views/detailsviews/cpu_details_view.dart';
import '../views/detailsviews/memory_details_view.dart';
import '../views/detailsviews/motherboard_details_view.dart';
import '../views/detailsviews/power_supplies_details_view.dart';
import '../views/detailsviews/storage_details_view.dart';

part 'systembuilder_event.dart';
part 'systembuilder_state.dart';

class SystembuilderBloc extends Bloc<SystembuilderEvent, SystembuilderState> {
  static SystembuilderBloc get(context) => BlocProvider.of(context);
  SystembuilderBloc() : super(SystembuilderInitial()) {
    on<LoadAllParts>(_loadAllParts);
  }
  final Dio dio = Dio();

  FutureOr<void> _loadAllParts(event, emit) async {
    if (event is LoadAllParts) {
      emit(PartsLoading());
      try {
        final response = await dio.get(
            '${ApiConst.baseUrl}${ApiConst.partSelectorPath}/${event.components.name}');

        if (response.statusCode == 200) {
          final List<ComponentModel> parts =
              _handleDataTypes(event.components, response.data);

          emit(PartsLoadedSuccess(parts: parts));
        }
      } on DioError catch (dioErr) {
        emit(PartsLoadedFailure(message: dioErr.message.toString()));
      } catch (err) {
        emit(PartsLoadedFailure(message: err.toString()));
      }
    }
  }

  List<ComponentModel> _handleDataTypes(Components component, data) {
    switch (component) {
      case Components.cpus:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => CpuModel.fromMap(e)));
      case Components.gpus:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => GpuModel.fromMap(e)));
      case Components.storages:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => StorageModel.fromMap(e)));
      case Components.memories:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => MemoriesModel.fromMap(e)));
      case Components.coolers:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => CoolerModel.fromMap(e)));
      case Components.cases:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => CaseModel.fromMap(e)));
      case Components.motherboards:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => MotherboardModel.fromMap(e)));
      case Components.powersupplies:
        return List.from(((data as Map<String, dynamic>)['parts'])
            .map((e) => PowerSuppliesModel.fromMap(e)));
      default:
        return [];
    }
  }

  ComponentModel handleDataTypes(
      Components component, ComponentModel componentModel) {
    switch (component) {
      case Components.cpus:
        return componentModel as CpuModel;
      case Components.gpus:
        return componentModel as GpuModel;
      case Components.storages:
        return componentModel as StorageModel;
      case Components.memories:
        return componentModel as MemoriesModel;
      case Components.coolers:
        return componentModel as CoolerModel;
      case Components.cases:
        return componentModel as CaseModel;
      case Components.motherboards:
        return componentModel as MotherboardModel;
      case Components.powersupplies:
        return componentModel as PowerSuppliesModel;
      default:
        return componentModel;
    }
  }

  FutureOr<void> handleView(event, emit) {
    if (event is HandleViewEvent) {
      switch (event.model) {
        case CpuModel:
          emit(
            LoadViewState(
              view: CpuDetailsView(componentModel: event.model as CpuModel),
            ),
          );
          break;
        case GpuModel:
          emit(
            LoadViewState(
              view: GpuDetailsView(componentModel: event.model as GpuModel),
            ),
          );
          break;
        case MotherboardModel:
          emit(
            LoadViewState(
              view: MotherboardDetailsView(
                  componentModel: event.model as MotherboardModel),
            ),
          );
          break;
        case MemoriesModel:
          emit(
            LoadViewState(
              view: MemoriesDetailsView(
                  componentModel: event.model as MemoriesModel),
            ),
          );
          break;
        case CoolerModel:
          emit(
            LoadViewState(
              view:
                  CoolerDetailsView(componentModel: event.model as CoolerModel),
            ),
          );
          break;
        case PowerSuppliesModel:
          emit(
            LoadViewState(
              view: PowerSuppliesDetailsView(
                  componentModel: event.model as PowerSuppliesModel),
            ),
          );
          break;
        case StorageModel:
          emit(
            LoadViewState(
              view: StorageDetailsView(
                  componentModel: event.model as StorageModel),
            ),
          );
          break;
        case CaseModel:
          emit(
            LoadViewState(
              view: CaseDetailsView(componentModel: event.model as CaseModel),
            ),
          );
          break;

        default:
          emit(
            LoadViewState(
              view: CpuDetailsView(componentModel: event.model as CpuModel),
            ),
          );
      }
    }
  }
}
