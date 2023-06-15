import 'component_model.dart';

class StorageModel extends ComponentModel {
  String type;
  int rpm;
  int capacity;
  int cache;
  String capacityUnit;
  String cacheUnit;
  int m2SlotId;

  StorageModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.type,
    required this.rpm,
    required this.capacity,
    required this.cache,
    required this.capacityUnit,
    required this.cacheUnit,
    required this.m2SlotId,
    required super.image,
    required super.link,
  });

  factory StorageModel.fromMap(Map<String, dynamic> map) => StorageModel(
        id: map["id"],
        title: map["title"],
        slug: map["slug"],
        type: map["type"],
        rpm: map["rpm"] ?? 0,
        capacity: map["capacity"],
        cache: map["cache"],
        capacityUnit: map["capacity_unit"],
        cacheUnit: map["cache_unit"],
        m2SlotId: map["m2slot_id"] ?? 0,
        image: map["image"],
        link: map["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "type": type,
        "rpm": rpm,
        "capacity": capacity,
        "cache": cache,
        "capacity_unit": capacityUnit,
        "cache_unit": cacheUnit,
        "m2slot_id": m2SlotId,
        "image": image,
        "link": link,
      };
}
