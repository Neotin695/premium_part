class PcModel {
  int id;
  String title;
  String slug;
  String type;
  int caseId;
  int cpuId;
  int cpuCoolerId;
  int motherboardId;
  int memory1Id;
  int? memory2Id;
  int m2Id;
  int? ssdId;
  int? hddId;
  int gpuId;
  int powerSupplyId;
  PcModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.type,
    required this.caseId,
    required this.cpuId,
    required this.cpuCoolerId,
    required this.motherboardId,
    required this.memory1Id,
    required this.memory2Id,
    required this.m2Id,
    required this.ssdId,
    required this.hddId,
    required this.gpuId,
    required this.powerSupplyId,
  });

  factory PcModel.fromMap(Map<String, dynamic> json) => PcModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        type: json["type"],
        caseId: json["case_id"],
        cpuId: json["cpu_id"],
        cpuCoolerId: json["cpu_cooler_id"],
        motherboardId: json["motherboard_id"],
        memory1Id: json["memory1_id"],
        memory2Id: json["memory2_id"],
        m2Id: json["m2_id"],
        ssdId: json["ssd_id"],
        hddId: json["hdd_id"],
        gpuId: json["gpu_id"],
        powerSupplyId: json["power_supply_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "type": type,
        "case_id": caseId,
        "cpu_id": cpuId,
        "cpu_cooler_id": cpuCoolerId,
        "motherboard_id": motherboardId,
        "memory1_id": memory1Id,
        "memory2_id": memory2Id,
        "m2_id": m2Id,
        "ssd_id": ssdId,
        "hdd_id": hddId,
        "gpu_id": gpuId,
        "power_supply_id": powerSupplyId,
      };
}
