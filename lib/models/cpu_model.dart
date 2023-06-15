import 'component_model.dart';

class CpuModel extends ComponentModel {
  int socketId;
  String brand;
  int cores;
  double coreClock;
  double boostClock;
  int power;
  int gpuIncluded;

 
  CpuModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.socketId,
    required this.brand,
    required this.cores,
    required this.coreClock,
    required this.boostClock,
    required this.power,
    required this.gpuIncluded,
    required super.image,
    required super.link,
  });

  factory CpuModel.fromMap(Map<String, dynamic> json) => CpuModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        socketId: json["socket_id"],
        brand: json["brand"],
        cores: json["cores"],
        coreClock: json["core_clock"].toDouble(),
        boostClock: json["boost_clock"].toDouble(),
        power: json["power"],
        gpuIncluded: json["gpu_included"],
        image: json["image"],
        link: json["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "socket_id": socketId,
        "brand": brand,
        "cores": cores,
        "core_clock": coreClock,
        "boost_clock": boostClock,
        "power": power,
        "gpu_included": gpuIncluded,
        "image": image,
        "link": link,
      };
}
