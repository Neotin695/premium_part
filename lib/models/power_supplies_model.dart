import 'component_model.dart';

class PowerSuppliesModel extends ComponentModel {
  int maxPower;
  String efficiency;
  String modular;

  
  PowerSuppliesModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.maxPower,
    required this.efficiency,
    required this.modular,
    required super.image,
    required super.link,
  });

  factory PowerSuppliesModel.fromMap(Map<String, dynamic> json) =>
      PowerSuppliesModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        maxPower: json["max_power"],
        efficiency: json["efficiency"],
        modular: json["modular"],
        image: json["image"],
        link: json["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "max_power": maxPower,
        "efficiency": efficiency,
        "modular": modular,
        "image": image,
        "link": link,
      };
}
