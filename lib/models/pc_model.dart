
import 'package:permium_parts/models/power_supplies_model.dart';
import 'package:permium_parts/models/storage_model.dart';

import 'case_model.dart';
import 'cooler_model.dart';
import 'cpu_model.dart';
import 'gpu_mdoel.dart';
import 'memories_model.dart';
import 'mother_board_model.dart';

class PcModel {
  int id;
  String title;
  String slug;
  String type;
  CpuModel? cpu;
  CoolerModel? cooler;
  MotherboardModel? motherboard;
  List<MemoriesModel> memory;
  List<StorageModel> storage;
  GpuModel? gpu;
  PowerSuppliesModel? powersupply;
  CaseModel? cases;
  PcModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.type,
    this.cpu,
    this.cooler,
    this.motherboard,
    required this.memory,
    required this.storage,
    this.gpu,
    this.powersupply,
    this.cases,
  });

  factory PcModel.fromMap(Map<String, dynamic> map) {
    return PcModel(
      id: map['id'] as int,
      title: map['title'] as String,
      slug: map['slug'] as String,
      type: map['type'] as String,
      cpu: map['cpus'] != null
          ? CpuModel.fromMap(map['cpus'] as Map<String, dynamic>)
          : null,
      cooler: map['coolers'] != null
          ? CoolerModel.fromMap(map['coolers'] as Map<String, dynamic>)
          : null,
      motherboard: map['motherboards'] != null
          ? MotherboardModel.fromMap(
              map['motherboards'] as Map<String, dynamic>)
          : null,
      memory: List<MemoriesModel>.from(
        (map['memories'] as List<int>).map<MemoriesModel>(
          (x) => MemoriesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      storage: List<StorageModel>.from(
        (map['storages'] as List<int>).map<StorageModel>(
          (x) => StorageModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      gpu: map['gpus'] != null
          ? GpuModel.fromMap(map['gpus'] as Map<String, dynamic>)
          : null,
      powersupply: map['powersupplies'] != null
          ? PowerSuppliesModel.fromMap(
              map['powersupplies'] as Map<String, dynamic>)
          : null,
      cases: map['cases'] != null
          ? CaseModel.fromMap(map['cases'] as Map<String, dynamic>)
          : null,
    );
  }
}
