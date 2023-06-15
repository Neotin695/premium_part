import 'component_model.dart';

class CoolerModel extends ComponentModel {
  int minRpm;
  int maxRpm;
  String manufacturer;
  int rgb;
  int minNoise;
  int maxNoise;
  String color;

  
  CoolerModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.minRpm,
    required this.maxRpm,
    required this.manufacturer,
    required this.rgb,
    required this.minNoise,
    required this.maxNoise,
    required this.color,
    required super.image,
    required super.link,
  });

  factory CoolerModel.fromMap(Map<String, dynamic> json) => CoolerModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        minRpm: json["min_rpm"],
        maxRpm: json["max_rpm"],
        manufacturer: json["Manufacturer"],
        rgb: json["rgb"],
        minNoise: json["min_noise"],
        maxNoise: json["max_noise"],
        color: json["color"],
        image: json["image"],
        link: json["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "min_rpm": minRpm,
        "max_rpm": maxRpm,
        "Manufacturer": manufacturer,
        "rgb": rgb,
        "min_noise": minNoise,
        "max_noise": maxNoise,
        "color": color,
        "image": image,
        "link": link,
      };
}
