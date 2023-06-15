import 'component_model.dart';

class GpuModel extends ComponentModel {
  int chipsetId;
  int memory;
  int coreClock;
  int boostClock;
  String memoryType;
  int rgb;
  String color;
  int length;
  int power;
  

  GpuModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.chipsetId,
    required this.memory,
    required this.coreClock,
    required this.boostClock,
    required this.memoryType,
    required this.rgb,
    required this.color,
    required this.length,
    required super.image,
    required this.power,
    required super.link,
  });

  factory GpuModel.fromMap(Map<String, dynamic> map) => GpuModel(
        id: map["id"],
        title: map["title"],
        slug: map["slug"],
        chipsetId: map["chipset_id"],
        memory: map["memory"],
        coreClock: map["core_clock"],
        boostClock: map["boost_clock"],
        memoryType: map["memory_type"],
        rgb: map["rgb"],
        color: map["color"],
        length: map["length"],
        image: map["image"],
        power: map["power"],
        link: map["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "chipset_id": chipsetId,
        "memory": memory,
        "core_clock": coreClock,
        "boost_clock": boostClock,
        "memory_type": memoryType,
        "rgb": rgb,
        "color": color,
        "length": length,
        "image": image,
        "power": power,
        "link": link,
      };
}
