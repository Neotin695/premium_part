import 'package:permium_parts/models/case_model.dart';
import 'package:permium_parts/models/cpu_model.dart';
import 'package:permium_parts/models/gpu_mdoel.dart';
import 'package:permium_parts/models/memories_model.dart';
import 'package:permium_parts/models/mother_board_model.dart';
import 'package:permium_parts/models/power_supplies_model.dart';
import 'package:permium_parts/models/storage_model.dart';

import 'cooler_model.dart';

class SelectedPartModel {
  CpuModel? cpuModel;
  GpuModel? gpuModel;
  MotherboardModel? motherboardModel;
  PowerSuppliesModel? powerSuppliesModel;
  List<MemoriesModel> memoriesModel;
  List<StorageModel> storageModel;
  CaseModel? caseModel;
  CoolerModel? coolerModel;
  SelectedPartModel({
    required this.cpuModel,
    required this.gpuModel,
    required this.motherboardModel,
    required this.powerSuppliesModel,
    required this.memoriesModel,
    required this.storageModel,
    required this.caseModel,
    required this.coolerModel,
  });

  factory SelectedPartModel.fromMap(Map<String, dynamic> map) {
    return SelectedPartModel(
      cpuModel: CpuModel.fromMap(map['cpus'] as Map<String, dynamic>),
      coolerModel: CoolerModel.fromMap(map['coolers'] as Map<String, dynamic>),
      motherboardModel:
          MotherboardModel.fromMap(map['motherboards'] as Map<String, dynamic>),
      memoriesModel:
          List.from(map['memories'].map((e) => MemoriesModel.fromMap(e))),
      storageModel:
          List.from(map['storages'].map((e) => MemoriesModel.fromMap(e))),
      powerSuppliesModel: PowerSuppliesModel.fromMap(
          map['powersupplies'] as Map<String, dynamic>),
      gpuModel: GpuModel.fromMap(map['gpus'] as Map<String, dynamic>),
      caseModel: CaseModel.fromMap(map['cases'] as Map<String, dynamic>),
    );
  }
}
