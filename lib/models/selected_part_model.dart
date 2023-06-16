// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:permium_parts/models/case_model.dart';
import 'package:permium_parts/models/cpu_model.dart';
import 'package:permium_parts/models/gpu_mdoel.dart';
import 'package:permium_parts/models/memories_model.dart';
import 'package:permium_parts/models/mother_board_model.dart';
import 'package:permium_parts/models/power_supplies_model.dart';
import 'package:permium_parts/models/storage_model.dart';

import 'cooler_model.dart';

class SelectedPartModel {
  CpuModel? cpu;
  CoolerModel? cooler;
  MotherboardModel? motherboard;
  List<MemoriesModel> memory;
  List<StorageModel> storage;
  GpuModel? gpu;
  PowerSuppliesModel? powersupply;
  CaseModel? cases;
  SelectedPartModel({
    this.cpu,
    this.cooler,
    this.motherboard,
    required this.memory,
    required this.storage,
    this.gpu,
    this.powersupply,
    this.cases,
  });

  factory SelectedPartModel.fromMap(Map<String, dynamic> map) =>
      SelectedPartModel(
        cpu: map["cpus"],
        cooler: map["coolers"],
        motherboard: map["motherboards"],
        memory: List<MemoriesModel>.from(
            map["memories"].map((x) => MemoriesModel.fromMap(x))),
        storage: List<StorageModel>.from(
            map["storages"].map((x) => StorageModel.fromMap(x))),
        gpu: map["gpus"],
        powersupply: map["powersupplies"],
        cases: map["cases"],
      );
}
