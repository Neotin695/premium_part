import 'component_model.dart';

class MemoriesModel extends ComponentModel {
  int slot;
  String module;
  String capacity;
  String capacityUnit;
  String casLatency;
  int rgb;
  String color;
  int power;
 
  
  MemoriesModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.slot,
    required this.module,
    required this.capacity,
    required this.capacityUnit,
    required this.casLatency,
    required this.rgb,
    required this.color,
    required super.image,
    required this.power,
    required super.link,
  });

  factory MemoriesModel.fromMap(Map<String, dynamic> json) => MemoriesModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        slot: json["slot"],
        module: json["module"],
        capacity: json["capacity"],
        capacityUnit: json["capacity_unit"],
        casLatency: json["cas_latency"],
        rgb: json["rgb"],
        color: json["color"],
        image: json["image"],
        power: json["power"],
        link: json["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "slot": slot,
        "module": module,
        "capacity": capacity,
        "capacity_unit": capacityUnit,
        "cas_latency": casLatency,
        "rgb": rgb,
        "color": color,
        "image": image,
        "power": power,
        "link": link,
      };
}
